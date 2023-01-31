package com.hyundai.dutyfree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.CouponMapper;
import com.hyundai.dutyfree.vo.CouponVO;
import com.hyundai.dutyfree.vo.EventVO;
/**
 * CouponServiceImpl
 * 
 * @author 박진수
 * @since 01.26
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.26    박진수                        최초 생성
 * 2023.01.29    박진수                        CouponServiceImpl 완료
 *        </pre>
 */
@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponMapper couponmapper;
	
	//회원에 대한 쿠폰정보를 등록
	@Override
	public void MemberInsertCoupon(String cid,String mid,String eid,String date) {
		// TODO Auto-generated method stub
		if(eid.substring(0, 3).equals("SAV")) {
			couponmapper.MemberInsertCoupon(cid,mid, eid,date,"NOTENABLED");
		}else {
			couponmapper.MemberInsertCoupon(cid,mid, eid,date,"ENABLED");
		}
		
		
	}
	
	//쿠폰 이벤트를 조회
	@Override
	public EventVO GetEventInfo(String eid) {
		return couponmapper.GetEventInfo(eid);
		
	}
	
	//회원의 쿠폰 정보를 조회
	@Override
	public List<CouponVO> GetCouponInfo(String mid) {
		return couponmapper.GetCouponInfo(mid);
	}
	
	//쿠폰을 사용한 주문리스트 번호를 등록
	@Override
	public void UpdateCouponOid(String oid, String cid) {
		couponmapper.UpdateCouponOid(oid, cid);
		
	}
	
	//쿠폰 사용 가능 여부를 수정
	@Override
	public void UpdateCenabled(String cenabled, String cid) {
		couponmapper.UpdateCenabled(cenabled, cid);
		
	}

}
