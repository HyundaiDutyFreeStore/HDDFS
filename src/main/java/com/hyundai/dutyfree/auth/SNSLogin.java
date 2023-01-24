package com.hyundai.dutyfree.auth;

import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.hyundai.dutyfree.vo.MemberVO;
/**
 * SNSLogin
 * 
 * @author 김가희
 * @since 01.19
 * 
 *        
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.19   김가희                         최초 생성
 * 2023.01.20   김가희                         카카오 추가
 *        
 */
public class SNSLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;

	public SNSLogin(SnsValue sns) {
		if (sns.isNaver()) {
			this.oauthService = new ServiceBuilder(sns.getClientId()).apiSecret(sns.getClientSecret())
					.callback(sns.getRedirectUrl()).scope("profile").build(sns.getApi20Instance());
		} else if (sns.isKakao()) {
			this.oauthService = new ServiceBuilder(sns.getClientId()).apiSecret(sns.getClientSecret())
					.callback(sns.getRedirectUrl()).build(sns.getApi20Instance());
		}

		this.sns = sns;
	}

	public String getAuthLogin() {
		System.out.println("getAuthLogin");
		return this.oauthService.getAuthorizationUrl();
	}

	public MemberVO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		System.out.println("accessToken: " + accessToken);
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);

		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	}

	public String getUserProfile2(String code) throws Exception {
		// POST 방식으로 key=value 데이터를 요청 (카카오쪽으로)
		// 이 때 필요한 라이브러리가 RestTemplate, 얘를 쓰면 http 요청을 편하게 할 수 있다.
		RestTemplate rt = new RestTemplate();

		// HTTP POST를 요청할 때 보내는 데이터(body)를 설명해주는 헤더도 만들어 같이 보내줘야 한다.
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

		// body 데이터를 담을 오브젝트인 MultiValueMap를 만들어보자
		// body는 보통 key, value의 쌍으로 이루어지기 때문에 자바에서 제공해주는 MultiValueMap 타입을 사용한다.
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", this.sns.getClientId());
		params.add("redirect_uri", this.sns.getRedirectUrl());
		params.add("code", code);

		// 요청하기 위해 헤더(Header)와 데이터(Body)를 합친다.
		// kakaoTokenRequest는 데이터(Body)와 헤더(Header)를 Entity가 된다.
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// POST 방식으로 Http 요청한다. 그리고 response 변수의 응답 받는다.
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", // https://{요청할 서버 주소}
				HttpMethod.POST, // 요청할 방식
				kakaoTokenRequest, // 요청할 때 보낼 데이터
				String.class // 요청 시 반환되는 데이터 타입
		);
		System.out.println("응답결과: " + response.getBody());

		// JSON -> 액세스 토큰 파싱
		String tokenJson = response.getBody();
		JSONObject rjson = new JSONObject(tokenJson);
		String accessToken = rjson.getString("access_token");

		return accessToken;
	}

	private MemberVO parseJson(String body) throws Exception {
		MemberVO member = new MemberVO();
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);

		JsonNode resNode = rootNode.get("response");
		member.setMid(resNode.get("id").asText());
		member.setMname(resNode.get("name").asText());
		member.setMphone(resNode.get("mobile").asText());
		member.setMgender(resNode.get("gender").asText());
		// member.setNickname(resNode.get("nickname").asText());
		member.setMemail(resNode.get("email").asText());

		return member;
	}

	public MemberVO getUserInfoByToken(String accessToken) {
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + accessToken);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		RestTemplate rt = new RestTemplate();
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers);

		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response = rt.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest, String.class);

		MemberVO member = new MemberVO();
		JSONObject body = new JSONObject(response.getBody());
		System.out.println("불러오는영역: " + body);
		String id = body.getLong("id")+"";
		member.setMid(id);
		String email = body.getJSONObject("kakao_account").getString("email");
		member.setMemail(email);
		String nickname = body.getJSONObject("properties").getString("nickname");
		member.setMname(nickname);
		String gender = body.getJSONObject("kakao_account").getString("gender");
		member.setMgender(gender);
		member.setMphone("");

		return member;
	}
}
