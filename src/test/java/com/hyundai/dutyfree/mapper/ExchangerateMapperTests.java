package com.hyundai.dutyfree.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.dutyfree.vo.ExchangerateVO;

/**
 * MemberVO
 * 
 * @author 김찬중
 * @since 01.09
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.09    김찬중                         최초 생성
 *        </pre>
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ExchangerateMapperTests {

	@Autowired
	private ExchangerateMapper ermapper; // MemberMapper.java 인터페이스 의존성 주입


	@Test
	public void Exchangerateupdate() throws Exception {
		ExchangerateVO exchange = new ExchangerateVO();

		exchange.setMcountry("CNY");
		exchange.setMmoney(123.123);

		ermapper.updateExchangerate(exchange); // 쿼리 메서드 실행
	}

}