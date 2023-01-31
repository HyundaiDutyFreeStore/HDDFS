package com.hyundai.dutyfree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.AlarmMapper;
import com.hyundai.dutyfree.vo.AlarmVO;


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

}
