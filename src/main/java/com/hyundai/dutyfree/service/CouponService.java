package com.hyundai.dutyfree.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.CouponVO;
import com.hyundai.dutyfree.vo.EventVO;

public interface CouponService {
	
	public void MemberInsertCoupon(String cid,String mid,String eid,String date);
	
	public EventVO GetEventInfo(String eid);
	
	public List<CouponVO> GetCouponInfo(String mid);
	
	public void UpdateCouponOid(String oid, String cid);
	
	public void UpdateCenabled(String cenabled,String cid);
}
