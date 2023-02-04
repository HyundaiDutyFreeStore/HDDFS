package com.hyundai.dutyfree.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.dutyfree.vo.ChartDailyVO;

/**
 * CountCustomerTest
 * 
 * @author 김찬중
 * @since 01.30
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.30    김찬중                        Chart test
 *        </pre>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ChartTest {

	@Autowired
	private ChartMapper mapper; // MemberMapper.java 인터페이스 의존성 주입

	@Test
	public void ChartDaily() {
		List<ChartDailyVO> ChartDaily = mapper.dailyTotal();
		for (int i = 0; i < ChartDaily.size(); i++) {
			System.out.println(ChartDaily.get(i).toString());
		}
	}

}