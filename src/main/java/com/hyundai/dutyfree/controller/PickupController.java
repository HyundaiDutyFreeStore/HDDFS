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


/**
 * PickupController
 *
 * @author 김민규
 * @since 01.20
 *
 *  
 * 수정일                 수정자                          수정내용
 * ----------  ---------------      ---------------------------
 * 2023.01.20         김민규                 		최초 생성
 * 2023.01.23	    김민규			 		주문목록 조회, 인도완료
 * 2023.01.30	    김민규			 		주문목록 조회 출력 컬럼 변경, 인도완료  OSTATUS 변경
 * 2023.01.31	    김민규			 		액티비티와 VO 구성 변경으로 인한 변경, 주문목록과 고객정보 분리
 * 2023.02.01	    김민규			 		제품 상세 화면
 * 2023.02.02	    김민규			 		금일 인도중 상태인 고객의 수를 시간별로 보여주는 기능
 *     
 */


@RequestMapping("/pickup")
@RestController
public class PickupController {
	
	@Autowired
	private PickupService service;
	
	// 주문목록 조회
	@GetMapping(value="/pickuplist", produces = "text/plain; charset=UTF-8")
	public String pickup(@RequestParam String oid){
		Gson gson = new Gson();
		String transoid = oid.replaceAll("\"","");
		List<PickupListVO> orderList = service.PickupList(transoid);
		return gson.toJson(orderList);
	}
	
	// 인도완료 기능
	@GetMapping("/pickupcomplete")
	public String pickupok(@RequestParam String oid) {
			String transoid = oid.replaceAll("\"","");
			service.pickupcomplete(transoid);
			return "PickUpComplete";
		}
	
	// 고객정보 조회
	@GetMapping(value ="/memberinfo", produces = "text/plain; charset=UTF-8")
	public String memberinfo(@RequestParam String oid){
		Gson gson = new Gson();
		String transoid = oid.replaceAll("\"","");
		MemberInfoVO memberinfo = service.memberinfo(transoid);
		return gson.toJson(memberinfo);
	}
	
	// 상품상세정보조회
	@GetMapping(value ="/pickupdetail", produces = "text/plain; charset=UTF-8")
	public String pickupdetail(@RequestParam String pcode){
		Gson gson = new Gson();
		String transpcode = pcode.replaceAll("\"","");
		PickupDetailVO detailList = service.PickupDetail(transpcode);
		return gson.toJson(detailList);
	}
	
	// 인도 예정인 고객의 수를 시간별로 보여주는 기능
	@GetMapping(value="/getCustomerPerTime", produces = "text/plain; charset=UTF-8")
	public String getCustomerPerTime(){
		Gson gson = new Gson();
		List<PickupCustomerVO> CustomerList = service.getCustomerPerTime();
		return gson.toJson(CustomerList);
	}
	
	
}
