package com.hyundai.dutyfree.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.security.Principal;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.imageio.ImageIO;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

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
import com.hyundai.dutyfree.vo.CartVO;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.ProductVO;


/**
 *PayController
 * 
 * @author 박진수
 * @since 01.20
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.20    박진수                        최초 생성
 * 2023.01.20    박진수                        지불 구현
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
    public String confirmPayment(
            @RequestParam String paymentKey, @RequestParam String orderId, @RequestParam Long amount,
            Model model,HttpServletRequest requests,Principal prin) throws Exception {
    	
    	
    	System.out.println(paymentKey);
    	
        HttpHeaders headers = new HttpHeaders();
       
        headers.set("Authorization", "Basic " + Base64.getEncoder().encodeToString((SECRET_KEY + ":").getBytes()));
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, String> payloadMap = new HashMap<String, String>();
        
        payloadMap.put("orderId", orderId);
        payloadMap.put("amount", String.valueOf(amount));

        HttpEntity<String> request = new HttpEntity<>(objectMapper.writeValueAsString(payloadMap), headers);

        ResponseEntity<JsonNode> responseEntity = restTemplate.postForEntity(
                "https://api.tosspayments.com/v1/payments/" + paymentKey, request, JsonNode.class);

        if (responseEntity.getStatusCode() == HttpStatus.OK) {
        	List<OrderItemVO> orderitemlist=orderservice.getOrderitemlist(orderId);
        	for (OrderItemVO order : orderitemlist) {
    			CartVO cart = new CartVO();
    			cart.setPcode(order.getPcode());
    			cart.setMid(prin.getName());

    			// 주문한 상품목록이 장바구니에 저장된 경우 장바구니에 있는 상품을 삭제 if
    			if (cartservice.Cartitemconsist(cart) == 1) {
    				cartservice.deleteCart(cart);
    			}

    		}
        	
            JsonNode successNode = responseEntity.getBody();
            model.addAttribute("oid", successNode.get("orderId").asText());
            String secret = successNode.get("secret").asText(); // 가상계좌의 경우 입금 callback 검증을 위해서 secret을 저장하기를 권장함
         // 주문 QR코드 전송
         			String root = requests.getSession().getServletContext().getRealPath("resources"); // 서블릿 경로의 resources 폴더 찾기
         			String savePath = root + "\\qrCodes\\"; // 파일 경로
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
         			BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE, 200, 200); // 200,200은 width, height

         			MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor, backgroundColor);
         			BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix, matrixToImageConfig);

         			String fileName = orderId;

         			// 파일 경로, 파일 이름 , 파일 확장자에 맡는 파일 생성
         			File temp = new File(savePath + fileName + ".png");

         			// ImageIO를 사용하여 파일쓰기
         			ImageIO.write(bufferedImage, "png", temp);
         			/* 이메일 보내기 */
         			MemberVO member = memberservice.read(prin.getName()); 
         			String setFrom = "hdite1284@naver.com";
         			String toMail = member.getMemail();
         			String title = "주문 QR 이메일 입니다.";
         			String content = "주문해주셔서 감사합니다." + "<br><br>" + "QR코드는  첨부파일 확인" + "<br>";

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

    @RequestMapping("/virtual-account/callback")
    @ResponseStatus(HttpStatus.OK)
    public void handleVirtualAccountCallback(@RequestBody CallbackPayload payload) {
        if (payload.getStatus().equals("DONE")) {
            // handle deposit result
        }
    }

    private static class CallbackPayload {
        public CallbackPayload() {}

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
