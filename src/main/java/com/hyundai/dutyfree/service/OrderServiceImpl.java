package com.hyundai.dutyfree.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.OrderMapper;
import com.hyundai.dutyfree.vo.CustomerVO;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.OrderMemberVO;
import com.hyundai.dutyfree.vo.PassportVO;

/**
 * OrderServiceImpl
 * 
 * @author 박진수, 김찬중
 * @since 01.16
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.16    박진수                        최초 생성
 * 2023.01.20    박진수                        OrderServiceImpl 완료
 * 2023.01.21    박진수                        주문리스트 등록 및 조회 및 삭제 및 정렬 추가
 * 2023.01.22    박진수                        회원의 구매금액 및 포인트 수정 추가
 * 2023.01.23    박진수                        주문리스트에 대한 현재 상황 수정 추가
 * 2023.01.23    박진수                        주문리스트에 대해 결제 코드를 저장 추가
 * 2023.01.23    김찬중                        시간대 별 고객 리스트 추가
 * 2023.01.26    김찬중                        인도장 이용 예정 고객 리스트 추가
 *        </pre>
 */
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;
	
	//여권정보를 등록
	@Override
	public void insertPassport(PassportVO passport) {
		mapper.insertPassport(passport);
	}

	//여권정보를 조회
	@Override
	public PassportVO PassportConsist(String mid) {
		// TODO Auto-generated method stub
		return mapper.PassportConsist(mid);
	}
	
	//주문리스트의 상품을 등록
	@Override
	public void Inserorderitem(String pcode, int oamount, String oid) {
		OrderItemVO orderitem = new OrderItemVO();
		orderitem.setPcode(pcode);
		orderitem.setOamount(oamount);
		orderitem.setOid(oid);
		mapper.Insertorderitem(orderitem);

	}
	
	//주문리스트 정보를 등록
	@Override
	public void Insertorderlist(String oid, String mid, int ohpoint, String ostatus, String odeptdate, String oplnum,
			String oelnum, String oplace,double total_dollar) {
		OrderListVO olv = new OrderListVO();
		olv.setOid(oid);
		olv.setMid(mid);
		olv.setOhpoint(ohpoint);
		olv.setOstatus(ostatus);
		olv.setOdeptdate(odeptdate);
		olv.setOplnum(oplnum);
		olv.setOelnum(oelnum);
		olv.setOdept(oplace);
		olv.setOtotal(total_dollar);
		mapper.Insertorderlist(olv);
		// TODO Auto-generated method stub

	}
	
	//회원의 적립금 및 포인트를 수정
	@Override
	public void updateTotalandMhpoint(String mid, int mhpoint, int mtotal) {
		MemberVO member = new MemberVO();
		member.setMid(mid);
		member.setMhpoint(mhpoint);
		member.setMtotal(mtotal);
		mapper.updateTotalandMhpoint(member);
	}
	
	//주문번호에 대한 주문리스트의 상품을 조회
	@Override
	public List<OrderItemVO> getOrderitemlist(String oid) {
		return mapper.getOrderitemlist(oid);
	}
	
	//상품을 담은 주문리스트를 조회
	@Override
	public OrderListVO getorderlist(String oid) {
		return mapper.getorderlist(oid);
	}
	
	//주문리스트를 정렬을 통해 조회
	@Override
	public List<OrderListVO> getorderlistBymid(String mid, String align) {
		HashMap<String, String> listMap = new HashMap<>();
		listMap.put("mid", mid);
		listMap.put("align", align);
		return mapper.getorderlistBymid(listMap);
	}
	
	//주문리스트를 삭제
	@Override
	public void deleteorder(String oid) {
		mapper.deleteorder(oid);
	}

	// 시간대별 고객 수
	@Override
	public List<CustomerVO> getCustomerPerTime(String odept, String odeptdate) {
		return mapper.getCustomerPerTime(odept, odeptdate);
	}
	
	//주문리스트의 현재 상황을 수정
	@Override
	public void Updateostatus(String ostatus, String oid) {
		mapper.Updateostatus(ostatus, oid);

	}
	
	//주문리스트에 대해 결제 코드를 저장
	@Override
	public void UpdateorderPaymentKey(String opaymentkey, String oid) {
		mapper.UpdateorderPaymentKey(opaymentkey, oid);

	}

	// 인도장 이용 예정 고객
	@Override
	public List<OrderMemberVO> OrderMemberCheck() {
		return mapper.OrderMemberCheck();
	}

	// 3시간 전 이용 예정 고객
	@Override
	public List<CustomerVO> LastMember(String odept, String odeptdate) {
		return mapper.LastMember(odept, odeptdate);
	}

	// 30분 전 이용 예정 고객
	@Override
	public List<OrderMemberVO> LastHalfMember(){
		return mapper.LastHalfMember();
	}

	// 상품을 찾아가지 않은 고객
	@Override
	public List<OrderMemberVO> FailMember(){
		return mapper.FailMember();
	}

	@Override
	public List<OrderListVO> getList() {
		return mapper.getList();
	}

	@Override
	public String getOrderMid(String oid) {
		return mapper.getOrderMid(oid);
	}
}
