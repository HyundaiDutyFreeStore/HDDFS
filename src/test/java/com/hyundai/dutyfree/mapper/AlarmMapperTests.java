package com.hyundai.dutyfree.mapper;


import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.dutyfree.admin.vo.AdminChat;
import com.hyundai.dutyfree.admin.vo.AdminMessage;
import com.hyundai.dutyfree.vo.AlarmVO;
import com.hyundai.dutyfree.vo.CategoryVO;
import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.ProductVO;

import lombok.extern.log4j.Log4j;

/**
 * AlarmMapperTests
 * 
 * @author 김가희
 * @since 01.31
 * 
 * <pre>
 * 수정일                 수정자                                  수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.31     김가희                                  최초 생성
 * </pre>
 */
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml"})

public class AlarmMapperTests {

	@Autowired
	private AlarmMapper alarmMapper;
	
	
	//알람insert Test
	@Test
	public void insertAlarmTests() {
		String pcode = "106680300018";
		String mid = "gahee3839";
		String mphone = "01065433839";
		alarmMapper.insertAlarm(pcode, mid, mphone);
	}
	
	//알람리스트조회 Test
	@Test
	public void getAlarmListTests() {
		String pcode = "106680300018";
		List<AlarmVO> list = alarmMapper.getAlarmList(pcode);
		list.forEach(i -> log.info(i));
	}
	
	
	
	
	
	
}
