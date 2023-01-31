package com.hyundai.dutyfree.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.AlarmVO;

public interface AlarmMapper {
	public void insertAlarm(@Param("pcode")String pcode, @Param("mid")String mid, @Param("mphone")String mphone);

	public List<AlarmVO> getAlarmList(String pcode);
}
