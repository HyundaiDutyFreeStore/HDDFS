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
 * 2023.01.13    박진수                        CartMapper 완료
 * 2023.01.14    박진수                        상품의 재고량을 수정 추가
 *        </pre>
 */
public interface CouponMapper {

	public void MemberInsertCoupon(@Param("cid") String cid,@Param("mid") String mid, @Param("eid") String eid,@Param("date") String date,@Param("cenabled") String cenabled);
	
	public EventVO GetEventInfo(@Param("eid")String eid);
	
	public List<CouponVO> GetCouponInfo(String mid);

	public void UpdateCouponOid(@Param("oid")String oid, @Param("cid") String cid);
	
	public void UpdateCenabled(@Param("cenabled") String cenabled,@Param("cid") String cid);
}
