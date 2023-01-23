package com.hyundai.dutyfree.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyundai.dutyfree.auth.SNSLogin;
import com.hyundai.dutyfree.auth.SnsValue;
import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.service.OrderService;
import com.hyundai.dutyfree.service.ProductService;
import com.hyundai.dutyfree.vo.CartVO;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderItemListVO;
import com.hyundai.dutyfree.vo.OrderItemVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.ProductVO;

import lombok.extern.log4j.Log4j;

/**
 * MemberController
 *
 * @author 김찬중
 * @since 01.09
 *
 *        <pre>
 * 수정일                 수정자                          수정내용
 * ----------  ---------------      ---------------------------
 * 2023.01.09	  김찬중			       최초생성
 * 2023.01.17    김가희                            시큐리티적용
 * 2023.01.19    김가희                            소셜로그인(네이버)추가
 * 2023.01.20    김가희                            소셜로그인(카카오)추가
 *        </pre>
 */

@Controller
@RequestMapping(value = "/member")
@Log4j
public class MemberController {

	@Autowired
	private MemberService memberservice;

	@Autowired
	private OrderService orderservice;
	
	@Autowired
	private ProductService productservice;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	@Autowired
	private SnsValue naverSns;

	@Autowired
	private SnsValue kakaoSns;

	// 약관 동의 페이지 진입 (회원가입1)
	@RequestMapping(value = "termsAgree", method = RequestMethod.GET)
	public void joinfirGET() {
		log.info("회원가입 1 페이지 진입");
	}

	// 이메일 인증 페이지 이동 (회원가입2)
	@RequestMapping(value = "authentication", method = RequestMethod.GET)
	public void joinsecGET() {
		log.info("회원가입 2 페이지 진입");
	}

