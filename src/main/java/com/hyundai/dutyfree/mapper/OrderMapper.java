package com.hyundai.dutyfree.mapper;

import com.hyundai.dutyfree.vo.PassportVO;

public interface OrderMapper {
	public void insertPassport(PassportVO passport);
	
	public PassportVO PassportConsist(String mid);
}
