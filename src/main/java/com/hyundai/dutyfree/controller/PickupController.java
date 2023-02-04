package com.hyundai.dutyfree.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.hyundai.dutyfree.service.PickupService;
import com.hyundai.dutyfree.vo.MemberInfoVO;
import com.hyundai.dutyfree.vo.PickupCustomerVO;
import com.hyundai.dutyfree.vo.PickupDetailVO;
import com.hyundai.dutyfree.vo.PickupListVO;

import lombok.extern.log4j.Log4j;

@RequestMapping("/pickup")
@RestController
@Log4j
public class PickupController {
	
	@Autowired
	private PickupService service;
	
	
	@GetMapping(value	="/pickuplist", produces = "text/plain; charset=UTF-8")
	public String pickup(@RequestParam String oid){
		Gson gson = new Gson();
		log.info(oid);
		String transoid = oid.replaceAll("\"","");
		log.info(transoid);
		List<PickupListVO> orderList = service.PickupList(transoid);
		log.info(orderList);
		return gson.toJson(orderList);
	}
	
	@GetMapping(value ="/pickupdetail", produces = "text/plain; charset=UTF-8")
	public String pickupdetail(@RequestParam String pcode){
		Gson gson = new Gson();
		log.info(pcode);
		String transpcode = pcode.replaceAll("\"","");
		log.info(transpcode);
		PickupDetailVO detailList = service.PickupDetail(transpcode);
		log.info(detailList);
		return gson.toJson(detailList);
	}
	
	
	@GetMapping(value ="/memberinfo", produces = "text/plain; charset=UTF-8")
	public String memberinfo(@RequestParam String oid){
		Gson gson = new Gson();
		log.info(oid);
		String transoid = oid.replaceAll("\"","");
		log.info(transoid);
		MemberInfoVO memberinfo = service.memberinfo(transoid);
		log.info(memberinfo);
		return gson.toJson(memberinfo);
	}
	
	@GetMapping("/pickupcomplete")
	public String pickupok(@RequestParam String oid) {
		String transoid = oid.replaceAll("\"","");
		service.pickupcomplete(transoid);
		return "PickUpComplete";
	}
	
	@GetMapping(value="/getCustomerPerTime", produces = "text/plain; charset=UTF-8")
	public String getCustomerPerTime(){
		Gson gson = new Gson();
		List<PickupCustomerVO> CustomerList = service.getCustomerPerTime();
		log.info(CustomerList);
		return gson.toJson(CustomerList);
	}
	
	
}
