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
 * 2023.01.23    김찬중                        시간대 별 고객 리스트 추가
 * 2023.01.26    김찬중                        인도장 이용 예정 고객 리스트 추가
 *        </pre>
 */
public interface OrderService {
	public void insertPassport(PassportVO passport);
	
	public PassportVO PassportConsist(String mid);
	
	public void Inserorderitem(String pcode, int oamount,String oid);
	
	public void Insertorderlist(String oid,String mid,int ohpoint,String ostatus,String odeptdate,String oplnum,String oelnum, String oplace ,float total_dollar);
	
	public void updateTotalandMhpoint(String mid,int mhpoint,int mtotal);
	
	public List<OrderItemVO>  getOrderitemlist(String oid);
	
	public OrderListVO getorderlist(String oid);
	
	public List<OrderListVO> getorderlistBymid(String mid,String align);
	
	public void deleteorder(String oid);
	//시간대별 고객 수
	public List<CustomerVO> getCustomerPerTime(String odept,String odeptdate);
	
	public void Updateostatus(String ostatus,String oid);
	
	public void UpdateorderPaymentKey(String opaymentkey,String oid);
	//인도장 이용 예정 고객
	public List<OrderMemberVO> OrderMemberCheck();
	//3시간 전 이용 예정 고객
	public List<CustomerVO> LastMember(String odept, String odeptdate);
	//30분 전 이용 예정 고객
	public List<OrderMemberVO> LastHalfMember();
	//상품을 찾아가지 않은 고객
	public List<OrderMemberVO> FailMember();
}
