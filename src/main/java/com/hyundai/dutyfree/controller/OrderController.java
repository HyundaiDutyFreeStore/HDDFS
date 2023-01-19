package com.hyundai.dutyfree.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.service.OrderService;
import com.hyundai.dutyfree.service.ProductService;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderItemListVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.PassportVO;
import com.hyundai.dutyfree.vo.ProductVO;

import lombok.extern.log4j.Log4j;

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

	// 주문한 물품을 결제
	@PostMapping("/postorderpays")
	public String orderexec(HttpServletRequest request, OrderItemListVO orderitemlists, Model model, Principal prin)
			throws Exception {
		System.out.println(orderitemlists.toString());
		List<OrderItemVO> orderitemlist = orderitemlists.getOrderitem();
		MemberVO member = memberservice.read(prin.getName());
		int ordertotalstock = 0;
		java.util.Date nowdate = new java.util.Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String oid = "OR" + simpleDateFormat.format(nowdate);

		simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date odate = java.sql.Date.valueOf(simpleDateFormat.format(nowdate));

		System.out.println("Oarrdate:" + request.getParameter("olvoarrdate"));
		System.out.println("Oplnum:" + request.getParameter("olvoplnum"));
		System.out.println("Elnum:" + request.getParameter("olvoelnum"));
		System.out.println("Oplace:" + request.getParameter("olvoplace"));

		System.out.println("oid:" + oid);
		orderservice.Insertorderitemlist(oid, prin.getName(), odate, 0, "결제완료", request.getParameter("olvoarrdate"),
				request.getParameter("olvoplnum"), request.getParameter("olvoelnum"),
				request.getParameter("olvoplace"));

		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			System.out.println(product.getPprice());
			System.out.println(product.getPdiscount());
			orderservice.Inserorderitem(order.getPcode(), order.getOamount(), oid);
			ordertotalstock += order.getOamount();
		}

		System.out.println("총 결제금액:" + request.getParameter("wontotalSettKrw"));

		model.addAttribute("wontotalSettKrw", request.getParameter("wontotalSettKrw"));
		System.out.println(ordertotalstock);
		model.addAttribute("member", member);
		model.addAttribute("oid", oid);
		model.addAttribute("orderitemlist", orderitemlist);

		// 주문 QR코드 전송
		String root = request.getSession().getServletContext().getRealPath("resources"); // 서블릿 경로의 resources 폴더 찾기
		String savePath = root + "\\qrCodes\\"; // 파일 경로
		System.out.println(savePath);
		// 파일 경로가 없으면 생성하기
		File file = new File(savePath);
		if (!file.exists()) {
			file.mkdirs();
		}

		// 링크로 할 URL주소
		String url = oid;

		// 링크 생성값
		String codeurl = new String(url.getBytes("UTF-8"), "ISO-8859-1");

		// QRCode 색상값
		int qrcodeColor = 0xFF2e4e96;
		// QRCode 배경색상값
		int backgroundColor = 0xFFFFFFFF;

		// QRCode 생성
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE, 200, 200); // 200,200은 width, height

		MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor, backgroundColor);
		BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix, matrixToImageConfig);

		String fileName = oid;

		// 파일 경로, 파일 이름 , 파일 확장자에 맡는 파일 생성
		File temp = new File(savePath + fileName + ".png");

		// ImageIO를 사용하여 파일쓰기
		ImageIO.write(bufferedImage, "png", temp);

		return "/order/orderdone";
	}

	// 출국정보를 등록하고 지불페이지로 이동
	@PostMapping("/orderpays")
	public String postorderpay(HttpServletRequest request, OrderItemListVO orderitemlists, Model model, Principal prin)
			throws Exception {
		System.out.println(orderitemlists.toString());
		List<OrderItemVO> orderitemlist = orderitemlists.getOrderitem();
		MemberVO member = memberservice.read(prin.getName());
		float cartprice = 0;
		float cartdisprice = 0;
		float cartdis = 0;
		int cartstock = 0;
		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			System.out.println(product.getPprice());
			System.out.println(product.getPdiscount());
			cartprice += (product.getPprice() * order.getOamount());
			System.out.println(1 - ((float) product.getPdiscount() / 100));
			cartdisprice += (cartprice * (1 - ((float) product.getPdiscount() / 100))) * order.getOamount();
			cartdis += product.getPprice() * ((float) product.getPdiscount() / 100) * order.getOamount();
			cartstock += order.getOamount();
		}

		String orderDpatPlacCd = request.getParameter("orderDpatPlacCd");
		String oplnum = request.getParameter("openNm");
		String oarrdate = request.getParameter("oarrdate");
		String dpatTmH = request.getParameter("dpatTmH");
		String dpatTmM = request.getParameter("dpatTmM");
		String ugntComuMophNo = request.getParameter("ugntComuMophNo");
		OrderListVO olv = new OrderListVO();
		olv.setMid(prin.getName());
		olv.setOplnum(oplnum);
		String[] dpatTmHarr = dpatTmH.split("시");
		String[] dpatTmMarr = dpatTmM.split("분");
		String date = oarrdate + " " + dpatTmHarr[0] + ":" + dpatTmMarr[0];
		olv.setOarrdate(date);
		olv.setOelnum(ugntComuMophNo);
		olv.setOplace(orderDpatPlacCd);

		System.out.println(cartprice);
		System.out.println(cartdisprice);
		System.out.println(cartdis);
		System.out.println(cartstock);
		model.addAttribute("member", member);
		model.addAttribute("cartprice", cartprice);
		model.addAttribute("cartdisprice", cartdisprice);
		model.addAttribute("cartdis", cartdis);
		model.addAttribute("cartstock", cartstock);
		model.addAttribute("orderitemlist", orderitemlist);
		model.addAttribute("orderlist", olv);

		return "/order/orderpays";
	}

	/*
	 * //출국정보를 등록하고 지불페이지로 이동
	 * 
	 * @GetMapping("/orderpays") public String getorderpay(HttpServletRequest
	 * request, OrderItemListVO orderitemlists, Model model,Principal prin)throws
	 * Exception { System.out.println(orderitemlists.toString()); List<OrderItemVO>
	 * orderitemlist=orderitemlists.getOrderitem(); MemberVO
	 * member=memberservice.read(prin.getName()); float cartprice = 0; float
	 * cartdisprice=0; float cartdis=0; int cartstock=0; for(OrderItemVO order :
	 * orderitemlist) { ProductVO
	 * product=productservice.productdetail(order.getPcode());
	 * System.out.println(product.getPprice());
	 * System.out.println(product.getPdiscount());
	 * cartprice+=(product.getPprice()*order.getOamount());
	 * System.out.println(1-((float)product.getPdiscount()/100));
	 * cartdisprice+=(cartprice*(1-((float)product.getPdiscount()/100)))*order.
	 * getOamount();
	 * cartdis+=product.getPprice()*((float)product.getPdiscount()/100)*order.
	 * getOamount(); cartstock+=order.getOamount(); } System.out.println(cartprice);
	 * System.out.println(cartdisprice); System.out.println(cartdis);
	 * System.out.println(cartstock); model.addAttribute("member", member);
	 * model.addAttribute("cartprice", cartprice);
	 * model.addAttribute("cartdisprice", cartdisprice);
	 * model.addAttribute("cartdis",cartdis);
	 * model.addAttribute("cartstock",cartstock);
	 * model.addAttribute("orderitemlist",orderitemlist);
	 * 
	 * return "/order/orderpays"; }
	 */

	// 출국정보를 가져온다.
	@GetMapping("/DepartureInfo")
	public void DepartureInfo(HttpServletRequest request, OrderItemListVO orderitemlists, Model model, Principal prin)
			throws Exception {
		System.out.println(orderitemlists.toString());
		List<OrderItemVO> orderitemlist = orderitemlists.getOrderitem();
		MemberVO member = memberservice.read(prin.getName());
		float cartprice = 0;
		float cartdisprice = 0;
		float cartdis = 0;
		int cartstock = 0;
		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			System.out.println(product.getPprice());
			System.out.println(product.getPdiscount());
			cartprice += (product.getPprice() * order.getOamount());
			System.out.println(1 - ((float) product.getPdiscount() / 100));
			cartdisprice += (cartprice * (1 - ((float) product.getPdiscount() / 100))) * order.getOamount();
			cartdis += product.getPprice() * ((float) product.getPdiscount() / 100) * order.getOamount();
			cartstock += order.getOamount();
		}
		System.out.println(cartprice);
		System.out.println(cartdisprice);
		System.out.println(cartdis);
		System.out.println(cartstock);
		model.addAttribute("member", member);
		model.addAttribute("cartprice", cartprice);
		model.addAttribute("cartdisprice", cartdisprice);
		model.addAttribute("cartdis", cartdis);
		model.addAttribute("cartstock", cartstock);
		model.addAttribute("orderitemlist", orderitemlist);
	}

	// 출국정보 입력페이지로 이동한다.
	@PostMapping("/goDepartureInfo")
	public String goDepartureInfo(HttpServletRequest request, OrderItemListVO orderitemlists, Model model) {
		System.out.println(orderitemlists.toString());
		List<OrderItemVO> orderitemlist = orderitemlists.getOrderitem();
		float cartprice = 0;
		float cartdisprice = 0;
		float cartdis = 0;
		int cartstock = 0;
		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			System.out.println(product.getPprice());
			System.out.println(product.getPdiscount());
			cartprice += (product.getPprice() * order.getOamount());
			System.out.println(1 - ((float) product.getPdiscount() / 100));
			cartdisprice += (cartprice * (1 - ((float) product.getPdiscount() / 100))) * order.getOamount();
			cartdis += product.getPprice() * ((float) product.getPdiscount() / 100) * order.getOamount();
			cartstock += order.getOamount();
		}
		System.out.println(cartprice);
		System.out.println(cartdisprice);
		System.out.println(cartdis);
		System.out.println(cartstock);
		model.addAttribute("cartprice", cartprice);
		model.addAttribute("cartdisprice", cartdisprice);
		model.addAttribute("cartdis", cartdis);
		model.addAttribute("cartstock", cartstock);
		model.addAttribute("orderitemlist", orderitemlist);
		return "/order/DepartureInfo";
	}

	// 여권번호를 등록
	@PostMapping("/PassportInfo")
	public void PassportInfo(OrderItemListVO orderitemlists, Model model, HttpServletRequest request, Principal prin)
			throws Exception {
		System.out.println("Passport");
		System.out.println(orderitemlists.toString());
		List<OrderItemVO> orderitemlist = orderitemlists.getOrderitem();
		MemberVO member = memberservice.read(prin.getName());
		float cartprice = 0;
		float cartdisprice = 0;
		float cartdis = 0;
		int cartstock = 0;
		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			System.out.println(product.getPprice());
			System.out.println(product.getPdiscount());
			cartprice += (product.getPprice() * order.getOamount());
			System.out.println(1 - ((float) product.getPdiscount() / 100));
			cartdisprice += (cartprice * (1 - ((float) product.getPdiscount() / 100))) * order.getOamount();
			cartdis += product.getPprice() * ((float) product.getPdiscount() / 100) * order.getOamount();
			cartstock += order.getOamount();
		}
		System.out.println(cartprice);
		System.out.println(cartdisprice);
		System.out.println(cartdis);
		System.out.println(cartstock);
		model.addAttribute("member", member);
		model.addAttribute("cartprice", cartprice);
		model.addAttribute("cartdisprice", cartdisprice);
		model.addAttribute("cartdis", cartdis);
		model.addAttribute("cartstock", cartstock);
		model.addAttribute("orderitemlist", orderitemlist);

	}

	//
	@PostMapping("/PassportConsist")
	public String PassportConsist(HttpServletRequest request) {

		String mid = request.getParameter("mid");

		PassportVO passport = orderservice.PassportConsist(mid);

		if (passport == null) {
			System.out.println("no");
			return "no";
		} else {
			System.out.println("yes");
			return "yes";
		}

	}

	// 여권정보를 등록
	@PostMapping("/enrollPassport")
	public String enrollPassport(HttpServletRequest request, OrderItemListVO orderitemlists, Model model)
			throws ParseException {
		System.out.println("enroll");
		PassportVO passport = new PassportVO();
		System.out.println(orderitemlists.toString());

		List<OrderItemVO> orderitemlist = orderitemlists.getOrderitem();
		float cartprice = 0;
		float cartdisprice = 0;
		float cartdis = 0;
		int cartstock = 0;
		for (OrderItemVO order : orderitemlist) {
			ProductVO product = productservice.productdetail(order.getPcode());
			System.out.println(product.getPprice());
			System.out.println(product.getPdiscount());
			cartprice += (product.getPprice() * order.getOamount());
			System.out.println(1 - ((float) product.getPdiscount() / 100));
			cartdisprice += (cartprice * (1 - ((float) product.getPdiscount() / 100))) * order.getOamount();
			cartdis += product.getPprice() * ((float) product.getPdiscount() / 100) * order.getOamount();
			cartstock += order.getOamount();
		}
		System.out.println(cartprice);
		System.out.println(cartdisprice);
		System.out.println(cartdis);
		System.out.println(cartstock);
		model.addAttribute("cartprice", cartprice);
		model.addAttribute("cartdisprice", cartdisprice);
		model.addAttribute("cartdis", cartdis);
		model.addAttribute("cartstock", cartstock);
		model.addAttribute("orderitemlist", orderitemlist);

		passport.setMid(request.getParameter("mId"));
		passport.setPassportno(request.getParameter("mPsptno"));
		passport.setSurname(request.getParameter("mLastname"));
		passport.setGivenname(request.getParameter("mFirstname"));
		passport.setPgender(request.getParameter("mGender"));

		// 포맷터
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		// 문자열 -> Date
		Date DatemBirth = Date.valueOf(request.getParameter("mBirth"));

		passport.setPbirth(DatemBirth);

		passport.setNationality(request.getParameter("mNationality"));

		Date DatemPsptexdit = Date.valueOf(request.getParameter("mPsptexdit"));

		passport.setExpirydate(DatemPsptexdit);

		System.out.println(passport.toString());

		orderservice.insertPassport(passport);

		/*
		 * System.out.println(request.getParameter("totalGoosUsdinput"));
		 * System.out.println(request.getParameter("totalDcUsdinput"));
		 * System.out.println(request.getParameter("cartstockinput"));
		 * model.addAttribute("cartprice", request.getParameter("totalGoosUsdinput"));
		 * model.addAttribute("cartdis", request.getParameter("totalDcUsdinput"));
		 * model.addAttribute("cartstock", request.getParameter("cartstockinput"));
		 */
		return "/order/DepartureInfo";

	}

	@RequestMapping(value = "qr", method = RequestMethod.GET)
	public void makeqr() {
		logger.info("qr페이지 진입");
	}

	@RequestMapping(value = "/qr", method = RequestMethod.POST)
	public void makeqr(HttpServletRequest request, HttpSession session) throws WriterException, IOException {

		String root = request.getSession().getServletContext().getRealPath("resources"); // 서블릿 경로의 resources 폴더 찾기
		String savePath = root + "\\qrCodes\\"; // 파일 경로
		System.out.println(savePath);
		// 파일 경로가 없으면 생성하기
		File file = new File(savePath);
		if (!file.exists()) {
			file.mkdirs();
		}

		// 링크로 할 URL주소
		String url = "나중에 order id 넣을곳";

		// 링크 생성값
		String codeurl = new String(url.getBytes("UTF-8"), "ISO-8859-1");

		// QRCode 색상값
		int qrcodeColor = 0xFF2e4e96;
		// QRCode 배경색상값
		int backgroundColor = 0xFFFFFFFF;

		// QRCode 생성
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE, 200, 200); // 200,200은 width, height

		MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor, backgroundColor);
		BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix, matrixToImageConfig);

		String fileName = "test";

		// 파일 경로, 파일 이름 , 파일 확장자에 맡는 파일 생성
		File temp = new File(savePath + fileName + ".png");

		// ImageIO를 사용하여 파일쓰기
		ImageIO.write(bufferedImage, "png", temp);

	}

	public void order() {
		/*
		 * Date date=new Date(); SimpleDateFormat simpleDateFormat = new
		 * SimpleDateFormat("yyyyMMddHHmmss");
		 * 
		 * //원하는 데이터 포맷 지정 String strNowDate = simpleDateFormat.format(date);
		 * 
		 * String oid="OR"+strNowDate;
		 */

	}
}
