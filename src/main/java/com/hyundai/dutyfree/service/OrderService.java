package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.PassportVO;

public interface OrderService {
	public void insertPassport(PassportVO passport);
	
	public PassportVO PassportConsist(String mid);
	
	public void Inserorderitem(String pcode, int oamount,String oid);
	
	public void Insertorderlist(String oid,String mid,int ohpoint,String ostatus,String oarrdate,String oplnum,String oelnum, String oplace );
	
	public void updateTotalandMhpoint(String mid,int mhpoint,int mtotal);
	
	public List<OrderItemVO> getOrderitemlist(String mid);
}
