package com.hyundai.dutyfree.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.OrderMapper;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.PassportVO;

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
		OrderItemVO orderitem=new OrderItemVO();
		orderitem.setPcode(pcode);
		orderitem.setOamount(oamount);
		orderitem.setOid(oid);
		mapper.Insertorderitem(orderitem);
		
	}

	@Override
	public void Insertorderlist(String oid, String mid, int ohpoint, String ostatus, String oarrdate,
			String oplnum, String oelnum, String oplace) {
		
		System.out.println("oarrdate:"+oarrdate);
		OrderListVO olv=new OrderListVO();
		olv.setOid(oid);
		olv.setMid(mid);
		olv.setOhpoint(ohpoint);
		olv.setOstatus(ostatus);
		olv.setOarrdate(oarrdate);
		olv.setOplnum(oplnum);
		olv.setOelnum(oelnum);
		olv.setOplace(oplace);
		mapper.Insertorderlist(olv);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTotalandMhpoint(String mid, int mhpoint,int mtotal) {
		MemberVO member=new MemberVO();
		member.setMid(mid);
		member.setMhpoint(mhpoint);
		member.setMtotal(mtotal);
		mapper.updateTotalandMhpoint(member);
		
		
	}
	
	
	
	

}
