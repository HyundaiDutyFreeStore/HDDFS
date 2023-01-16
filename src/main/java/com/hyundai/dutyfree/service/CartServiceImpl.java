package com.hyundai.dutyfree.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.CartMapper;
import com.hyundai.dutyfree.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {

	private final CartMapper cartmapper;
	
	public CartServiceImpl(CartMapper cartmapper) {
		this.cartmapper=cartmapper;
	}
	
	@Override
	public void insertCart(CartVO cart) {
		cartmapper.insertCart(cart);
		
	}

	@Override
	public List<CartVO> getCartList() {
		// TODO Auto-generated method stub
		return cartmapper.getCartList();
	}

}