	// 이메일 중복 검사
	@RequestMapping(value = "/mailChk")
	@ResponseBody
	public String mailChk(String mail) throws Exception {
		log.info("mailChk() 진입");

		int result = memberservice.mailCheck(mail);

		log.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 중복 메일이 존재

		} else {
			return "success"; // 중복 메일 x

		}
	}

	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(@RequestParam("email") String email) throws Exception {

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + email);

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "hdite1284@naver.com";
		String toMail = email;
		System.out.println("email" + email);
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);

		return num;
	}

	// 회원 정보 입력 페이지 이동 (회원가입3)
	@RequestMapping(value = "mbshInformation", method = RequestMethod.GET)
	public void joinGET(@RequestParam("email_fir") String email_fir, @RequestParam("email_sec") String email_sec,
			Model model) {
		String email = email_fir + email_sec;
		model.addAttribute("email", email);
		log.info("회원가입 3 페이지 진입");
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String mid) throws Exception {
		log.info("memberIdChk() 진입");

		int result = memberservice.idCheck(mid);

		log.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}

	// 회원가입 로직
	@RequestMapping(value = "/mbshInformation", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {
		log.info("회원가입 진입");

		System.out.println("회원가입 memberVO: " + member.toString());

		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호
		rawPw = member.getMpassword();// 비밀번호 데이터 얻음
		System.out.println(rawPw);
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		member.setMpassword(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장
		// 회원가입 쿼리 실행
		memberservice.memberJoin(member);

		log.info("회원가입성공");
		return "/member/done";
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET(HttpServletRequest request, @RequestParam(value = "error", required = false) String error,
			Model model) {
		// 소셜로그인(네이버)
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getAuthLogin());
		// 소셜로그인(카카오)
		SNSLogin snsLogin2 = new SNSLogin(kakaoSns);
		model.addAttribute("kakao_url", snsLogin2.getAuthLogin());

		// 인터셉터로 인해 로그인페이지로 강제이동된 경우 이전페이지 저장
		String uri = request.getHeader("Referer");
		log.info("Referer: " + uri);
		if (uri != null && !uri.contains("/member/login")) {
			System.out.println("로그인 이전페이지~" + uri);
			request.getSession().setAttribute("prevPage", uri);
		}
		// 로그인 실패시 error코드 전달
		model.addAttribute("error", error);
		log.info("로그인 페이지 진입 error= " + error);
	}

	// 마이페이지
	@RequestMapping(value = "/Mypage", method = RequestMethod.GET)
	public void myPage(HttpServletRequest request, Model model,String align, Principal prin) throws Exception {
		// 시큐리티에서 mid받아오기
		String mid = prin.getName();
		log.info("마이페이지 접속 mid: " + mid);
		MemberVO mvo = memberservice.read(mid);
		model.addAttribute("member", mvo);
		if(align==null) {
			align="odate";
		}else {
			align=request.getParameter("align");
		}
		
		List<OrderListVO> orderlists=orderservice.getorderlistBymid(prin.getName(),align);
	
		if(orderlists!=null) {
			
			
			
			for(OrderListVO orderlist: orderlists) {
				float orderprice = 0;
				float cartdisprice = 0;
				float orderdis = 0;
				int cartstock = 0;
				List<OrderItemVO> orderitemlist=orderservice.getOrderitemlist(orderlist.getOid());
				for(OrderItemVO orderitem:orderitemlist) {
					ProductVO product=productservice.productdetail(orderitem.getPcode());
					orderitem.setProduct(product);
					orderlist.setOrderitemlist(orderitemlist);
					orderprice += (product.getPprice() * orderitem.getOamount());
					cartdisprice += (orderprice * (1 - ((float) product.getPdiscount() / 100))) * orderitem.getOamount();
					orderdis += product.getPprice() * ((float) product.getPdiscount() / 100) * orderitem.getOamount();
				}
			  
				orderlist.setOrdertotalprice(orderprice);
				orderlist.setOrdertotaldisprice(orderdis);
			}
				model.addAttribute("orderlistsize", orderlists.size());
			}
		  model.addAttribute("align", align);
		  model.addAttribute("orderlists", orderlists);
		  model.addAttribute("mid", memberservice.myPage(mvo.getMid()));
		  model.addAttribute("mname", memberservice.myPage(mvo.getMname()));
		  model.addAttribute("mgrade", memberservice.myPage(mvo.getMid()));
		  model.addAttribute("mhpoint",
		  memberservice.myPage(String.valueOf(mvo.getMhpoint())));
		 
}

	/*
	 * @GetMapping("/logout") public String logout(HttpServletRequest request,
	 * HttpServletResponse response, HttpSession session) throws IOException {
	 * System.out.println("로그아웃 컨트롤러 들어옴"); String tocken = (String)
	 * session.getAttribute("kakaoToken"); System.out.println("액세스토큰: " + tocken);
	 * 
	 * if (tocken != null) { System.out.println("카카오로그인이지"); logout(tocken); }
	 * session.invalidate();
	 * 
	 * SecurityContext securityContext = SecurityContextHolder.getContext(); new
	 * SecurityContextLogoutHandler().logout(request, response,
	 * securityContext.getAuthentication());
	 * 
	 * return "redirect:/"; }
	 * 
	 * public void logout(String access_Token) { String reqURL =
	 * "https://kapi.kakao.com/v1/user/logout"; try { URL url = new URL(reqURL);
	 * HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	 * conn.setRequestMethod("POST"); conn.setRequestProperty("Authorization",
	 * "Bearer " + access_Token);
	 * 
	 * int responseCode = conn.getResponseCode();
	 * System.out.println("responseCode : " + responseCode);
	 * 
	 * BufferedReader br = new BufferedReader(new
	 * InputStreamReader(conn.getInputStream()));
	 * 
	 * String result = ""; String line = "";
	 * 
	 * while ((line = br.readLine()) != null) { result += line; }
	 * System.out.println(result); } catch (IOException e) { e.printStackTrace(); }
	 * }
	 */
	

	// -----------------------아직 안쓰는 로직들 (회원수정,삭제)------------------------

	/*
	 * // 회원정보 수정 페이지 이동
	 * 
	 * @RequestMapping(value = "updateMember", method = RequestMethod.GET) public
	 * void updateMemberGET() {
	 * 
	 * logger.info("멤버업데이트 페이지 진입");
	 * 
	 * }
	 * 
	 * // 회원정보 수정
	 * 
	 * @RequestMapping(value = "/updateMember", method = RequestMethod.POST) public
	 * String updateMemberPOST(HttpServletRequest request, MemberVO member) throws
	 * Exception {
	 * 
	 * MemberVO mvo = (MemberVO) request.getSession().getAttribute("member");
	 * 
	 * logger.info("updateMember.........." + mvo);
	 * 
	 * String rawPw = ""; // 인코딩 전 비밀번호 String encodePw = ""; // 인코딩 후 비밀번호
	 * 
	 * member.setMid(mvo.getMid()); rawPw = member.getMpassword();// 비밀번호 데이터 얻음
	 * System.out.println(rawPw); encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
	 * mvo.setMpassword(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장
	 * mvo.setMname(member.getMname()); mvo.setMemail(member.getMemail());
	 * mvo.setMphone(member.getMphone());
	 * 
	 * 회원가입 쿼리 실행 memberservice.updateMember(mvo);
	 * 
	 * return "redirect:/member/Mypage"; }
	 * 
	 * 회원 정보 삭제
	 * 
	 * @PostMapping("/deleteMember") public String deleteMemberPOST(String mid,
	 * HttpServletRequest request) throws Exception { MemberVO mvo = (MemberVO)
	 * request.getSession().getAttribute("member");
	 * 
	 * logger.info("deleteMemberPOST..........");
	 * 
	 * 회원탈퇴 쿼리 실행 memberservice.deleteMember(mvo.getMid());
	 * 
	 * return "redirect:/";
	 * 
	 * }
	 * 
	 * // 아이디 찾기 이동
	 * 
	 * @RequestMapping(value = "findID", method = RequestMethod.GET) public void
	 * findIDGET() {
	 * 
	 * logger.info("아이디 찾기 페이지 진입");
	 * 
	 * }
	 * 
	 * 아이디 찾기
	 * 
	 * @RequestMapping(value = "findID.do", method = RequestMethod.POST) public
	 * String findIDPOST(HttpServletRequest request, MemberVO member,
	 * RedirectAttributes rttr) throws Exception {
	 * 
	 * HttpSession session = request.getSession(); String name = ""; String email =
	 * ""; String mname = ""; String memail = "";
	 * 
	 * MemberVO mvo = memberservice.findID(member); // 제출한 이름과 일치하는 아이디 있는지
	 * 
	 * if (mvo != null) { // 일치하는 아이디 존재시
	 * 
	 * mname = member.getMname(); // 사용자가 제출한 이름 System.out.println(mname); name =
	 * mvo.getMname(); // 데이터베이스에 저장된 이름 System.out.println(name);
	 * 
	 * memail = member.getMemail(); // 사용자가 제출한 이메일 System.out.println(memail);
	 * email = mvo.getMemail(); // 데이터베이스에 저장한 이메일 System.out.println(email);
	 * 
	 * if (name.equals(mname) && email.equals(memail)) { // 일치여부 판단
	 * 
	 * session.setAttribute("member", mvo); // session에 사용자의 정보 저장
	 * rttr.addFlashAttribute("result", 1); return "redirect:/member/findID"; //
	 * 메인페이지 이동
	 * 
	 * } else {
	 * 
	 * rttr.addFlashAttribute("result", 0); return "redirect:/member/findID"; // 로그인
	 * 페이지로 이동
	 * 
	 * }
	 * 
	 * } else { // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
	 * 
	 * rttr.addFlashAttribute("result", 0); return "redirect:/member/findID"; // 로그인
	 * 페이지로 이동
	 * 
	 * } }
	 */
}
