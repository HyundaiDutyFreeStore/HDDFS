package com.hyundai.dutyfree.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyundai.dutyfree.service.CartService;
import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.service.OrderService;
import com.hyundai.dutyfree.service.ProductService;
import com.hyundai.dutyfree.vo.CartVO;
import com.hyundai.dutyfree.vo.CartVOforJSP;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.PassportVO;
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
 * 2023.01.12    박진수                        장바구니 목록 조회
 * 2023.01.13    박진수                        장바구니 상품 등록
 * 2023.01.14    박진수                        장바구니 상품 수정
 * 2023.01.14    박진수                        장바구니 상품 조회 확인
 * 2023.01.15    박진수                        장바구니 상품 삭제 
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
	
	@Autowired
	private OrderService orderservice;
	
	@Autowired
	private MemberService memberservice;

	// 장바구니 목록을 가져옴
	@GetMapping("/cartlist")
	public void cartlist(String align, Model model,Principal prin) throws Exception {
		String mid = prin.getName();
		List<CartVO> cartlist = cartservice.getCartList(mid,align);
		List<CartVOforJSP> cartjsplist = new ArrayList<CartVOforJSP>();
		PassportVO passport=orderservice.PassportConsist(mid);
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
				
				if (product.getImg1() != null) {
					cartjsp.setImg1(product.getImg1());
				}
				cartjsp.setCartstock(c.getCartstock());
				if(product.getPstock()==0) {
					cartjsp.setCartprodcon(false);
				}else {
					cartjsp.setCartprodcon(true);
				}
				cartjsplist.add(cartjsp);
		}

		if(passport!=null) {
			model.addAttribute("userpassport", passport);
		}else {
			model.addAttribute("userpassport", null);
		}
		MemberVO member=memberservice.read(prin.getName());
		double mhdiscount;
		if(member.getMtotal()>20000) {
			mhdiscount=3;
		}else if(member.getMtotal()>10000) {
			mhdiscount=2;
		}else {
			mhdiscount=1;
		}
		model.addAttribute("mhdiscount", mhdiscount);
		model.addAttribute("cartlist", cartjsplist);
		model.addAttribute("align", align);
	}

	// 장바구니 상품들을 등록
	@PostMapping("/insertCart")
	@ResponseBody
	public String insertCart(HttpServletRequest request, CartVO cart,Principal prin) throws Exception {

		cart.setCartstock(Integer.parseInt(request.getParameter("cartstock")));
		//cart.setMid(request.getParameter("mid"));
		cart.setMid(prin.getName());
		cart.setPcode(request.getParameter("pcode"));

		cartservice.insertCart(cart);

		return "success";

	}
	
	// 장바구니 상품들을 업데이트
	@PostMapping("/updateCart")
	@ResponseBody
	public String updateCart(HttpServletRequest request, CartVO cart,Principal prin) throws Exception {

			cart.setCartstock(Integer.parseInt(request.getParameter("cartstock")));
			//cart.setMid(request.getParameter("mid"));
			cart.setMid(prin.getName());
			cart.setPcode(request.getParameter("pcode"));
			
			cartservice.UpdateCartstock(cart);

			return "success";

	}


	// 장바구니에 상품이 들어있는지 확인
	@PostMapping("/isselect")
	@ResponseBody
	public String isselect(HttpServletRequest request, CartVO cart,Principal prin) throws Exception {

		//cart.setMid(request.getParameter("mid"));
		cart.setMid(prin.getName());
		cart.setPcode(request.getParameter("pcode"));

		int finditem = cartservice.Cartitemconsist(cart);

		if (finditem != 0) {
			return "yes";
		} else {
			return "no";
		}

	}
	
	
	//장바구니 물품 삭제
	@PostMapping("/deleteCart")
	@ResponseBody
	public String deleteCart(HttpServletRequest request,CartVO cart,Principal prin) {
		//cart.setMid(request.getParameter("mid"));
		cart.setMid(prin.getName());
		cart.setPcode(request.getParameter("pcode"));
		cartservice.deleteCart(cart);
		return "success";
	}

}
