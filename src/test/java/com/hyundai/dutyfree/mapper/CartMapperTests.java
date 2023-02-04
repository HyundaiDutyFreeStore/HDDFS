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

import lombok.extern.log4j.Log4j;

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
@Log4j
public class CartMapperTests {

	@Autowired
	private CartMapper cartmapper;

	// 장바구니 목록을 가격 기준으로 정렬하는 테스트
	@Test
	public void getCartListpriceTests() { 
		HashMap<String, String> listMap = new HashMap<>();
		String mid="test1";
		String align="hprice";
		double KRW_WON=1267.0;
		List<CartVO> cartlist=cartmapper.getCartListprice(mid, align, KRW_WON);
		for(CartVO cart:cartlist) {
			log.info(cart.toString());
		}
	}
	
	//장바구니 리스트를 출국일 기준으로 정렬하는 테스트
	@Test
	public void getCartListregDate() {
		HashMap<String, String> listMap = new HashMap<>();
		listMap.put("mid", "test1");
		listMap.put("align","lput");
		List<CartVO> cartlist=cartmapper.getCartListregDate(listMap);
		for(CartVO cart:cartlist) {
			log.info(cart.toString());
		}
	}

	// 장바구니에 물품을 등록하는 테스트
	@Test 
	public void insertCartTests() { 
	  CartVO cart=new CartVO();
	  cart.setMid("test1");
	  cart.setCartstock(100);
	  cart.setPcode("105261200055"); 
	  cartmapper.insertCart(cart);
	  log.info("장바구니 상품 등록 수행!");
	}
	 

	// 상품의 재고량을 1 감소하는 테스트
	@Test
	public void redproductcntTests() {
		ProductVO product=new ProductVO();
		product.setPcode("105261200055");
		product.setPstock(100);
		product.setPsel(10);
		cartmapper.redproductcnt(product);
		log.info("상품 재고량 감소!");
	}

	// 상품의 정보를 가져오는 테스트
	@Test
	public void prodinfoTests() {
		ProductVO product=cartmapper.prodinfo("105261200055");
		log.info(product.toString());
	}

	
	// 장바구니안의 상품이 존재하는지 확인하는 테스트
	@Test 
	public void CartitemconsistTests() { 
		String pcode="565660300014";
		String mid="2635533884";
		CartVO cart=new CartVO();
		cart.setPcode(pcode);
		cart.setMid(mid);
		log.info(cartmapper.Cartitemconsist(cart));
		}
	 

	// 장바구니의 수량 업데이트 테스트
	@Test
	public void UpdateCartstockTests() {
		String pcode="565660300014";
		String mid="2635533884";
		CartVO cart=new CartVO();
		cart.setPcode(pcode);
		cart.setMid(mid);
		cartmapper.UpdateCartstock(cart);
		log.info("장바구니 수량 업데이트 수행!");
	}

	// 장바구니 삭제 테스트
	@Test
	public void deleteCart(CartVO cart) {
		String pcode="565660300014";
		String mid="2635533884";
		CartVO carts=new CartVO();
		carts.setPcode(pcode);
		carts.setMid(mid);
		cartmapper.deleteCart(carts);
		log.info("장바구니 식제 수행!");
		
	}

}
