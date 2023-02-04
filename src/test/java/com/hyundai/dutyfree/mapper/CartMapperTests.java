package com.hyundai.dutyfree.mapper;

import java.sql.Date;
import java.text.DateFormat;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.dutyfree.vo.CartVO;
import com.hyundai.dutyfree.vo.ProductVO;

/**
 * CartMapperTests
 * 
 * @author 박진수
 * @since 01.15
 * 
 *        <pre>
 * 수정일                 수정자                                  수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.15   박진수                               최초 생성
 *        </pre>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml" })
public class CartMapperTests {

	@Autowired
	private CartMapper cartmapper;

	// 장바구니 목록을 조회

	@Test
	public void getCartListpriceTests() { 
		HashMap<String, String> listMap = new HashMap<>();
		String mid="test1";
		String align="hprice";
		double KRW_WON=1267.0;
		List<CartVO> cartlist=cartmapper.getCartListprice(mid, align, KRW_WON);
		for(CartVO cart:cartlist) {
			System.out.println(cart.toString());
		}
	}

	@Test
	public void getCartListregDate() {
		HashMap<String, String> listMap = new HashMap<>();
		listMap.put("mid", "test1");
		listMap.put("align","lput");
		List<CartVO> cartlist=cartmapper.getCartListregDate(listMap);
		for(CartVO cart:cartlist) {
			System.out.println(cart.toString());
		}
	}

	// 장바구니에 물품을 등록
	@Test 
	public void insertCartTests() { 
	  CartVO cart=new CartVO();
	  cart.setMid("test1");
	  cart.setCartstock(100);
	  cart.setPcode("105261200055"); 
	  cartmapper.insertCart(cart);
	}
	 

	// 상품의 재고량을 1감소
	@Test
	public void redproductcnt() {
		ProductVO product=new ProductVO();
		product.setPcode("105261200055");
		product.setPstock(100);
		product.setPsel(10);
		cartmapper.redproductcnt(product);
	}

	// 상품의 정보를 가져온다.
	@Test
	public void prodinfoTests() {
		ProductVO product=cartmapper.prodinfo("105261200055");
		System.out.println(product.toString());
	}

	/*
	 * // 장바구니안에 상품이 존재하는지 확인
	 * 
	 * @Test public void Cartitemconsist() { cartmapper.Cartitemconsist(cart) }
	 */

	// 장바구니의 수량 업데이트
	@Test
	public void UpdateCartstock(CartVO cart) {

	}

	// 장바구니 삭제
	public void deleteCart(CartVO cart) {

	}

}
