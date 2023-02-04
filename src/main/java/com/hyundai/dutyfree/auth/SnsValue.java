package com.hyundai.dutyfree.auth;

import org.springframework.util.StringUtils;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.AllArgsConstructor;
import lombok.Data;
/**
 * SnsValue
 * 
 * @author 김가희
 * @since 01.19
 * 
 *        
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.19   김가희                         최초 생성
 * 2023.01.20   김가희                         카카오 추가
 * 2023.01.25   김가희                         구글 추가       
 */
@Data
public class SnsValue implements SnsUrls {
	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private DefaultApi20 api20Instance;
	private String profileUrl;
	
	private boolean isNaver;
	private boolean isKakao;
	private boolean isGoogle;
	
	public SnsValue(String service, String clientId, String clientSecret, String redirectUrl) {
		this.service = service;
		this.clientId = clientId;
		this.clientSecret = clientSecret;
		this.redirectUrl = redirectUrl;
		
		this.isNaver = service.equals("naver");
		this.isKakao = service.equals("kakao");
		this.isGoogle = service.equals("google");
		
		if(isNaver) {
			this.api20Instance = NaverAPI20.getInstance();
			this.profileUrl = NAVER_PROFILE_URL;
		}else if(isKakao) {
			this.api20Instance = KakaoAPI20.getInstance();
			this.profileUrl = KAKAO_PROFILE_URL;
		}else if(isGoogle) {
			this.api20Instance = GoogleApi20.instance();
			this.profileUrl = GOOGLE_PROFILE_URL;
		}
	}
	
	
	
	
}
