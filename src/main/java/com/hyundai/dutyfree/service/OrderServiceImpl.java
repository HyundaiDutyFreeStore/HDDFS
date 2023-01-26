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
 * 2023.01.23    김찬중                        시간대 별 고객 리스트 추가
 * 2023.01.26    김찬중                        인도장 이용 예정 고객 리스트 추가
 *        </pre>
 */
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;

	@Override
	public void insertPassport(PassportVO passport) {
		mapper.insertPassport(passport);
	}

	@Override
	public PassportVO PassportConsist(String mid) {
		// TODO Auto-generated method stub
		return mapper.PassportConsist(mid);
	}

	@Override
	public void Inserorderitem(String pcode, int oamount, String oid) {
		OrderItemVO orderitem = new OrderItemVO();
		orderitem.setPcode(pcode);
		orderitem.setOamount(oamount);
		orderitem.setOid(oid);
		mapper.Insertorderitem(orderitem);

	}

	@Override
	public void Insertorderlist(String oid, String mid, int ohpoint, String ostatus, String odeptdate, String oplnum,
			String oelnum, String oplace) {
		OrderListVO olv = new OrderListVO();
		olv.setOid(oid);
		olv.setMid(mid);
		olv.setOhpoint(ohpoint);
		olv.setOstatus(ostatus);
		olv.setOdeptdate(odeptdate);
		olv.setOplnum(oplnum);
		olv.setOelnum(oelnum);
		olv.setOplace(oplace);
		mapper.Insertorderlist(olv);
		// TODO Auto-generated method stub

	}

	@Override
	public void updateTotalandMhpoint(String mid, int mhpoint, int mtotal) {
		MemberVO member = new MemberVO();
		member.setMid(mid);
		member.setMhpoint(mhpoint);
		member.setMtotal(mtotal);
		mapper.updateTotalandMhpoint(member);
	}

	@Override
	public List<OrderItemVO> getOrderitemlist(String oid) {
		return mapper.getOrderitemlist(oid);
	}

	@Override
	public OrderListVO getorderlist(String oid) {
		return mapper.getorderlist(oid);
	}

	@Override
	public List<OrderListVO> getorderlistBymid(String mid, String align) {
		HashMap<String, String> listMap = new HashMap<>();
		listMap.put("mid", mid);
		listMap.put("align", align);
		return mapper.getorderlistBymid(listMap);
	}

	@Override
	public void deleteorder(String oid) {
		mapper.deleteorder(oid);
	}

	// 시간대별 고객 수
	@Override
	public List<CustomerVO> getCustomerPerTime(String odept, String odeptdate) {
		return mapper.getCustomerPerTime(odept, odeptdate);
	}

	@Override
	public void Updateostatus(String ostatus, String oid) {
		mapper.Updateostatus(ostatus, oid);

	}

	@Override
	public void UpdateorderPaymentKey(String opaymentkey, String oid) {
		mapper.UpdateorderPaymentKey(opaymentkey, oid);

	}
	//인도장 이용 예정 고객
	@Override
	public List<OrderMemberVO> OrderMemberCheck(){
		return mapper.OrderMemberCheck();
	}
}
