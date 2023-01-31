package com.hyundai.dutyfree.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyundai.dutyfree.service.AlarmService;
import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.service.ProductService;
import com.hyundai.dutyfree.vo.AlarmVO;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.ProductVO;

import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;

@Log4j
@Controller
@RequestMapping("/alarm")
public class AlarmController {
	@Autowired
	public AlarmService alarmService;
	@Autowired
	public MemberService memberService;
	@Autowired
	public ProductService prodService;

	@GetMapping(value = "/register")
	public void prodAlarm(@RequestParam("pcode") String pcode, Principal prin, Model model) throws Exception {
		System.out.println(prin.getName() + "님이 상품" + pcode + " 에대해 재입고 알림을 신청");
		MemberVO member = memberService.read(prin.getName());
		String mphone = "";
		if (member.getMphone() != null) {
			mphone = member.getMphone();
		}
		System.out.println(mphone);
		model.addAttribute("mphone", mphone);
		model.addAttribute("pcode", pcode);
	}

	@PostMapping(value = "/insert")
	public void insertAlaram(@RequestParam("pcode") String pcode, @RequestParam("mophNo1") String mphone1,
			@RequestParam("mophNo2") String mphone2, @RequestParam("mophNo3") String mphone3, Principal prin,
			Model model) {
		String mphone = mphone1 + mphone2 + mphone3;
		log.info("컨트롤러에서 핸드폰번호: " + mphone);
		alarmService.insertAlarm(pcode, prin.getName(), mphone);
		log.info("알람인서트 완료!");
		ProductVO prod = prodService.productdetail(pcode);
		model.addAttribute("product", prod);
		model.addAttribute("mphone", mphone);
	}

	@PostMapping(value = "/sendSms")
	public void sendSms(@RequestParam("pcode") String pcode) throws Exception {
		System.out.println("문자전송옴");

		List<AlarmVO> list = alarmService.getAlarmList(pcode);
		ProductVO prod = prodService.productdetail(pcode);
		System.out.println(prod.getPname() + "상품에 대해 재입고 알람전송");

		// 문자전송
		String api_key = "NCSNHVRADOQEC6WK";
		String api_secret = "BW8GLELCO6OFENG8JM1QIZGZECRUH79W";
		Message coolsms = new Message(api_key, api_secret);

		for (AlarmVO vo : list) {
			System.out.println(vo.getMid() + " " + vo.getMphone());
			HashMap<String, String> set = new HashMap<String, String>();
			set.put("to", vo.getMphone()); // 수신번호
			set.put("from", "01065433839"); // 발신번호
			set.put("text", vo.getPcode()+" 상품 재입고 알림입니다."); // 문자내용
			set.put("type", "sms"); // 문자 타입
			set.put("app_version", "test app 1.2");

			System.out.println(set);

			JSONObject obj = (JSONObject) coolsms.send(set);
			System.out.println(obj.toString());
		}

		
		
	}

}
