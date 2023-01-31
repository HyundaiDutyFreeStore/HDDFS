package com.hyundai.dutyfree.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.security.Principal;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.imageio.ImageIO;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
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
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.PassportVO;
import com.hyundai.dutyfree.vo.ProductVO;

import oracle.jdbc.diagnostics.DemultiplexingLogHandler;

/**
 * PayController
 * 
 * @author 박진수
 * @since 01.20
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.20    박진수                        최초 생성
 * 2023.01.20    박진수                        지불 구현
 * 2023.01.21    김찬중                        결제 완료 시 qr 코드 전송 구현
 * 2023.01.25    박진수                        결제 취소
 * 
 *        </pre>
 */
@Controller
@RequestMapping("/pay")
public class PayController {
	private final RestTemplate restTemplate = new RestTemplate();

	private final ObjectMapper objectMapper = new ObjectMapper();

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private MemberService memberservice;

	@Autowired
	private OrderService orderservice;

	@Autowired
	private CartService cartservice;
	
	@Autowired
	private ProductService productservice;

	LocalDateTime  now = LocalDateTime .now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	String formatedNow = now.format(formatter);

	@PostConstruct
	private void init() {
		restTemplate.setErrorHandler(new ResponseErrorHandler() {
			@Override
			public boolean hasError(ClientHttpResponse response) {
				return false;
			}

			@Override
			public void handleError(ClientHttpResponse response) {
			}
		});
	}

	private final String SECRET_KEY = "test_sk_aBX7zk2yd8yyqBAeQLQ8x9POLqKQ";

	@RequestMapping("/{id}/success")
	public String confirmPayment(@RequestParam String paymentKey, @RequestParam String orderId,
			@RequestParam Long amount,Model model, HttpServletRequest requests, HttpSession session,Principal prin) throws Exception {
		System.out.println(paymentKey);

		HttpHeaders headers = new HttpHeaders();
		Double KRW_WON = (Double) session.getAttribute("KRW_WON");
		String total_bill_dollar_text=(String)session.getAttribute("total_bill_dollar_text");
		System.out.println(total_bill_dollar_text);
		String total_bill_won_text=(String)session.getAttribute("total_bill_won_text");
		String totalDcUsd=(String)session.getAttribute("totalDcUsd");
		String totalDcKrw=(String)session.getAttribute("totalDcKrw");
		String totalSettUsd=(String)session.getAttribute("totalSettUsd");
		String wontotalSettKrw=(String)session.getAttribute("wontotalSettKrw");
		
		// --header 'Authorization: Basic
		// dGVzdF9za196WExrS0V5cE5BcldtbzUwblgzbG1lYXhZRzVSOg==' \
		headers.set("Authorization", "Basic " + Base64.getEncoder().encodeToString((SECRET_KEY + ":").getBytes()));

		// --header 'Content-Type: application/json' \
		headers.setContentType(MediaType.APPLICATION_JSON);

		Map<String, String> payloadMap = new HashMap<String, String>();
		payloadMap.put("paymentKey", paymentKey);
		payloadMap.put("orderId", orderId);
		payloadMap.put("amount", String.valueOf(amount));

		HttpEntity<String> request = new HttpEntity<>(objectMapper.writeValueAsString(payloadMap), headers);

		// --data
		// '{"paymentKey":"7VNlVA_WPvooPLexBAmSx","amount":15000,"orderId":"nlsN6te-juOMMQgUU5iAM"}'
		ResponseEntity<JsonNode> responseEntity = restTemplate
				.postForEntity("https://api.tosspayments.com/v1/payments/confirm", request, JsonNode.class);
		// + paymentKey
		OrderListVO olv=orderservice.getorderlist(orderId);
		List<OrderItemVO> orderitemlist = orderservice.getOrderitemlist(orderId);
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			for (OrderItemVO order : orderitemlist) {
				CartVO cart = new CartVO();
				cart.setPcode(order.getPcode());
				cart.setMid(prin.getName());

				// 주문한 상품목록이 장바구니에 저장된 경우 장바구니에 있는 상품을 삭제 if
				if (cartservice.Cartitemconsist(cart) == 1) {
					cartservice.deleteCart(cart);
				}

			}
			orderservice.UpdateorderPaymentKey(paymentKey, orderId);

			JsonNode successNode = responseEntity.getBody();
			model.addAttribute("oid", successNode.get("orderId").asText());
			String secret = successNode.get("secret").asText(); // 가상계좌의 경우 입금 callback 검증을 위해서 secret을 저장하기를 권장함
			// 주문 QR코드 전송
			String path = "C:/resources";
			String savePath = path + "/qrImage/"; // 파일 경로
			System.out.println(savePath);
			// 파일 경로가 없으면 생성하기
			File file = new File(savePath);
			if (!file.exists()) {
				file.mkdirs();
			}

			// 링크로 할 URL주소
			String url = orderId;

			// 링크 생성값
			String codeurl = new String(url.getBytes("UTF-8"), "ISO-8859-1");

			// QRCode 색상값
			int qrcodeColor = 0xFF2e4e96;
			// QRCode 배경색상값
			int backgroundColor = 0xFFFFFFFF;

			// QRCode 생성
			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE, 200, 200); // 200,200은 width,
																									// height

			MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor, backgroundColor);
			BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix, matrixToImageConfig);

			String fileName = orderId;

			// 파일 경로, 파일 이름 , 파일 확장자에 맡는 파일 생성
			File temp = new File(savePath + fileName + ".png");

			// ImageIO를 사용하여 파일쓰기
			ImageIO.write(bufferedImage, "png", temp);
			/* 이메일 보내기 */
			MemberVO member = memberservice.read(prin.getName());
			PassportVO memberpassport=orderservice.PassportConsist(prin.getName());
			if(olv.getOdept().equals("ICNT1")) {
				olv.setOdept("인천공항 T1");
			}else if(olv.getOdept().equals("ICNT2")) {
				olv.setOdept("인천공항 T2");
			}else {
				olv.setOdept("김포공항");
			}
			
			for(OrderItemVO oiv:orderitemlist) {
				ProductVO product=productservice.productdetail(oiv.getPcode());
				oiv.setProduct(product);
			}
			DecimalFormat formatter=new DecimalFormat("###,###");
			DecimalFormat formatters=new DecimalFormat("###,###.##");
			String orderlist="";
			for(OrderItemVO oiv: orderitemlist) {
				System.out.println(oiv.getProduct().getPprice()*(oiv.getProduct().getPdiscount()*0.01));
			}
			for(OrderItemVO oiv: orderitemlist) { 
				orderlist+=("<div style=\"border-top:1px solid #e6e6e6;overflow:hidden;padding:30px 0\">\n" 
				+ "                    <div style=\"float:left;width:160px;margin-right:24px\"><img src="+oiv.getProduct().getImg1() +"alt=\"0.2 테라피 에어 마스크 달팽이\" title=\"0.2 테라피 에어 마스크 달팽이\" style=\"border:none;vertical-align:top;width:160px;height:160px\" loading=\"lazy\"></div>\n"
				+ "                    <div style=\"overflow:hidden;padding-right:30px\">\n"
				+ "                        <p style=\"padding:0;margin:0;font-size:14px;color:#333;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em;font-weight:bold\">"+oiv.getProduct().getPbrand()+"</p>\n"
				+ "                        <p style=\"padding:0;margin:7px 0 0 0;font-size:14px;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em;font-weight:bold\">"+oiv.getProduct().getPname()+"</p>\n"
				+ "                        <div style=\"margin-top:10px\">\n"
				+ "                            <dl style=\"overflow:hidden;padding:0;margin:0\"><dt style=\"float:left;width:170px;font-size:14px;line-height:30px;color:#333;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">판매금액</dt><dd style=\"overflow:hidden;line-height:30px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\"><span style=\"text-decoration:line-through;color:#666;font-size:16px;\">"+"$"+String.valueOf(formatters.format(oiv.getProduct().getPprice()))+"</span><strong style=\"color:#c51315;font-size:18px;margin-left:5px\">"+"$"+String.valueOf(formatters.format(oiv.getProduct().getPprice()*(1-oiv.getProduct().getPdiscount()*0.01)))+"</strong><span style=\"color:#999;font-size:13px;margin-left:5px\"> ("+String.valueOf(formatters.format(oiv.getProduct().getPprice()*(1-oiv.getProduct().getPdiscount()*0.01)*KRW_WON))+"원)</span></dd></dl>\n"
				+ "                            <dl style=\"overflow:hidden;padding:0;margin:0\"><dt style=\"float:left;width:170px;font-size:14px;line-height:30px;color:#333;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">수량</dt><dd style=\"overflow:hidden;line-height:30px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em;font-size:13px;color:#333\">"+oiv.getOamount()+"</dd></dl>\n"
				+ "                            <dl style=\"overflow:hidden;padding:0;margin:0\"><dt style=\"float:left;width:170px;font-size:14px;line-height:30px;color:#333;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">구매금액</dt><dd style=\"overflow:hidden;line-height:30px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\"><strong style=\"color:#c51315;font-size:18px;\">"+"$"+String.valueOf(formatters.format(oiv.getOamount()*oiv.getProduct().getPprice()*(1-oiv.getProduct().getPdiscount()*0.01)))+"</strong><span style=\"color:#999;font-size:13px;margin-left:5px\"> ("+String.valueOf(formatters.format(oiv.getOamount()*oiv.getProduct().getPprice()*(1-oiv.getProduct().getPdiscount()*0.01)*KRW_WON))+"원)</span></dd></dl>\n"
				+ "                        </div>\n" + "                    </div>\n" + "                </div>\n");
								}
			String setFrom = "hdite1284@naver.com";
			String toMail = member.getMemail();
			String title = "주문 QR 이메일 입니다.";
			String content = "<div class=\"mail_view_body\">\n" + "<div class=\"mail_view_contents\">\n"
					+ "<div class=\"mail_view_contents_inner\" data-translate-body-10260=\"\">\n" + "<div>\n"
					+ "    <div style=\"width:700px;margin:0 auto\">\n"
					+ "        <div><img src=\"https://cdn.hddfs.com/files/images/email/mail_top.jpg\" alt=\"현대백화점면세점\" style=\"border:none;vertical-align:top\" loading=\"lazy\"></div>\n"
					+ "        <div style=\"width:698px;border-left:1px solid #e6e6e6;border-right:1px solid #e6e6e6;padding:60px 0\">\n"
					+ "            <p style=\"padding:0;margin:0;color:#333;text-align:center;font-size:40px;line-height:100%;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.1em\">주문완료 안내</p>\n"
					+ "            <p style=\"padding:0;margin:27px 0 0 0;color:#333;text-align:center;font-size:18px;line-height:28px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">고객님의 주문이 정상적으로 완료되었습니다.</p>\n"
					+ "            <p style=\"padding:0;margin:25px 0 0 0;color:#666;text-align:center;font-size:14px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\"><span style=\"color:#333;font-size:18px\">"
					+ member.getMname()
					+ "</span> 고객님 안녕하세요.<br>현대백화점인터넷면세점을 이용해주셔서 감사합니다.<br>고객님께서 <span style=\"color:#333\">"
					+ formatedNow + "</span>에 주문하신 내역과 유의사항을 다시 한번 확인해주세요.</p>\n"
					+ "            <div style=\"padding:0 30px\">\n"
					+ "                <p style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">주문 정보</p>\n"
					+ "                <table style=\"width:638px;table-layout:fixed;border-spacing:0;border-top:1px solid #e5e5e5\">\n"
					+ "                    <colgroup><col style=\"width:120px\"><col style=\"width:auto\"><col style=\"width:120px\"><col style=\"width:auto\"></colgroup>\n"
					+ "                    <tbody><tr><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">주문번호</th><td style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">"
					+ orderId
					+ "</td><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">주문일시</th><td style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">"
					+ formatedNow
					+ "</td></tr><tr><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">성명</th><td style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">"
					+ member.getMname()
					+ "</td><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">국적</th><td style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">"+memberpassport.getNationality()+"</td></tr><tr><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">여권번호</th><td style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">"+memberpassport.getPassportno()+"</td><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">생년월일</th><td style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">"+memberpassport.getPbirth()+"</td></tr><tr><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">출국일시</th><td style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">"+olv.getOdeptdate()+"</td><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">출국장소</th><td style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">"+olv.getOdept()+"</td></tr><tr><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">편명</th><td style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">"+olv.getOplnum()+"</td><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\"></th><td style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\"></td></tr></tbody>\n"
					+ "                </table>\n"
					+ "                <p style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">결제 정보</p>\n"
					+ "                <table style=\"width:638px;table-layout:fixed;border-spacing:0;border-top:1px solid #e5e5e5\">\n"
					+ "                    <colgroup><col style=\"width:120px\"><col style=\"width:auto\"></colgroup>\n"
					+ "                    <tbody><tr><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">상품금액</th><td style=\"padding:14px 20px;font-size:13px;text-align:right;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\"><strong style=\"margin-right:5px;color:#333;font-size:22px\">"+total_bill_dollar_text+"</strong>("+total_bill_won_text+")</td></tr><tr><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">할인금액</th><td style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                <p style=\"padding:0 0 10px 0;margin:0;font-size:13px;text-align:right;font-weight:normal;color:#999;line-height:18px;font-family:'Noto Sans KR', '맑은 고딕', 'Dotum'\"><strong style=\"margin-right:5px;color:#c51315;font-size:22px\">"+totalDcUsd+"</strong>("+totalDcKrw+")</p>                                \n"
					+ "                                <dl style=\"overflow:hidden;padding:0;margin:4px 0 0 0\"></dl>\n"
					+ "                                </td></tr><tr><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">적립금액</th><td style=\"padding:14px 20px;font-size:13px;text-align:right;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ ""+                                formatter.format(olv.getOhpoint())+"원</td></tr><tr><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">결제상태</th><td style=\"padding:14px 20px;font-size:13px;text-align:right;font-weight:normal;color:#333;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">결제완료</td></tr><tr><th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">최종결제금액</th><td style=\"padding:18px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                <p style=\"padding:0;margin:0;font-size:13px;text-align:right;font-weight:normal;color:#999;line-height:18px;font-family:'Noto Sans KR', '맑은 고딕', 'Dotum'\"><strong style=\"margin-right:5px;color:#c51315;font-size:30px\">"+totalSettUsd+"</strong>("+wontotalSettKrw+")</p>\n"
					+ "                            </td></tr></tbody>\n" + "                </table>\n"
					+ "                <p style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">상품 정보</p>\n"
					+ orderlist
					+ "                <div style=\"margin-top:40px;padding:20px;border:1px solid #e5e5e5\">\n"
					+ "                    <p style=\"padding:0;margin:0;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">유의사항</p>\n"
					+ "                    <ul style=\"list-style:none;padding:10px 0 0 0;margin:0\"><li style=\"padding:0;margin:0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 매장 판매분으로 인해, 입금완료 이후라도 입금 시점에 따라 재고부족으로 자동취소 될 수 있습니다.</li><li style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 가상계좌의 입금가능 기한은 주문 당일 23:54분까지이며, 미 입금 시 자동으로 취소됩니다.</li><li style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 입금 후 자동 취소된 주문의 경우 에스크로 절차로 인해 환불기간이 3~5일 정도 더 소요될 수 있습니다.</li><li style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 등록된 환불계좌가 없는 경우, 예치금으로 환불 처리됩니다. (추후 출금 가능)</li><li style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 다음의 경우 출국 시 공항에서 상품 수령이 불가능 하오니 반드시 확인해 주시기 바랍니다.\n"
					+ "                            <p style=\"padding:0 0 0 10px;margin:5px 0 0 0\">- 주문하신 고객님과 출국하시는 고객님의 정보가 불일치 할 경우<br>- 주문서에 기재된 여권번호와 출국 시 여권번호가 불일치 할 경우<br>- 출국정보(출국장소, 출국일시, 편명 등)가 실제와 다른 경우</p>\n"
					+ "                        </li><li style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 출국 정보 변경을 원하실 경우, 출국 3일전에 고객센터로 연락해 주시기 바랍니다(단, 지방공항 이용 시 4일전)</li><li style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 출국 시 인도받지 못한 물건은 고객센터로 연락 주시면 취소 절차를 거쳐 환불 처리 됩니다.</li><li style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 주문에 대해 궁금하신 사항은 FAQ에서 확인이 가능합니다. </li><li style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 추가 궁금한 내용은 고객센터(1811-6688)로 문의바랍니다.</li></ul>\n"
					+ "                </div>\n"
					+ "                <p style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">인도장 안내</p>\n"
					+ "                <div style=\"border:1px solid #e5e5e5;padding:18px;\">\n"
					+ "                    <div style=\"padding:0;margin:0;border:1px solid #e5e5e5;line-height:0\"><img src=\"https://cdn.hddfs.com/files/om/20200831/0742db50_202008311039325500.jpg\" alt=\"인도장 안내\" style=\"border:none;vertical-align:top;width:100%\" loading=\"lazy\"></div>\n"
					+ "                    <div style=\"overflow:hidden;margin:8px 0 0 0;padding:0; width:600px;\">\n"
					+ "                        <dl style=\"float:left;width:40%;padding:0;margin:0\"><dt style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 위치안내</dt><dd style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">인천공항 T1 서편 43번 게이트 맞은편 4층</dd></dl>\n"
					+ "                        <dl style=\"float:left;width:30%;padding:0;margin:0\"><dt style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 문의안내</dt><dd style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">인도장 : 1811-6688</dd></dl>\n"
					+ "                        <dl style=\"float:left;width:30%;padding:0;margin:0\"><dt style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">· 상담시간</dt><dd style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">08:00~22:30</dd></dl>\n"
					+ "                    </div>\n" + "                </div>\n"
					+ "                <div style=\"margin-top:30px;text-align:center\">\n"
					+ "                    <a href=\"http://localhost:8080\" target=\"_blank\" style=\"display:inline-block;padding:18px 20px;min-:160px;font-size:16px;color:#fff;text-align:center;font-family:'나눔고딕', '맑은 고딕', 'dotum', 'applesdgothicneo';letter-spacing:-.05em;text-decoration:none;background-color:#c51315\" rel=\"noreferrer noopener\">현대백화점인터넷면세점</a>\n"
					+ "                </div>\n" + "            </div>\n" + "        </div>\n"
					+ "        <div style=\"padding:30px;border:1px solid #e6e6e6;background-color:#fafafa\">\n"
					+ "            <p style=\"padding:0;margin:0;color:#999;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">본 메일은 발신전용으로 회신되지 않습니다. 궁금하신 사항은 [<a href=\"https://www.hddfs.com/shop/om/consmComm/main.do\" target=\"_blank\" style=\"color:#000\" rel=\"noreferrer noopener\">여기</a>]를 클릭하여 문의해 주시기 바랍니다.<br><span style=\"font-size:11px\">If you have questions, Please contact us by clicking <a href=\"https://www.hddfs.com/shop/om/consmComm/main.do\" target=\"_blank\" style=\"color:#000\" rel=\"noreferrer noopener\">here.</a></span></p>\n"
					+ "            <p style=\"padding:0;margin:12px 0 0 0;color:#999;font-size:13px;line-height:24px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">주식회사 현대백화점면세점 대표이사 : 이재실<i style=\"display:inline-block;margin:0 10px;width:1px;height:10px;background-color:#c8c8c8;vertical-align:middle\"></i>서울특별시 강남구 영동대로82길 19</p>\n"
					+ "            <p style=\"padding:0;margin:0;color:#999;font-size:13px;line-height:24px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">사업자등록번호 : 850-88-00325 [<a href=\"http://www.ftc.go.kr/bizCommPop.do?wrkr_no=8508800325&amp;apv_perm_no=\" target=\"_blank\" style=\"color:#666\" rel=\"noreferrer noopener\">사업자정보확인</a>]<i style=\"display:inline-block;margin:0 10px;width:1px;height:10px;background-color:#c8c8c8;vertical-align:middle\"></i>통신판매업신고 : 2018-서울강남-02228</p>\n"
					+ "            <p style=\"padding:0;margin:0;color:#999;font-size:13px;line-height:24px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">개인정보보호책임자 : 채광익<i style=\"display:inline-block;margin:0 10px;width:1px;height:10px;background-color:#c8c8c8;vertical-align:middle\"></i>호스팅사업자 : (주)현대백화점면세점</p>\n"
					+ "            <p style=\"padding:0;margin:0;color:#999;font-size:13px;line-height:24px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">대표번호 : 1811-6688<i style=\"display:inline-block;margin:0 10px;width:1px;height:10px;background-color:#c8c8c8;vertical-align:middle\"></i>대표메일 : hddfs_official@hddfs.com</p>\n"
					+ "            <p style=\"padding:0;margin:12px 0 0 0;color:#999;font-size:11px;line-height:24px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">COPYRIGHT ⓒ HYUNDAI DEPARTMENT STORE DUTY FREE. ALL RIGHTS RESERVED.</p>\n"
					+ "            <div style=\"margin-top:20px;text-align:right\"><a href=\"https://www.hddfs.com/shop/dm/main.do\" target=\"_blank\" rel=\"noreferrer noopener\"><img src=\"https://cdn.hddfs.com/files/images/email/footer_logo.jpg\" alt=\"현대백화점면세점\" style=\"border:none;vertical-align:top\" loading=\"lazy\"></a></div>\n"
					+ "        </div>\n" + "        </div>\n"
					+ " <div style=\"display:none\"><img width=\"0\" height=\"0\" src=\"https://tms.hddfs.com/TMS/tracking?TV9JRD0yMjcyODM4N182OTMxMDE4&amp;U1RZUEU9QVVUTw==&amp;p_id=20230111_7&amp;m_id=22728387_6931018&amp;s_tp=AUTO&amp;TElTVF9UQUJMRT1UTVNfQVVUT19TRU5EX0xJU1RfMDE=&amp;UE9TVF9JRD0yMDIzMDExMV83&amp;U0VSVkVSX0lEPTAx&amp;VEM9MjAyMzAxMTg=&amp;S0lORD1P\" loading=\"lazy\"></div>\n"
					+ "</div></div></div></div>";
			
			session.removeAttribute("total_bill_dollar_text");
			session.removeAttribute("total_bill_won_text");
			session.removeAttribute("totalDcUsd");
			session.removeAttribute("totalDcKrw");
			session.removeAttribute("totalSettUsd");
			session.removeAttribute("wontotalSettKrw");

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				FileSystemResource qr = new FileSystemResource(temp);
				helper.addAttachment(fileName + ".png", qr);
				mailSender.send(message);

			} catch (Exception e) {
				e.printStackTrace();
			}

			return "/order/orderdone";
		} else {
			JsonNode failNode = responseEntity.getBody();
			model.addAttribute("message", failNode.get("message").asText());
			model.addAttribute("code", failNode.get("code").asText());
			return "fail";
		}
	}

	@RequestMapping("/{id}/fail")
	public String failPayment(@RequestParam String message, @RequestParam String code, Model model) {
		model.addAttribute("message", message);
		model.addAttribute("code", code);
		return "fail";
	}

	@RequestMapping("/cancelSuccess")
	@ResponseBody
	public String cancelSuccess(HttpServletRequest requests, Model model) throws JsonProcessingException {

		HttpHeaders headers = new HttpHeaders();

		// --header 'Authorization: Basic
		// dGVzdF9za196WExrS0V5cE5BcldtbzUwblgzbG1lYXhZRzVSOg==' \
		headers.set("Authorization", "Basic " + Base64.getEncoder().encodeToString((SECRET_KEY + ":").getBytes()));

		// --header 'Content-Type: application/json' \
		headers.setContentType(MediaType.APPLICATION_JSON);

		Map<String, String> payloadMap = new HashMap<String, String>();

		payloadMap.put("cancelReason", "취소해!");

		HttpEntity<String> request = new HttpEntity<>(objectMapper.writeValueAsString(payloadMap), headers);

		// --data
		// '{"paymentKey":"7VNlVA_WPvooPLexBAmSx","amount":15000,"orderId":"nlsN6te-juOMMQgUU5iAM"}'

		ResponseEntity<JsonNode> responseEntity = restTemplate.postForEntity(
				"https://api.tosspayments.com/v1/payments/" + requests.getParameter("paymentKey") + "/cancel", request,
				JsonNode.class);

		String result = "";
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			JsonNode successNode = responseEntity.getBody();
			model.addAttribute("oid", successNode.get("orderId").asText());
			result = "yes";
		}
		return result;

	}

	@RequestMapping("/virtual-account/callback")
	@ResponseStatus(HttpStatus.OK)
	public void handleVirtualAccountCallback(@RequestBody CallbackPayload payload) {
		if (payload.getStatus().equals("DONE")) {
			// handle deposit result
		}
	}

	private static class CallbackPayload {
		public CallbackPayload() {
		}

		private String secret;
		private String status;
		private String orderId;

		public String getSecret() {
			return secret;
		}

		public void setSecret(String secret) {
			this.secret = secret;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getOrderId() {
			return orderId;
		}

		public void setOrderId(String orderId) {
			this.orderId = orderId;
		}
	}
}