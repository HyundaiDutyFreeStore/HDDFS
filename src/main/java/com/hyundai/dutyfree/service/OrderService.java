package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.CustomerVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.PassportVO;


/**
 * OrderService
 * 
 * @author 박진수
 * @since 01.16
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.16    박진수                        최초 생성
 *        </pre>
 */
public interface OrderService {
	public void insertPassport(PassportVO passport);
	
	public PassportVO PassportConsist(String mid);
	
	public void Inserorderitem(String pcode, int oamount,String oid);
	
	public void Insertorderlist(String oid,String mid,int ohpoint,String ostatus,String odeptdate,String oplnum,String oelnum, String oplace );
	
	public void updateTotalandMhpoint(String mid,int mhpoint,int mtotal);
	
	public List<OrderItemVO>  getOrderitemlist(String oid);
	
	public OrderListVO getorderlist(String oid);
	
	public List<OrderListVO> getorderlistBymid(String mid,String align);
	
	public void deleteorder(String oid);
	
	public List<CustomerVO> getCustomerPerTime(String odept,String odeptdate);
}
