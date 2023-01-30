package com.hyundai.dutyfree.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.CouponVO;
import com.hyundai.dutyfree.vo.EventVO;

public interface CouponMapper {

	public void MemberInsertCoupon(@Param("cid") String cid,@Param("mid") String mid, @Param("eid") String eid,@Param("date") String date,@Param("cenabled") String cenabled);
	
	public EventVO GetEventInfo(@Param("eid")String eid);
	
	public List<CouponVO> GetCouponInfo(String mid);

	public void UpdateCouponOid(@Param("oid")String oid, @Param("cid") String cid);
	
	public void UpdateCenabled(@Param("cenabled") String cenabled,@Param("cid") String cid);
}
