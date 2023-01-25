package com.hyundai.dutyfree.mapper;

import java.util.List;

import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.dutyfree.vo.CustomerVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CountCustomerTest {

	@Autowired
	private OrderMapper ordermapper; // MemberMapper.java 인터페이스 의존성 주입

	@Test
	public void getConfFut() {

		//List<CustomerVO> getCustomerPerTime = orderservice.getCustomerPerTime(request.getParameter("odeptdate"));
		List<CustomerVO> getCustomerPerTime = ordermapper.getCustomerPerTime("ICNT1", "20230125");
		JSONObject jsonObj = new JSONObject();
		// 시간대별 인원
		for (int i = 0; i < 24; i++) {
			jsonObj.put(String.valueOf(i),getCustomerPerTime.get(i).getCount());
		}
		String json = jsonObj.toString();
		System.out.println(json);
	}
	

}