package com.hyundai.dutyfree.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.CouponVO;
import com.hyundai.dutyfree.vo.EventVO;
/**
 * CouponService
 * 
 * @author 박진수
 * @since 01.26
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.26    박진수                        최초 생성
 * 2023.01.29    박진수                        CouponService 완료
 *        </pre>
 */
public interface CouponService {
	
	//회원에 대한 쿠폰정보를 등록
	public void MemberInsertCoupon(String cid,String mid,String eid,String date);
	
	//쿠폰 이벤트를 조회
	public EventVO GetEventInfo(String eid);
	
	//회원의 쿠폰 정보를 조회
	public List<CouponVO> GetCouponInfo(String mid);
	
	//쿠폰을 사용한 주문리스트 번호를 등록
	public void UpdateCouponOid(String oid, String cid);
	
	//쿠폰 사용 가능 여부를 수정
	public void UpdateCenabled(String cenabled,String cid);
}
