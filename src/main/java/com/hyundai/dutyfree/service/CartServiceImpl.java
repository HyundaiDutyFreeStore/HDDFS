package com.hyundai.dutyfree.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import com.hyundai.dutyfree.mapper.CartMapper;
import com.hyundai.dutyfree.vo.CartVO;
import com.hyundai.dutyfree.vo.ProductVO;


/**
 * CartServiceImpl
 * 
 * @author 박진수
 * @since 01.11
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.11    박진수                        최초 생성
 * 2023.01.13    박진수                        CartServiceImpl 완료
 * 2023.01.14    박진수                        상품의 재고량을 수정 추가
 *        </pre>
 */
@Service
public class CartServiceImpl implements CartService {

	private final CartMapper cartmapper;
	
	public CartServiceImpl(CartMapper cartmapper) {
		this.cartmapper=cartmapper;
	}
	
	//장바구니에 등록
	@Override
	public void insertCart(CartVO cart) {
		System.out.println(cart.getCartregdate());
		cartmapper.insertCart(cart);
		
	}


	//상품의 재고량을 수정
	@Override
	public void redproductcnt(String pcode, int pstock,int psel) {
		ProductVO product=cartmapper.prodinfo(pcode);
		product.setPstock(pstock);
		product.setPsel(psel);
		cartmapper.redproductcnt(product);
		
	}

	//장바구니에 상품이 존재여부
	@Override
	public int Cartitemconsist(CartVO cart) {

		return cartmapper.Cartitemconsist(cart);
	}
	
	//장바구니의 목록을 조회
	@Override
	public List<CartVO> getCartList(String mid,String align,double KRW_WON) {
		// TODO Auto-generated method stub
		HashMap<String,String> listMap = new HashMap<>();
		listMap.put("mid", mid);
		listMap.put("align",align);
		System.out.println(align);
		if(align.equals("lput")||align.equals("fput")) {
			return cartmapper.getCartListregDate(listMap);
		}else {
			return cartmapper.getCartListprice(mid,align,KRW_WON);
		}
	}

	//장바구니에 담은 상품 개수 수정
	@Override
	public void UpdateCartstock(CartVO cart) {
		// TODO Auto-generated method stub
		cartmapper.UpdateCartstock(cart);
	}

	//장바구니 상품 삭제
	@Override
	public void deleteCart(CartVO cart) {
		cartmapper.deleteCart(cart);
		
	}

}
