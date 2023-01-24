package com.hyundai.dutyfree.security;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import lombok.extern.log4j.Log4j;
/**
 * CustomLoginFailureHandler
 * 
 * @author 김가희
 * @since 01.17
 * 
 *        
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.17    김가희                        최초 생성
 *        
 */
@Log4j
public class CustomLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		//String errorMessage = "아이디 또는 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
		//String error = yes;
		log.info("로그인실패");
		//errorMessage = URLEncoder.encode(errorMessage, "UTF-8"); /* 한글 인코딩 깨진 문제 방지 */
	    setDefaultFailureUrl("/member/login?error=yes");
	    super.onAuthenticationFailure(request,response,exception);
	}
}
