package com.hyundai.dutyfree.mapper;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.PassportVO;

import lombok.extern.log4j.Log4j;

/**
 * OrderMapperTests
 * 
 * @author 박진수
 * @since 01.13
 * 
 *        <pre>
 * 수정일                 수정자                                  수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.13   박진수                               최초 생성
 *        </pre>
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml" })
@Log4j
public class OrderMapperTests {

	@Autowired
	private MemberMapper membermapper; // MemberMapper.java 인터페이스 의존성 주입
	
	@Autowired
	private OrderMapper ordermapper;
	
	//여권등록 테스트
	@Test
	public void insertPassportTest() throws Exception {
		PassportVO passport=new PassportVO();
		
		passport.setMid("test1");
		passport.setPassportno("m12345678");
		passport.setSurname("park");
		passport.setGivenname("jinsu");
		passport.setPgender("M");
		Date DatemBirth = Date.valueOf("2023-01-31");
		passport.setPbirth(DatemBirth);
		passport.setNationality("한국");
		Date DatemPsptexdit = Date.valueOf("2023-02-01");
		passport.setExpirydate(DatemPsptexdit);

		ordermapper.insertPassport(passport);
	}
	
	//여권정보 조회 테스트
	@Test
	public void PassportConsist() {
			
		System.out.println(ordermapper.PassportConsist("test1").toString());
			
	}
	
	//주문리스트의 상품을 등록 테스트
	@Test
	public void InserorderitemTest() {
		OrderItemVO orderitem = new OrderItemVO();
		orderitem.setPcode("102370300283");
		orderitem.setOamount(1);
		orderitem.setOid("OS12345678");
		ordermapper.Insertorderitem(orderitem);
	}
	
	//주문리스트 정보를 등록 테스트
	@Test
	public void InsertorderlistTest() {
			OrderListVO olv = new OrderListVO();
			olv.setOid("OS12345678");
			olv.setMid("test1");
			olv.setOhpoint(100);
			olv.setOstatus("ENABLED");
			olv.setOdeptdate("2023-05-23");
			olv.setOplnum("미국");
			olv.setOelnum("010-2366-5058");
			olv.setOdept("한국");
			olv.setOtotal(10000);
			ordermapper.Insertorderlist(olv);
		}
	
	//회원의 적립금 및 포인트를 수정 테스트
	@Test
	public void updateTotalandMhpointTest() {
			MemberVO member = new MemberVO();
			member.setMid("test1");
			member.setMhpoint(10000);
			member.setMtotal(10000);
			ordermapper.updateTotalandMhpoint(member);
	}
	
	//주문번호에 대한 주문리스트의 상품을 조회 테스트
	@Test
	public void getOrderitemlistTest(){
		System.out.println(ordermapper.getOrderitemlist("OS12345678").toString());
	}
	
	//상품을 담은 주문리스트를 조회 테스트
	@Test
	public void getorderlistTest(){
		System.out.println(ordermapper.getorderlist("test1").toString());	
	}
	
	//주문리스트를 정렬을 통해 조회 테스트
	@Test
	public void getorderlistBymidTest() {
			HashMap<String, String> listMap = new HashMap<>();
			listMap.put("mid", "test1");
			listMap.put("align", "odeptdate");
			System.out.println(ordermapper.getorderlistBymid(listMap).toString());
	}
	
	//주문리스트를 삭제 테스트
	@Test
	public void deleteorderTest(String oid) {
		 ordermapper.deleteorder("OS12345678");
	}
	
	//주문리스트의 현재 상황을 수정 테스트
	@Test
	public void UpdateostatusTest() {
			ordermapper.Updateostatus("ENABLED", "OS12345678");

	}
	
	//주문리스트에 대해 결제 코드를 저장
	@Test
	public void UpdateorderPaymentKeyTest() {
			ordermapper.UpdateorderPaymentKey("pay1234567", "OS12345678");
	}
	

}