package com.hyundai.dutyfree.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.CustomerVO;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.OrderMemberVO;
import com.hyundai.dutyfree.vo.PassportVO;

/**
 * OrderMapper
 * 
 * @author 박진수, 김찬중
 * @since 01.13
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.13    박진수                        최초 생성
 * 2023.01.20    박진수                        OrderMapper 완료
 * 2023.01.23    김찬중                        시간대 별 고객 리스트 추가
 * 2023.01.26    김찬중                        인도장 이용 예정 고객 리스트 추가
 *        </pre>
 */
public interface OrderMapper {
	public void insertPassport(PassportVO passport);

	public PassportVO PassportConsist(String mid);

	public void Insertorderitem(OrderItemVO orderitem);

	public void Insertorderlist(OrderListVO orderitemlist);

	public OrderListVO getorderlist(String oid);

	public void updateTotalandMhpoint(MemberVO member);

	public List<OrderItemVO> getOrderitemlist(String oid);

	public List<OrderListVO> getorderlistBymid(HashMap<String, String> listmap);

	public void deleteorder(String oid);

	// 시간대 별 고객 수
	public List<CustomerVO> getCustomerPerTime(@Param("odept") String odept, @Param("odeptdate") String odeptdate);

	public void Updateostatus(@Param("ostatus") String ostatus, @Param("oid") String oid);

	public void UpdateorderPaymentKey(@Param("opaymentkey") String opaymentkey, @Param("oid") String oid);

	// 인도장 이용 예정 고객
	public List<OrderMemberVO> OrderMemberCheck();

	// 3시간 전 이용 예정 고객
	public List<CustomerVO> LastMember(@Param("odept") String odept, @Param("odeptdate") String odeptdate);

	// 30분 전 이용 예정 고객
	public List<OrderMemberVO> LastHalfMember();

	// 상품을 찾아가지 않은 고객
	public List<OrderMemberVO> FailMember();
	
	//관리자용 주문목록 조회
	public List<OrderListVO> getList();
	
	//관리자용 주문고객 조회
	public String getOrderMid(String oid);
}
