package com.hyundai.dutyfree.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.CustomerVO;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.PassportVO;

/**
 * OrderMapper
 * 
 * @author 박진수
 * @since 01.13
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.13    박진수                        최초 생성
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
	
	public List<CustomerVO> getCustomerPerTime(@Param("odept")String odept, @Param("odeptdate")String odeptdate);
	
	public void Updateostatus(@Param("ostatus")String ostatus, @Param("oid")String oid);
	
	public void UpdateorderPaymentKey(@Param("opaymentkey")String opaymentkey, @Param("oid")String oid);
}
