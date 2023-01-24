package com.hyundai.dutyfree.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/chat")
public class ChatController {
	@GetMapping("/start")
	public void start() {
		log.info("챗봇시작화면");
	}

}
