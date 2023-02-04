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
 * 2023.01.13    박진수                        CartService 완료
 * 2023.01.14    박진수                        상품의 재고량을 수정 추가
 *        </pre>
 */
public interface CartService {
	
	//장바구니에 등록
	public void insertCart(CartVO cart);
	
	//장바구니의 목록을 조회
	public List<CartVO> getCartList(String mid,String align,double KRW_WON);
	
	//상품의 재고량을 수정
	public void redproductcnt(String pcode, int pstock,int psel);
	
	//장바구니에 상품이 존재여부
	public int Cartitemconsist(CartVO cart);
	
	//장바구니에 담은 상품 개수 수정
	public void UpdateCartstock(CartVO cart);
	
	//장바구니 상품 삭제
	public void deleteCart(CartVO cart);
}
