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
	private CouponMapper couponmapper;//
	@Override
	public void MemberInsertCoupon(String mid,String eid,String date) {
		// TODO Auto-generated method stub
		couponmapper.MemberInsertCoupon(mid, eid,date);
		
	}
	@Override
	public EventVO GetEventInfo(String eid) {
		return couponmapper.GetEventInfo(eid);
		
	}
	@Override
	public List<CouponVO> GetCouponInfo(String mid) {
		return couponmapper.GetCouponInfo(mid);
	}
	
	

}
