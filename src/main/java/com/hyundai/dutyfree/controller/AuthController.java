
package com.hyundai.dutyfree.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyundai.dutyfree.auth.SNSLogin;
import com.hyundai.dutyfree.auth.SnsValue;
import com.hyundai.dutyfree.security.CustomUserDetailsService;
import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AuthController {
	@Autowired
	private MemberService memberservice;

	@Autowired
	private CustomUserDetailsService userDetailsService;

	@Autowired
	private SnsValue naverSns;
	
	@Autowired
	private SnsValue kakaoSns;

	//소셜로그인 콜백처리 (소셜로그인에서 성공적으로 콜백이 왔을 때 해당 회원이 없으면 가입시키고, 있으면 그 아이디로 로그인시키기)
		@RequestMapping(value = "/auth/{snsService}/callback", method = {RequestMethod.GET, RequestMethod.POST  })
		public String snsLoginCallback(@PathVariable String snsService, Model model, @RequestParam String code,
				HttpSession session) throws Exception {
			System.out.println("콜백시 code="+code);
			log.info("snsLoginCallback: service: "+snsService);
			SnsValue sns = null;
			if (snsService.equals("naver")) {
				sns = naverSns;
			}else if (snsService.equals("kakao")) {
				sns = kakaoSns;
			}
				
			MemberVO snsUser = new MemberVO();
			String accessToken = null;
			// 1. code를 이용해서 access_token 받기
			// 2. access_token을 이용해서 사용자 profile 정보 가져오기
			SNSLogin snsLogin = new SNSLogin(sns);
			if (snsService.equals("kakao")) {
				accessToken = snsLogin.getUserProfile2(code);
				System.out.println("kakao여서 accessToken: "+accessToken);
				snsUser = snsLogin.getUserInfoByToken(accessToken);
			}else {
				snsUser = snsLogin.getUserProfile(code);
			}
			
			log.info("Profile>>" + snsUser);
			snsUser.setMpassword("123456");
			
			// 3. DB 해당 유저가 존재하는 체크
			int cnt = memberservice.idCheck(snsUser.getMid());
			// 존재하지 않는다면 회원가입
			if (cnt == 0) {
				System.out.println("존재하지 않는 사용자");
				memberservice.memberJoin(snsUser); // 가입하기
				System.out.println("가입완료");
			}
			
			// 존재하지 않았다면 가입시키고, 존재한다면 해당 아이디로 강제 로그인시키기
			UserDetails ckUserDetails = userDetailsService.loadUserByUsername(snsUser.getMid());
			Authentication authentication = new UsernamePasswordAuthenticationToken(ckUserDetails, snsUser.getMpassword(),
					ckUserDetails.getAuthorities());

			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(authentication);
			session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
			session.setAttribute("kakaoToken", accessToken);

			return "redirect:/";
		}

}
