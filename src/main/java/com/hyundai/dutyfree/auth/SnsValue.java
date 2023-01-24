package com.hyundai.dutyfree.auth;

import org.springframework.util.StringUtils;

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
	
	public SnsValue(String service, String clientId, String clientSecret, String redirectUrl) {
		this.service = service;
		this.clientId = clientId;
		this.clientSecret = clientSecret;
		this.redirectUrl = redirectUrl;
		
		this.isNaver = service.equals("naver");
		this.isKakao = service.equals("kakao");
		if(service.equals("naver")) {
			this.api20Instance = NaverAPI20.getInstance();
			this.profileUrl = NAVER_PROFILE_URL;
		}else if(service.equals("kakao")) {
			this.api20Instance = KakaoAPI20.getInstance();
			this.profileUrl = KAKAO_PROFILE_URL;
		}
	}
	
	
	
	
}
