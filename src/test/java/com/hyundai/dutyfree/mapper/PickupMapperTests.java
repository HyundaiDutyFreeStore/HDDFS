package com.hyundai.dutyfree.mapper;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.dutyfree.vo.MemberInfoVO;
import com.hyundai.dutyfree.vo.PickupCustomerVO;
import com.hyundai.dutyfree.vo.PickupDetailVO;
import com.hyundai.dutyfree.vo.PickupListVO;

import lombok.extern.log4j.Log4j;

/**
 * PickupMapperTests
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
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml"})

public class PickupMapperTests {

	@Autowired
	private PickupMapper mapper;
	
	private String oid = "OR20230122203318";
	private String pcode = "106680600008";
	
	
	// 주문 목록 조회
	@Test
	public void PickupListTest() {
		List<PickupListVO> list = mapper.PickupList(oid);
		System.out.println("list : "+ list);
		log.info(list);
	}
	
	//인도 완료
	@Test
	public void Pickupcomplete() {
		mapper.pickupcomplete(oid);
	}
	
	// 고객정보 조회
	@Test
	public void memberinfo() {
		MemberInfoVO MI = mapper.memberinfo(oid);
		log.info(MI);
	}
	
	//상품상세정보조회
	@Test
	public void PickupDetail() {
		PickupDetailVO PD = mapper.PickupDetail(pcode);
		log.info(PD);
	}
	
	//인도 예정인 고객의 수를 시간별로 보여주는 기능
	@Test
	public void getCustomerPerTime() {
		List<PickupCustomerVO> LPC = mapper.getCustomerPerTime();
		log.info(LPC);
	}
	
}
