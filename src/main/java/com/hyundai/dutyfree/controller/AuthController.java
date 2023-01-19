package com.hyundai.dutyfree.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyundai.dutyfree.auth.SNSLogin;
import com.hyundai.dutyfree.auth.SnsValue;
import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.vo.MemberVO;

@Controller
public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private SnsValue naverSns;

	@RequestMapping(value = "/auth/{snsService}/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String snsLoginCallback(@PathVariable String snsService, Model model, @RequestParam String code,
			HttpSession session) throws Exception {

		logger.info("snsLoginCallback: service={}", snsService);
		SnsValue sns = null;
		if (snsService.equals("naver"))
			sns = naverSns;

		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(sns);

		MemberVO snsUser = snsLogin.getUserProfile(code); // 1,2번 동시
		System.out.println("Profile>>" + snsUser);
		snsUser.setMpassword("123456");
		// 3. DB 해당 유저가 존재하는 체크 (googleid, naverid 컬럼 추가) 
		int cnt = memberservice.idCheck(snsUser.getMid());
		
		if (cnt == 0) {
			System.out.println("존재하지 않는 사용자");
			model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해 주세요.");
			memberservice.memberJoin(snsUser); //가입하기
			System.out.println("가입완료");
		}else {
			model.addAttribute("result", "이미 가입한 사용자");
		}

		/*
		 * //미존재시 가입페이지로!!
		 * 
		 * } else { model.addAttribute("result", user.getUname() + "님 반갑습니다.");
		 * 
		 * // 4. 존재시 강제로그인 session.setAttribute(SessionNames.LOGIN, user); }
		 */

		return "/loginResult";
	}

}
