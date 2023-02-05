
package com.hyundai.dutyfree.controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyundai.dutyfree.auth.SNSLogin;
import com.hyundai.dutyfree.auth.SnsValue;
import com.hyundai.dutyfree.security.CustomUserDetailsService;
import com.hyundai.dutyfree.service.CouponService;
import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.vo.EventVO;
import com.hyundai.dutyfree.vo.MemberVO;

import lombok.extern.log4j.Log4j;
/**
 * AuthController
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
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	@Autowired
	private SnsValue googleSns;
	
	@Autowired
	private CouponService couponservice;

	//소셜로그인 콜백처리 (소셜로그인에서 성공적으로 콜백이 왔을 때 해당 회원이 없으면 가입시키고, 있으면 그 아이디로 로그인시키기)
		@RequestMapping(value = "/auth/{snsService}/callback", method = {RequestMethod.GET, RequestMethod.POST  })
		public String snsLoginCallback(@PathVariable String snsService, Model model, @RequestParam String code,
				HttpSession session,RedirectAttributes ra) throws Exception {
			System.out.println("콜백시 code="+code);
			log.info("snsLoginCallback: service: "+snsService);
			SnsValue sns = null;
			if (snsService.equals("naver")) {
				sns = naverSns;
			}else if (snsService.equals("kakao")) {
				sns = kakaoSns;
			}else if (snsService.equals("google")) {
				sns = googleSns;
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
				
				MemberVO member=memberservice.read(snsUser.getMid());
				java.util.Date date = new java.util.Date();
				
				java.util.Date savdate = new java.util.Date();
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
				String cid = "COUSAV" + simpleDateFormat.format(savdate);
				simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
				String datestr = simpleDateFormat.format(date);
				
				//회원가입시 쿠폰을 등록
				couponservice.MemberInsertCoupon(cid,member.getMid(), "SAV20230129",datestr);
				EventVO event=couponservice.GetEventInfo("SAV20230129");
				member.setMhpoint(event.getEsale());
				member.setMtotal(0);
				memberservice.updateMhpoint(member);
				
				java.util.Date disdate = new java.util.Date();
				simpleDateFormat=new SimpleDateFormat("yyyyMMddHHmmss");
				cid = "COUDIS"+simpleDateFormat.format(disdate);
				
				couponservice.MemberInsertCoupon(cid,snsUser.getMid(), "DIS20230129",datestr);
				
				ra.addFlashAttribute("couponaccess", "coupon");
				
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
			
			String prevPage = (String)session.getAttribute("prevPage");
			prevPage = prevPage.substring(21);
			log.info("소셜로그인 이전페이지: "+prevPage);

			return "redirect:"+prevPage;
		}

}
