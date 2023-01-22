package com.hyundai.dutyfree.mapper;

import java.util.HashMap;
import java.util.List;

import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.PassportVO;

public interface OrderMapper {
	public void insertPassport(PassportVO passport);
	
	public PassportVO PassportConsist(String mid);
	
	public void Insertorderitem(OrderItemVO orderitem);
	
	public void Insertorderlist(OrderListVO orderitemlist);
	
	public OrderListVO getorderlist(String oid);
	
	public void updateTotalandMhpoint(MemberVO member);
	
	public List<OrderItemVO> getOrderitemlist(String oid);
	
	public List<OrderListVO> getorderlistBymid(HashMap<String, String> listmap);
}
