package com.hyundai.dutyfree.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyundai.dutyfree.service.CartService;
import com.hyundai.dutyfree.service.ProductService;
import com.hyundai.dutyfree.vo.CartVO;
import com.hyundai.dutyfree.vo.CartVOforJSP;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.ProductVO;

import lombok.extern.log4j.Log4j;

/**
 * CartController
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
@Controller
@Log4j
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartservice;

	@Autowired
	private ProductService productservice;

	// 장바구니 목록을 가져옴
	@GetMapping("/cartlist")
	public void cartlist(String mid, Model model) {
		System.out.println(mid);
		List<CartVO> cartlist = cartservice.getCartList(mid);
		List<CartVOforJSP> cartjsplist = new ArrayList<CartVOforJSP>();
		for (CartVO c : cartlist) {
			ProductVO product = productservice.productdetail(c.getPcode());
			CartVOforJSP cartjsp = new CartVOforJSP();
			cartjsp.setPname(product.getPname());
			cartjsp.setPbrand(product.getPbrand());
			cartjsp.setPprice(product.getPprice());
			cartjsp.setPdiscount(product.getPdiscount());
			cartjsp.setPcode(product.getPcode());
			cartjsp.setPstock(product.getPstock());
			cartjsp.setCartno(c.getCartno());
			System.out.println(product.getImg1());
			if (product.getImg1() != null) {
				cartjsp.setImg1(product.getImg1());
			}
			cartjsp.setMid(c.getMid());
			cartjsp.setCartstock(c.getCartstock());
			cartjsplist.add(cartjsp);
		}
		for(CartVOforJSP c : cartjsplist) {
			System.out.println(c.toString());
		}
		model.addAttribute("cartlist", cartjsplist);
	}

	// 장바구니 상품들을 등록
	@PostMapping("/insertCart")
	@ResponseBody
	public String insertCart(HttpServletRequest request, CartVO cart) throws Exception {

		log.info("장바구니 담기 진입!");

		cart.setCartstock(Integer.parseInt(request.getParameter("cartstock")));
		cart.setMid(request.getParameter("mid"));
		cart.setPcode(request.getParameter("pcode"));

		cartservice.insertCart(cart);
		
		cartservice.redproductcnt(request.getParameter("pcode"), Integer.parseInt(request.getParameter("cartstock")));

		return "success";

	}
	
		// 장바구니 상품들을 업데이트
		@PostMapping("/updateCart")
		@ResponseBody
		public String updateCart(HttpServletRequest request, CartVO cart) throws Exception {

			log.info("장바구니 담기 진입!");

			cart.setCartstock(Integer.parseInt(request.getParameter("cartstock")));
			cart.setMid(request.getParameter("mid"));
			cart.setPcode(request.getParameter("pcode"));
			
			cartservice.UpdateCartstock(cart);
		
			cartservice.redproductcnt(request.getParameter("pcode"), Integer.parseInt(request.getParameter("cartstock")));

			return "success";

		}


	// 장바구니에 상품이 들어있는지 확인
	@PostMapping("/isselect")
	@ResponseBody
	public String isselect(HttpServletRequest request, CartVO cart) throws Exception {

		System.out.println("cartcontroller 진입");

		cart.setMid(request.getParameter("mid"));
		cart.setPcode(request.getParameter("pcode"));

		int finditem = cartservice.Cartitemconsist(cart);

		if (finditem != 0) {
			return "yes";
		} else {
			return "no";
		}

	}
	
	@PostMapping("/deleteCart")
	@ResponseBody
	public String deleteCart(HttpServletRequest request,CartVO cart) {
		cart.setMid(request.getParameter("mid"));
		cart.setCartno(Integer.parseInt(request.getParameter("cartno")));
		cartservice.deleteCart(cart);
		return "success";
	}

}
