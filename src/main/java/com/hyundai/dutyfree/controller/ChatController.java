package com.hyundai.dutyfree.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.service.OrderService;
import com.hyundai.dutyfree.vo.CustomerVO;
import com.hyundai.dutyfree.vo.MemberVO;

import lombok.extern.log4j.Log4j;

/**
 * ChatController
 * 
 * @author 김가희
 * @since 01.24
 * 
 *        
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.24   김가희                         최초 생성
 */
@Controller
@Log4j
@RequestMapping("/chat")
public class ChatController {
	@Autowired
	private MemberService memberService;
	@Autowired
	OrderService orderservice;

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

	@GetMapping("/chatMenu")
	public void chatMenu() {
		log.info("채팅메뉴로이동");
	}

	@GetMapping("/customerCnt")
	public void customerCnt(@RequestParam("date") String date, Model model) {
		log.info("고객수 확인 " + date);
		// List<CustomerVO> getCustomerPerTime;
		List<CustomerVO> getCustomerPerTime1 = orderservice.getCustomerPerTime("ICNT1", date);
		// model.addAttribute("ICNT1",getCustomerPerTime);
		// log.info("ICNT1"+getCustomerPerTime);
		List<CustomerVO> getCustomerPerTime2 = orderservice.getCustomerPerTime("ICNT2", date);
		// model.addAttribute("ICNT2"+getCustomerPerTime);
		// log.info("ICNT1"+getCustomerPerTime);
		List<CustomerVO> getCustomerPerTime3 = orderservice.getCustomerPerTime("GMP", date);
		// model.addAttribute("GMP",getCustomerPerTime);
		// log.info("GMP"+getCustomerPerTime);

		int[][] cnt = new int[24][3];
		for (int i = 0; i < 24; i++) {
			cnt[i][0] = getCustomerPerTime1.get(i).getCount();
		}
		for (int i = 0; i < 24; i++) {
			cnt[i][1] = getCustomerPerTime2.get(i).getCount();
		}
		for (int i = 0; i < 24; i++) {
			cnt[i][2] = getCustomerPerTime3.get(i).getCount();
		}
		System.out.println(cnt[16][2]);
		model.addAttribute("cnt",cnt);
	}

	// 고객이 1대1채팅 메뉴 눌렀을 때
	@GetMapping("/customerChat")
	public void customerChat(@RequestParam("adminId") String adminId, @RequestParam("myId") String myId, Model model)
			throws Exception {
		// 고객 정보 담기
		MemberVO myInfo = memberService.read(myId);
		// 관리자 정보 담기
		MemberVO adminInfo = memberService.read(adminId);
		log.info("컨트롤러에서 관리자정보:" + adminInfo);
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("adminInfo", adminInfo);
	}

}
