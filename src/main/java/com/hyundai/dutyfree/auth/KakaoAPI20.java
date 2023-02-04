package com.hyundai.dutyfree.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;
/**
 * KakaoAPI20
 * 
 * @author 김가희
 * @since 01.20
 * 
 *        
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.20   김가희                         최초 생성
 *        
 */
public class KakaoAPI20 extends DefaultApi20 implements SnsUrls {
	public KakaoAPI20() {
	}
	
	private static class InstanceHolder {
		private static final KakaoAPI20 INSTANCE = new KakaoAPI20();
	}
	
	public static KakaoAPI20 getInstance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return KAKAO_ACCESS_TOKEN;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return KAKAO_AUTH;
	}

}
