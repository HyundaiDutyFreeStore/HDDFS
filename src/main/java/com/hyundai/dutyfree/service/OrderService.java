package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.CustomerVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.OrderMemberVO;
import com.hyundai.dutyfree.vo.PassportVO;

/**
 * OrderService
 * 
 * @author 박진수, 김찬중
 * @since 01.16
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.16    박진수                        최초 생성
 * 2023.01.20    박진수                        OrderService 완료
 * 2023.01.21    박진수                        여권정보 등록 및 조회 추가
 * 2023.01.21    박진수                        주문리스트 등록 및 조회 및 삭제 및 정렬 추가
 * 2023.01.22    박진수                        회원의 구매금액 및 포인트 수정 추가
 * 2023.01.23    박진수                        주문리스트에 대한 현재 상황 수정 추가
 * 2023.01.23    박진수                        주문리스트에 대해 결제 코드를 저장 추가
 * 2023.01.23    김찬중                        시간대 별 고객 리스트 추가
 * 2023.01.26    김찬중                        인도장 이용 예정 고객 리스트 추가
 *        </pre>
 */
public interface OrderService {

	// 여권정보 등록
	public void insertPassport(PassportVO passport);

	// 여권정보 조회
	public PassportVO PassportConsist(String mid);

	// 주문리스트의 상품을 등록
	public void Inserorderitem(String pcode, int oamount, String oid);

	// 주문리스트 정보를 등록
	public void Insertorderlist(String oid, String mid, int ohpoint, String ostatus, String odeptdate, String oplnum,
			String oelnum, String oplace, double total_dollar);

	// 회원의 적립금 및 포인트를 수정
	public void updateTotalandMhpoint(String mid, int mhpoint, int mtotal);

	// 주문번호에 대한 주문리스트의 상품을 조회
	public List<OrderItemVO> getOrderitemlist(String oid);

	// 상품을 담은 주문리스트를 조회
	public OrderListVO getorderlist(String oid);

	// 주문리스트를 정렬을 통해 조회
	public List<OrderListVO> getorderlistBymid(String mid, String align);

	// 주문리스트를 삭제
	public void deleteorder(String oid);

	// 시간대별 고객 수
	public List<CustomerVO> getCustomerPerTime(String odept, String odeptdate);

	// 주문리스트의 현재 상황을 수정
	public void Updateostatus(String ostatus, String oid);

	// 주문리스트에 대해 결제 코드를 저장
	public void UpdateorderPaymentKey(String opaymentkey, String oid);

	// 인도장 이용 예정 고객
	public List<OrderMemberVO> OrderMemberCheck();

	// 3시간 전 이용 예정 고객
	public List<CustomerVO> LastMember(String odept, String odeptdate);

	// 30분 전 이용 예정 고객
	public List<OrderMemberVO> LastHalfMember();

	// 상품을 찾아가지 않은 고객
	public List<OrderMemberVO> FailMember();

	// 관리자용 주문목록 조회
	public List<OrderListVO> getList();

	// 관리자용 주문고객 조회
	public String getOrderMid(String oid);
}
