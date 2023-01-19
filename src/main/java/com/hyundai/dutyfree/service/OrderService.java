package com.hyundai.dutyfree.service;

import java.sql.Date;

import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.PassportVO;

public interface OrderService {
	public void insertPassport(PassportVO passport);
	
	public PassportVO PassportConsist(String mid);
	
	public void Inserorderitem(String pcode, int oamount,String oid);
	
	public void Insertorderitemlist(String oid,String mid, Date odate,int ohpoint,String ostatus,String oarrdate,String oplnum,String elnum, String oplace );
}
