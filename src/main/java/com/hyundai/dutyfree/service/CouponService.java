package com.hyundai.dutyfree.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.CouponVO;
import com.hyundai.dutyfree.vo.EventVO;

public interface CouponService {
	
	public void MemberInsertCoupon(String mid,String eid,String date);
	
	public EventVO GetEventInfo(String eid);
	
	public List<CouponVO> GetCouponInfo(String mid);
}
