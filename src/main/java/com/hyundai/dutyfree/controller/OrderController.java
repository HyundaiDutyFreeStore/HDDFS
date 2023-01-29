package com.hyundai.dutyfree.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.security.Principal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.json.simple.parser.JSONParser;

import net.sf.*;
import net.sf.json.JSON;
import net.sf.json.JSONArray;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.hyundai.dutyfree.service.CartService;
import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.service.OrderService;
import com.hyundai.dutyfree.service.ProductService;
import com.hyundai.dutyfree.vo.CartVO;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderItemListVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.PassportVO;
import com.hyundai.dutyfree.vo.ProductVO;

import lombok.extern.log4j.Log4j;


/**
 *OrderController
 * 
 * @author 박진수
 * @since 01.16
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.16    박진수                        최초 생성
 * 2023.01.17    박진수                        여권정보페이지 로드 및 여권정보 등록
 * 2023.01.18    박진수                        출국정보 페이지 로드 및 출국정보 등록
 * 2023.01.19    박진수                        지불페이지 로드 및 결제 구현
 *        </pre>
 */
@Controller
@RequestMapping("/order")
@Log4j
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private OrderService orderservice;

	@Autowired
	private ProductService productservice;

	@Autowired
	private MemberService memberservice;

	@Autowired
	private CartService cartservice;

	@Autowired
	private JavaMailSender mailSender;

	// 주문한 물품을 결제
	@PostMapping("/postorderpays")
	@ResponseBody
	public String orderexec(HttpServletRequest request, Model model, Principal prin) throws Exception {

		List<OrderItemVO> orderitemlist = new ArrayList<OrderItemVO>();
		System.out.println(request.getParameter("orderitemlists"));
		String[] split1 = request.getParameter("orderitemlists").split("OrderItemVO");
		for (int i = 0; i < split1.length; i++) {
			if (split1[i].equals("[")) {
				continue;
			}
			OrderItemVO orderitem = new OrderItemVO();
			String[] split2 = split1[i].split(",");
			for (int j = 0; j < split2.length; j++) {
				System.out.println("j" + j + split2[j]);
			}
			String pcode = split2[0].substring(7);
			String oamount = split2[1].substring(9);
			orderitem.setPcode(pcode);
			orderitem.setOamount(Integer.parseInt(oamount));
			System.out.println(split2[0].substring(7));
			System.out.println(split2[1].substring(9));
			orderitemlist.add(orderitem);
		}

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}

		MemberVO member = memberservice.read(prin.getName());
		int ordertotalstock = 0;
		java.util.Date nowdate = new java.util.Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String oid = "OR" + simpleDateFormat.format(nowdate);
		orderservice.Insertorderlist(oid, prin.getName(), Integer.parseInt(request.getParameter("mhpoint")), "pay_complete",
				request.getParameter("olvodeptdate"), request.getParameter("olvoplnum"),
				request.getParameter("olvoelnum"), request.getParameter("olvoplace"));
		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			orderservice.Inserorderitem(order.getPcode(), order.getOamount(), oid);
			cartservice.redproductcnt(order.getPcode(),product.getPstock()-order.getOamount(), product.getPsel()+order.getOamount());
			CartVO cart = new CartVO();
			cart.setPcode(order.getPcode());
			cart.setMid(prin.getName());

			ordertotalstock += order.getOamount();
		}

		member.setMid(prin.getName());
		System.out.println("mhpoint:"+Integer.parseInt(request.getParameter("mhpoint")));
		member.setMhpoint(Integer.parseInt(request.getParameter("mhpoint"))-Integer.parseInt(request.getParameter("used_mhpoint")));
		member.setMtotal(Double.parseDouble(request.getParameter("total_bill_dollar")));
			
		

		// 주문자의 포인트 및 총주문금액을 업데이트
		memberservice.updateMhpoint(member);

		model.addAttribute("total_bill_dollar_text", request.getParameter("total_bill_dollar_text"));
		System.out.println(ordertotalstock);
		model.addAttribute("member", member);
		model.addAttribute("oid", oid);
		model.addAttribute("orderitemlist", orderitemlist);

		return oid;

	}

	// 출국정보를 등록하고 지불페이지로 이동
	@PostMapping("/orderpays")
	public String postorderpay(HttpServletRequest request, OrderItemListVO orderitemlists, Model model, Principal prin)
			throws Exception {

		List<OrderItemVO> orderitemlist = orderitemlists.getOrderitem();
		MemberVO member = memberservice.read(prin.getName());
		float cartprice = 0;
		float cartdisprice = 0;
		float cartdis = 0;
		int cartstock = 0;
		String orderName = "";
		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			if (cartprice == 0) {
				orderName += product.getPname();
			}
			cartprice += (product.getPprice() * order.getOamount());
			cartdisprice += (cartprice * (1 - ((float) product.getPdiscount() / 100))) * order.getOamount();
			cartdis += product.getPprice() * ((float) product.getPdiscount() / 100) * order.getOamount();
			cartstock += order.getOamount();
		}

		// 토스페이에 상품 이름을 담기 위해 필요
		if (orderitemlist.size() > 1) {
			orderName += " 외" + (orderitemlist.size() - 1) + "개";
		}

		String orderDpatPlacCd = request.getParameter("orderDpatPlacCd");
		String oplnum = request.getParameter("openNm");
		String odeptdate = request.getParameter("odeptdate");
		String dpatTmH = request.getParameter("dpatTmH");
		String dpatTmM = request.getParameter("dpatTmM");
		String ugntComuMophNo = request.getParameter("ugntComuMophNo");

		OrderListVO olv = new OrderListVO();
		olv.setMid(prin.getName());
		olv.setOplnum(oplnum);

		String[] dpatTmHarr = dpatTmH.split("시");
		String[] dpatTmMarr = dpatTmM.split("분");
		String date = odeptdate + " " + dpatTmHarr[0] + ":" + dpatTmMarr[0];

		olv.setOdeptdate(date);
		olv.setOelnum(ugntComuMophNo);
		olv.setOplace(orderDpatPlacCd);

		model.addAttribute("member", member);
		model.addAttribute("cartprice", cartprice);
		model.addAttribute("cartdisprice", cartdisprice);
		model.addAttribute("cartdis", cartdis);
		model.addAttribute("cartstock", cartstock);
		model.addAttribute("orderitemlist", orderitemlist);
		model.addAttribute("orderlist", olv);
		model.addAttribute("cartcounttotal", request.getParameter("cartcounttotal"));
		model.addAttribute("mhdiscount", request.getParameter("mhdiscount"));
		model.addAttribute("passport", orderservice.PassportConsist(prin.getName()));
		model.addAttribute("orderName", orderName);
		return "/order/orderpays";
	}

	// 출국정보를 가져온다.
	@GetMapping("/DepartureInfo")
	public void DepartureInfo(HttpServletRequest request, OrderItemListVO orderitemlists, Model model, Principal prin)
			throws Exception {
		List<OrderItemVO> orderitemlist = orderitemlists.getOrderitem();
		MemberVO member = memberservice.read(prin.getName());
		float cartprice = 0;
		float cartdisprice = 0;
		float cartdis = 0;
		int cartstock = 0;

		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			cartprice += (product.getPprice() * order.getOamount());
			cartdisprice += (cartprice * (1 - ((float) product.getPdiscount() / 100))) * order.getOamount();
			cartdis += product.getPprice() * ((float) product.getPdiscount() / 100) * order.getOamount();
			cartstock += order.getOamount();
		}

		model.addAttribute("member", member);
		model.addAttribute("cartprice", cartprice);
		model.addAttribute("cartdisprice", cartdisprice);
		model.addAttribute("cartdis", cartdis);
		model.addAttribute("cartstock", cartstock);
		model.addAttribute("orderitemlist", orderitemlist);
		model.addAttribute("cartcounttotal", request.getParameter("cartcounttotal"));
		model.addAttribute("mhdiscount", request.getParameter("mhdiscount"));
	}

	// 출국정보 입력페이지로 이동한다.
	@PostMapping("/goDepartureInfo")
	public String goDepartureInfo(HttpServletRequest request, OrderItemListVO orderitemlists, Model model) {
		List<OrderItemVO> orderitemlist = orderitemlists.getOrderitem();
		float cartprice = 0;
		float cartdisprice = 0;
		float cartdis = 0;
		int cartstock = 0;
		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			cartprice += (product.getPprice() * order.getOamount());
			cartdisprice += (cartprice * (1 - ((float) product.getPdiscount() / 100))) * order.getOamount();
			cartdis += product.getPprice() * ((float) product.getPdiscount() / 100) * order.getOamount();
			cartstock += order.getOamount();
		}

		model.addAttribute("cartprice", cartprice);
		model.addAttribute("cartdisprice", cartdisprice);
		model.addAttribute("cartdis", cartdis);
		model.addAttribute("cartstock", cartstock);
		model.addAttribute("orderitemlist", orderitemlist);
		model.addAttribute("cartcounttotal", request.getParameter("cartcounttotal"));
		model.addAttribute("mhdiscount", request.getParameter("mhdiscount"));
		return "/order/DepartureInfo";
	}

	// 여권번호 등록 페이지로 이동
	@PostMapping("/PassportInfo")
	public void PassportInfo(OrderItemListVO orderitemlists, Model model, HttpServletRequest request, Principal prin)
			throws Exception {
		List<OrderItemVO> orderitemlist = orderitemlists.getOrderitem();
		MemberVO member = memberservice.read(prin.getName());

		float cartprice = 0;
		float cartdisprice = 0;
		float cartdis = 0;
		int cartstock = 0;

		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			cartprice += (product.getPprice() * order.getOamount());
			cartdisprice += (cartprice * (1 - ((float) product.getPdiscount() / 100))) * order.getOamount();
			cartdis += product.getPprice() * ((float) product.getPdiscount() / 100) * order.getOamount();
			cartstock += order.getOamount();
		}
		model.addAttribute("mhdiscount", request.getParameter("mhdiscount"));
		model.addAttribute("member", member);
		model.addAttribute("cartprice", cartprice);
		model.addAttribute("cartdisprice", cartdisprice);
		model.addAttribute("cartdis", cartdis);
		model.addAttribute("cartstock", cartstock);
		model.addAttribute("orderitemlist", orderitemlist);
		model.addAttribute("cartcounttotal", request.getParameter("cartcounttotal"));
	}

	//
	@PostMapping("/PassportConsist")
	public String PassportConsist(HttpServletRequest request) {

		String mid = request.getParameter("mid");

		PassportVO passport = orderservice.PassportConsist(mid);

		if (passport == null) {
			return "no";
		} else {
			return "yes";
		}

	}

	// 여권정보를 등록
	@PostMapping("/enrollPassport")
	public String enrollPassport(HttpServletRequest request, OrderItemListVO orderitemlists, Model model)
			throws ParseException {
		PassportVO passport = new PassportVO();

		List<OrderItemVO> orderitemlist = orderitemlists.getOrderitem();
		float cartprice = 0;
		float cartdisprice = 0;
		float cartdis = 0;
		int cartstock = 0;

		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			cartprice += (product.getPprice() * order.getOamount());
			cartdisprice += (cartprice * (1 - ((float) product.getPdiscount() / 100))) * order.getOamount();
			cartdis += product.getPprice() * ((float) product.getPdiscount() / 100) * order.getOamount();
			cartstock += order.getOamount();
		}

		model.addAttribute("cartprice", cartprice);
		model.addAttribute("cartdisprice", cartdisprice);
		model.addAttribute("cartdis", cartdis);
		model.addAttribute("cartstock", cartstock);
		model.addAttribute("orderitemlist", orderitemlist);
		model.addAttribute("mhdiscount", request.getParameter("mhdiscount"));

		passport.setMid(request.getParameter("mId"));
		passport.setPassportno(request.getParameter("mPsptno"));
		passport.setSurname(request.getParameter("mLastname"));
		passport.setGivenname(request.getParameter("mFirstname"));
		passport.setPgender(request.getParameter("mGender"));


		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");


		Date DatemBirth = Date.valueOf(request.getParameter("mBirth"));

		passport.setPbirth(DatemBirth);

		passport.setNationality(request.getParameter("mNationality"));

		Date DatemPsptexdit = Date.valueOf(request.getParameter("mPsptexdit"));

		passport.setExpirydate(DatemPsptexdit);

		orderservice.insertPassport(passport);

		return "/order/DepartureInfo";

	}
	
	@RequestMapping("/deleteorder")
	@ResponseBody
	public String deleteorder(String oid) {
		List<OrderItemVO>oiv=orderservice.getOrderitemlist(oid);
		for(OrderItemVO oi : oiv) {
			ProductVO product=productservice.productdetail(oi.getPcode());
			cartservice.redproductcnt(product.getPcode(), product.getPstock()+oi.getOamount(), product.getPsel()-oi.getOamount());
		}
		orderservice.deleteorder(oid);
		return "yes";
	}
	
	@RequestMapping("/cancelorder")
	@ResponseBody
	public String cancelorder(String oid,double order_dollar, Principal prin) throws Exception {
		
		OrderListVO olv=orderservice.getorderlist(oid);
		
		MemberVO member= new MemberVO();
		member.setMid(prin.getName());
		member.setMhpoint(-1*(olv.getOhpoint()));
		member.setMtotal(-1*order_dollar);
		memberservice.updateMhpoint(member);
		
		List<OrderItemVO>oiv=orderservice.getOrderitemlist(oid);
		for(OrderItemVO oi : oiv) {
			ProductVO product=productservice.productdetail(oi.getPcode());
			cartservice.redproductcnt(product.getPcode(), product.getPstock()+oi.getOamount(), product.getPsel()-oi.getOamount());
		}
		orderservice.Updateostatus("pay_cancel", oid);
		return "yes";
	}

}