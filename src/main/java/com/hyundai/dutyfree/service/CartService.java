package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.CartVO;
/**
 * CartService
 * 
 * @author 박진수
 * @since 01.11
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.11    박진수                        최초 생성
 *        </pre>
 */
public interface CartService {

	public void insertCart(CartVO cart);
	
	public List<CartVO> getCartList(String mid,String align);
	
	public void redproductcnt(String pcode, int pstock);
	
	public int Cartitemconsist(CartVO cart);
	
	public void UpdateCartstock(CartVO cart);
	
	public void deleteCart(CartVO cart);
}
