package com.hyundai.dutyfree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.AlarmMapper;
import com.hyundai.dutyfree.vo.AlarmVO;
/**
 * AlarmServiceImpl
 * 
 * @author 김가희
 * @since 01.31
 * 
 *        
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.31   김가희                         최초 생성
 * 
 */

@Service
public class AlarmServiceImpl implements AlarmService{
	@Autowired
	private AlarmMapper mapper;
	
	@Override
	public void insertAlarm(String pcode, String mid, String mphone) {
		mapper.insertAlarm(pcode, mid, mphone);
	}

	@Override
	public List<AlarmVO> getAlarmList(String pcode) {
		return mapper.getAlarmList(pcode);
	}

	@Override
	public int alarmChk(String pcode, String mid) {
		return mapper.alarmChk(pcode, mid);
	}

}
