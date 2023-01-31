package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.AlarmVO;

public interface AlarmService {
	public void insertAlarm(String pcode, String mid, String mphone);
	
	public List<AlarmVO> getAlarmList(String pcode);
}
