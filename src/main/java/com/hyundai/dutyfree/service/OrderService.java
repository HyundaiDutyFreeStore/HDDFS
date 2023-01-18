package com.hyundai.dutyfree.service;

import com.hyundai.dutyfree.vo.PassportVO;

public interface OrderService {
	public void insertPassport(PassportVO passport);
	
	public PassportVO PassportConsist(String mid);
}
