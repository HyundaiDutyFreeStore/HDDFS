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
 * 2023.01.21    박진수                        주문리스트 등록 및 조회 및 삭제 및 정렬 추가
 * 2023.01.22    박진수                        회원의 구매금액 및 포인트 수정 추가
 * 2023.01.23    박진수                        주문리스트에 대한 현재 상황 수정 추가
 * 2023.01.23    박진수                        주문리스트에 대해 결제 코드를 저장 추가
 * 2023.01.23    김찬중                        시간대 별 고객 리스트 추가
 * 2023.01.26    김찬중                        인도장 이용 예정 고객 리스트 추가
 *        </pre>
 */
public interface OrderMapper {
	
	//여권을 등록
	public void insertPassport(PassportVO passport);
	
	//여권이 존재하는 조회
	public PassportVO PassportConsist(String mid);
	
	//주문리스트의 상품들을 등록
	public void Insertorderitem(OrderItemVO orderitem);
	
	//주문리스트의 상품들을 등록
	public void Insertorderlist(OrderListVO orderitemlist);
	
	//주문리스트를 조회
	public OrderListVO getorderlist(String oid);
	
	//총액과 포인트를 수정
	public void updateTotalandMhpoint(MemberVO member);

	//주문리스트의 상품들을 조회
	public List<OrderItemVO> getOrderitemlist(String oid);
	
	//회원 id를 통해 주문리스트를 조회
	public List<OrderListVO> getorderlistBymid(HashMap<String, String> listmap);
	
	//주문 리스트를 삭제
	public void deleteorder(String oid);

	// 시간대 별 고객 수
	public List<CustomerVO> getCustomerPerTime(@Param("odept") String odept, @Param("odeptdate") String odeptdate);
	
	//주문의 상태를 수정
	public void Updateostatus(@Param("ostatus") String ostatus, @Param("oid") String oid);
	
	//주문의 지불키를 수정
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
