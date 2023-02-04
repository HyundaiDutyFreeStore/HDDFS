package com.hyundai.dutyfree.mapper;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.dutyfree.vo.CartVO;
import com.hyundai.dutyfree.vo.CouponVO;
import com.hyundai.dutyfree.vo.ProductVO;

import lombok.extern.log4j.Log4j;

/**
 * CartMapperTests
 * 
 * @author 박진수
 * @since 01.15
 * 
 *        <pre>
 * 수정일                 수정자                                  수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.15   박진수                               최초 생성
 *        </pre>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml" })
@Log4j
public class CouponMapperTests {

	@Autowired
	private CouponMapper couponmapper;

	// 쿠폰을 입력하는 테스트
	@Test
	public void MemberInsertCouponTests() { 
		HashMap<String, String> listMap = new HashMap<>();
		CouponVO coupon=new CouponVO();
		java.util.Date date = new java.util.Date();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String cid="COUSAV20230201095850";
		String mid="test1";
		String align="hprice";
		String datestr = simpleDateFormat.format(date);
		double KRW_WON=1267.0;
		couponmapper.MemberInsertCoupon(cid,mid, "SAV20230129",datestr,"Cenabled");
		log.info("쿠폰 입력");
	}
	
	//쿠폰의 정보를 조회하는 테스트
	@Test
	public void GetEventInfoTests() {
		log.info(couponmapper.GetEventInfo("SAV20230129"));
	}

	//회원의 쿠폰을 조회하는 테스트
	@Test 
	public void GetCouponInfoTests() { 
	  log.info(couponmapper.GetCouponInfo("test1"));
	}
	 

	//쿠폰을 사용한 주문번호를 등록하는 테스트
	@Test
	public void UpdateCouponOidTests() {
		couponmapper.UpdateCouponOid("OR20230201162047", "COUSAV20230201095854");
		log.info("쿠폰의 주문번호 등록");
	}

	//쿠폰에 대한 사용여부를 확인
	@Test
	public void UpdateCenabledTests() {
		couponmapper.UpdateCenabled("ENABLED", "COUSAV20230201095854");
		log.info("쿠폰 사용여부 변경");
	}


}
