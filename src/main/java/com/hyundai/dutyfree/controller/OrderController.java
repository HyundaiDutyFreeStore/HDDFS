package com.hyundai.dutyfree.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@GetMapping("/orderpay")
	public void orderpay() {
	}
	
	@GetMapping("DepartureInfo")
	public void DepartureInfo() {
		
	}
	
	@GetMapping("PassportInfo")
	public void PassportInfo() {
		
	}
	
	
}
