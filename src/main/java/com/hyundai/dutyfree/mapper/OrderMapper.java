package com.hyundai.dutyfree.mapper;

import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderItemListVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.PassportVO;

public interface OrderMapper {
	public void insertPassport(PassportVO passport);
	
	public PassportVO PassportConsist(String mid);
	
	public void Insertorderitem(OrderItemVO orderitem);
	
	public void Insertorderlist(OrderListVO orderitemlist);
	
	public void updateTotalandMhpoint(MemberVO member);
}
