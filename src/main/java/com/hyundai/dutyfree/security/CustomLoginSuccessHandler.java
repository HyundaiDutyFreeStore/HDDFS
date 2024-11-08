package com.hyundai.dutyfree.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.log4j.Log4j;

/**
 * CustomLoginSuccessHandler
 * 
 * @author 김가희
 * @since 01.17
 * 
 *        
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.17    김가희                        최초 생성
 * 2023.01.29    김가희                        관리자 추가
 *        
 */
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	private final RequestCache requestCache = new HttpSessionRequestCache();
	private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		List<String> roleNames = new ArrayList<>();
		log.warn("로그인성공");

		auth.getAuthorities().forEach(autho -> {
			roleNames.add(autho.getAuthority());
		});

		log.warn("ROLE NAMES: " + roleNames);

		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin/index");
			return;
		} else if (roleNames.contains("ROLE_MEMBER")) {

			clearSession(request);

			SavedRequest savedRequest = requestCache.getRequest(request, response);
			log.info("savedRequest: " + savedRequest);

			/**
			 * prevPage가 존재하는 경우 = 사용자가 직접 /auth/login 경로로 로그인 요청 기존 Session의 prevPage
			 * attribute 제거
			 */
			String prevPage = (String) request.getSession().getAttribute("prevPage");
			if (prevPage != null) {
				request.getSession().removeAttribute("prevPage");
			}

			// 기본 URI
			String uri = "/";

			/**
			 * savedRequest 존재하는 경우 = 인증 권한이 없는 페이지 접근 Security Filter가 인터셉트하여 savedRequest에
			 * 세션 저장
			 */
			if (savedRequest != null) {
				log.info("인터셉터에 의해 가로채짐!!");
				uri = savedRequest.getRedirectUrl();
			} else if (prevPage != null && !prevPage.equals("")) {
				// 회원가입 - 로그인으로 넘어온 경우 "/"로 redirect
				if (prevPage.contains("/member/done") || prevPage.contains("/member/mbshInformation") || prevPage.contains("/chat/start") ) {
					uri = "/";
				} else {
					uri = prevPage;
				}
			}
			log.info("success Handler에서 이동시킬 페이지: " + uri);
			redirectStrategy.sendRedirect(request, response, uri);
			return;
		}

		/* response.sendRedirect("/"); */

	}

	// 로그인 실패 후 성공 시 남아있는 에러 세션 제거
	protected void clearSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
	}

}
