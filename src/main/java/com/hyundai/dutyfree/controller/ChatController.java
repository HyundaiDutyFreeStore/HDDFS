package com.hyundai.dutyfree.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyundai.dutyfree.security.domain.CustomUser;
import com.hyundai.dutyfree.vo.MemberVO;

import lombok.extern.log4j.Log4j;

/**
 * ChatController
 * 
 * @author 김가희
 * @since 01.24
 * 
 * 
 *        수정일 수정자 수정내용 ---------- --------------- ---------------------------
 *        2023.01.24 김가희 최초 생성
 * 
 */
@Controller
@Log4j
@RequestMapping("/chat")
public class ChatController {
	@GetMapping("/start")
	public void start() {
		log.info("챗봇시작화면");
	}

	@GetMapping("/chat")
	public void chat(Model model) {

		MemberVO user = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getMname());

		model.addAttribute("userid", user.getMid());
	}
	

}
