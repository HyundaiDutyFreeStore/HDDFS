package com.hyundai.dutyfree.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.dutyfree.vo.OrderMemberVO;

/**
 * CountCustomerTest
 * 
 * @author 김찬중
 * @since 01.20
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.20    김찬중                         최초 생성
 * 2023.01.26    김찬중                        인도장 이용 예정 고객 리스트 추가
 *        </pre>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CountCustomerTest {

	@Autowired
	private OrderMapper ordermapper; // MemberMapper.java 인터페이스 의존성 주입

	/*
	 * @Test public void getConfFut() {
	 * 
	 * // List<CustomerVO> getCustomerPerTime = //
	 * orderservice.getCustomerPerTime(request.getParameter("odeptdate"));
	 * List<CustomerVO> getCustomerPerTime = ordermapper.getCustomerPerTime("ICNT1",
	 * "20230125"); JSONObject jsonObj = new JSONObject(); // 시간대별 인원 for (int i =
	 * 0; i < 24; i++) { jsonObj.put(String.valueOf(i),
	 * getCustomerPerTime.get(i).getCount()); } String json = jsonObj.toString();
	 * System.out.println(json); }
	 */
	
	@Test
	public void getConfFut() {
		List<OrderMemberVO> OrderMemberCheck = ordermapper.OrderMemberCheck();
		for(int i=0;i<OrderMemberCheck.size();i++) {
			System.out.println(OrderMemberCheck.get(i).toString());
		}
	}

}