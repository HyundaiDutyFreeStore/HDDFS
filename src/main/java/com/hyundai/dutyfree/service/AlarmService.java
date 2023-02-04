package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.AlarmVO;
/**
 * AlarmService
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
public interface AlarmService {
	public void insertAlarm(String pcode, String mid, String mphone);
	
	public List<AlarmVO> getAlarmList(String pcode);
}
