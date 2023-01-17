package com.hyundai.dutyfree.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.hyundai.dutyfree.service.OrderService;
import com.hyundai.dutyfree.vo.PassportVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/order")
@Log4j
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private OrderService service;
	
	
	@GetMapping("/orderpays")
	public void orderpay() {
	}

	@GetMapping("/DepartureInfo")
	public void DepartureInfo() {

	}

	@PostMapping("/PassportInfo")
	public void PassportInfo(HttpServletRequest request,Model model) {
		System.out.println("Passport");
		model.addAttribute("cartprice", request.getParameter("cartprice"));
		model.addAttribute("cartdisprice", request.getParameter("cartdisprice"));
		System.out.println(request.getParameter("cartdisprice"));
		model.addAttribute("cartdis", request.getParameter("cartdis"));
		model.addAttribute("cartstock", request.getParameter("cartstock"));
	}
	
	@PostMapping("/enrollPassport")
	public String enrollPassport(HttpServletRequest request) throws ParseException {
		System.out.println("enroll");
		System.out.println(request.getParameter("mName"));
		System.out.println(request.getParameter("mPsptno"));
		PassportVO passport=new PassportVO();
		
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
        
        service.insertPassport(passport);
        
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
		/* Date date=new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
	
    	//원하는 데이터 포맷 지정
		String strNowDate = simpleDateFormat.format(date); 
		
		String oid="OR"+strNowDate;
		*/
		
	}
}
