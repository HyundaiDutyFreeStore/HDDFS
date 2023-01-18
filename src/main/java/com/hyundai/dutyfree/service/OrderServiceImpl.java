package com.hyundai.dutyfree.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.OrderMapper;
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
	
	

}
