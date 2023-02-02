package com.hyundai.dutyfree.mapper;

import java.util.HashMap;
import java.util.List;

import com.hyundai.dutyfree.vo.CartVO;
import com.hyundai.dutyfree.vo.ProductVO;

/**
 * CartMapper
 * 
 * @author 박진수
 * @since 01.11
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.11    박진수                        최초 생성
 * 2023.01.13    박진수                        CartMapper 완료
 * 2023.01.14    박진수                        상품의 재고량을 수정 추가
 *        </pre>
 */
public interface CartMapper {
	
	//장바구니 목록을 조회
	public List<CartVO> getCartListprice(HashMap<String, String> listMap);
	
	public List<CartVO> getCartListregDate(HashMap<String, String> listMap);
	
	//장바구니에 물품을 등록
	public void insertCart(CartVO cart);
	
	//상품의 재고량을 1감소
	public void redproductcnt(ProductVO product);
	
	//상품의 정보를 가져온다.
	public ProductVO prodinfo(String pcode);
	
	//장바구니안에 상품이 존재하는지 확인
	public int Cartitemconsist(CartVO cart);
	
	//장바구니의 수량 업데이트
	public void UpdateCartstock(CartVO cart);
	
	//장바구니 삭제
	public void deleteCart(CartVO cart);
	
}
