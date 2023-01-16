package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.CartVO;

public interface CartService {

	public void insertCart(CartVO cart);
	
	public List<CartVO>getCartList();
}
