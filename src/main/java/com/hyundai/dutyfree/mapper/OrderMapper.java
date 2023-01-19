package com.hyundai.dutyfree.mapper;

import com.hyundai.dutyfree.vo.OrderItemListVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.PassportVO;

public interface OrderMapper {
	public void insertPassport(PassportVO passport);
	
	public PassportVO PassportConsist(String mid);
	
	public void Insertorderitem(OrderItemVO orderitem);
	
	public void Insertorderitemlist(OrderItemListVO orderitemlist);
}
