package com.hyundai.dutyfree.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.CartMapper;
import com.hyundai.dutyfree.vo.CartVO;
import com.hyundai.dutyfree.vo.ProductVO;


/**
 * CartServiceImpl
 * 
 * @author 박진수
 * @since 01.13
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.11    박진수                        최초 생성
 * 2023.01.13    박진수                        서비스 구현
 *        </pre>
 */
@Service
public class CartServiceImpl implements CartService {

	private final CartMapper cartmapper;
	
	public CartServiceImpl(CartMapper cartmapper) {
		this.cartmapper=cartmapper;
	}
	
	@Override
	public void insertCart(CartVO cart) {
		System.out.println(cart.getCartregdate());
		cartmapper.insertCart(cart);
		
	}



	@Override
	public void redproductcnt(String pcode, int pstock) {
		ProductVO product=cartmapper.prodinfo(pcode);
		product.setPstock(product.getPstock()-pstock);
		cartmapper.redproductcnt(product);
		
	}

	@Override
	public int Cartitemconsist(CartVO cart) {

		return cartmapper.Cartitemconsist(cart);
	}

	@Override
	public List<CartVO> getCartList(String mid) {
		// TODO Auto-generated method stub
		return cartmapper.getCartList(mid);
	}

	@Override
	public void UpdateCartstock(CartVO cart) {
		// TODO Auto-generated method stub
		cartmapper.UpdateCartstock(cart);
	}

	@Override
	public void deleteCart(CartVO cart) {
		cartmapper.deleteCart(cart);
		
	}

}
