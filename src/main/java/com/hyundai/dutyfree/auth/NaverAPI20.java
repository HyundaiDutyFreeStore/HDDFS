package com.hyundai.dutyfree.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;
/**
 * NaverAPI20
 * 
 * @author 김가희
 * @since 01.19
 * 
 *        
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.19   김가희                         최초 생성
 *        
 */
public class NaverAPI20 extends DefaultApi20 implements SnsUrls {
	private NaverAPI20() {
	}
	
	private static class InstanceHolder {
		private static final NaverAPI20 INSTANCE = new NaverAPI20();
	}
	
	public static NaverAPI20 getInstance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return NAVER_ACCESS_TOKEN;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return NAVER_AUTH;
	}
	
	
}
