package com.hyundai.dutyfree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.CouponMapper;
import com.hyundai.dutyfree.vo.CouponVO;
import com.hyundai.dutyfree.vo.EventVO;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponMapper couponmapper;
	@Override
	public void MemberInsertCoupon(String cid,String mid,String eid,String date) {
		// TODO Auto-generated method stub
		if(eid.substring(0, 3).equals("SAV")) {
			couponmapper.MemberInsertCoupon(cid,mid, eid,date,"NOTENABLED");
		}else {
			couponmapper.MemberInsertCoupon(cid,mid, eid,date,"ENABLED");
		}
		
		
	}
	@Override
	public EventVO GetEventInfo(String eid) {
		return couponmapper.GetEventInfo(eid);
		
	}
	@Override
	public List<CouponVO> GetCouponInfo(String mid) {
		return couponmapper.GetCouponInfo(mid);
	}
	
	@Override
	public void UpdateCouponOid(String oid, String cid) {
		couponmapper.UpdateCouponOid(oid, cid);
		
	}
	@Override
	public void UpdateCenabled(String cenabled, String cid) {
		couponmapper.UpdateCenabled(cenabled, cid);
		
	}

}
