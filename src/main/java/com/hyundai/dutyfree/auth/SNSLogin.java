package com.hyundai.dutyfree.auth;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth1RequestToken;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.hyundai.dutyfree.vo.MemberVO;

public class SNSLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;

	public SNSLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId()).apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl()).scope("profile").build(sns.getApi20Instance());
		this.sns = sns;
	}

	public String getNaverAuthLogin() {
		return this.oauthService.getAuthorizationUrl();
	}
	
	public MemberVO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	}

	private MemberVO parseJson(String body) throws Exception {
		System.out.println("=========================\n"+body+"\n=================");
		MemberVO member = new MemberVO();
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			member.setMid(resNode.get("id").asText());
			member.setMname(resNode.get("name").asText());
			member.setMphone(resNode.get("mobile").asText());
			member.setMgender(resNode.get("gender").asText());
			//member.setNickname(resNode.get("nickname").asText());
			member.setMemail(resNode.get("email").asText());
		}
		return member;
	}

}
