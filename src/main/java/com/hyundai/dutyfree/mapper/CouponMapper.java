package com.hyundai.dutyfree.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.CouponVO;
import com.hyundai.dutyfree.vo.EventVO;

public interface CouponMapper {

	public void MemberInsertCoupon(@Param("mid")String mid, @Param("eid")String eid,@Param("date") String date);
	
	public EventVO GetEventInfo(@Param("eid")String eid);
	
	public List<CouponVO> GetCouponInfo(String mid);
}
