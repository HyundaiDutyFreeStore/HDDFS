package com.hyundai.dutyfree.mapper;

import java.util.List;

import com.hyundai.dutyfree.vo.CartVO;

public interface CartMapper {

	public List<CartVO>getCartList();
	
	public void insertCart(CartVO cart);
	
}
