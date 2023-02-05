package com.hyundai.dutyfree.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.CouponVO;
import com.hyundai.dutyfree.vo.EventVO;

/**
 * CouponMapper
 * 
 * @author 박진수
 * @since 01.26
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.11    박진수                        최초 생성
 * 2023.01.13    박진수                        CouponMapper 완료
 * 2023.01.14    박진수                        상품의 재고량을 수정 추가
 *        </pre>
 */
public interface CouponMapper {

	//회원의 쿠폰 등록
	public void MemberInsertCoupon(@Param("cid") String cid,@Param("mid") String mid, @Param("eid") String eid,@Param("date") String date,@Param("cenabled") String cenabled);
	
	//쿠폰 이벤트의 정보를 조회
	public EventVO GetEventInfo(@Param("eid")String eid);
	
	//쿠폰의 정보를 조회
	public List<CouponVO> GetCouponInfo(String mid);

	//쿠폰의 주문번호를 수정
	public void UpdateCouponOid(@Param("oid")String oid, @Param("cid") String cid);
	
	//쿠폰의 사용여부를 수정
	public void UpdateCenabled(@Param("cenabled") String cenabled,@Param("cid") String cid);
}
