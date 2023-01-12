package com.hyundai.dutyfree.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyundai.dutyfree.service.CartService;
import com.hyundai.dutyfree.vo.CartVO;
import com.hyundai.dutyfree.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart")
public class CartController {

	private final CartService cartservice;
	
	public CartController(CartService cartservice) {
		this.cartservice=cartservice;
	}
	
	
	@GetMapping("/cartlist")
	public void cartlist(String mid,Model model){
		model.addAttribute("cartlist", cartservice.getCartList());
	}
	
	 @PostMapping("/insertCart")
	 @ResponseBody// 이거 안하면 return값을 jsp 찾으라는걸로 인식함
	 public String insertShoppingbag(HttpServletRequest request,CartVO cart) throws Exception {
	      log.info("장바구니 담기 진입!");
	      

	      // jsp에서 name에 입력된 값 vo에 저장      
		/*
		 * member.setMid(request.getParameter("mid"));
		 * member.setPid(request.getParameter("pid"));
		 * member.setPsize(request.getParameter("psize"));
		 * member.setPcolor(request.getParameter("pcolor"));
		 * member.setPamount(Integer.parseInt(request.getParameter("pamount")));
		 */
	      
		/*
		 * // 장바구니 담기 실시 int select = memberservice.selectShoppingBag(msVO);
		 */
	      
		/*
		 * if(select>0) { log.info("이미 장바구니에 존재합니다"); return "fail:-1"; }
		 */

	      // 장바구니 담기 실시
	      cartservice.insertCart(cart);
	      
	      
	      
	      //바뀐 장바구니 갯수 !
	      //int count = cartservice.getShoppingBagCount((String)session.getAttribute("member"));
	      
		/*
		 * session.setAttribute("sbCount", count);// 바뀐 장바구니 갯수 다시 세서 가져오기
		 * log.info("당바구니 담기 성공!");
		 */ 
		return "success:"/* +count */;
		 

		}
}
