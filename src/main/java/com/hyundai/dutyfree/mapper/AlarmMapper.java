package com.hyundai.dutyfree.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.AlarmVO;
/**
 * AlarmMapper
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
public interface AlarmMapper {
	public void insertAlarm(@Param("pcode")String pcode, @Param("mid")String mid, @Param("mphone")String mphone);

	public List<AlarmVO> getAlarmList(String pcode);
	
	public int alarmChk(String pcode, String mid);
}
