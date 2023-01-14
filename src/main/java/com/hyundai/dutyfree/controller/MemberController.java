package com.hyundai.dutyfree.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.vo.MemberVO;

import lombok.AllArgsConstructor;
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
 *        </pre>
 */

@AllArgsConstructor
@Controller
@RequestMapping(value = "/join")
@Log4j
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberservice;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 약관 동의 페이지 진입
	@RequestMapping(value = "termsAgree", method = RequestMethod.GET)
	public void joinfirGET() {
		logger.info("회원가입 1 페이지 진입");
	}

	@RequestMapping(value = "/termsAgree", method = RequestMethod.POST)
	public String joinfirPOST() throws Exception {
		return "redirect:/authentication";
	}

	// 이메일 인증 페이지 이동
	@RequestMapping(value = "authentication", method = RequestMethod.GET)
	public void joinsecGET() {
		logger.info("회원가입 2 페이지 진입");
	}

	@RequestMapping(value = "/authentication", method = RequestMethod.POST)
	public String joinsecPOST() throws Exception {
		return "redirect:/join/mbshInformation";
	}

	// 회원 정보 입력 페이지 이동
	@RequestMapping(value = "mbshInformation", method = RequestMethod.GET)
	public void joinGET(@RequestParam("email_fir") String email_fir, @RequestParam("email_sec") String email_sec,
			Model model) {
		String email = email_fir + email_sec;
		model.addAttribute("email", email);
		logger.info("회원가입 3 페이지 진입");
	}

	// 회원가입
	@RequestMapping(value = "/mbshInformation", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {
		logger.info("회원가입 진입");

		System.out.println("제발 출력좀" + member.toString());

		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호
		rawPw = member.getMpassword();// 비밀번호 데이터 얻음
		System.out.println(rawPw);
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		member.setMpassword(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장
		// 회원가입 쿼리 실행
		memberservice.memberJoin(member);

		logger.info("회원가입성공");
		return "redirect:/join/done";

	}

	// 회원가입 최종 페이지 이동
	@RequestMapping(value = "done", method = RequestMethod.GET)
	public void joinfianlGET() {

		logger.info("회원가입 최종 페이지 진입");

	}

	@RequestMapping(value = "/done", method = RequestMethod.POST)
	public String joinfinalPOST() throws Exception {
		return "redirect:/";
	}

	// 회원정보 수정 페이지 이동
	@RequestMapping(value = "updateMember", method = RequestMethod.GET)
	public void updateMemberGET() {

		logger.info("멤버업데이트 페이지 진입");

	}

	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(@RequestParam("email") String email) throws Exception {

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증번호 : " + email);

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호 " + checkNum);

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

	// 회원정보 수정
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMemberPOST(HttpServletRequest request, MemberVO member) throws Exception {

		MemberVO mvo = (MemberVO) request.getSession().getAttribute("member");

		logger.info("updateMember.........." + mvo);

		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		member.setMid(mvo.getMid());
		rawPw = member.getMpassword();// 비밀번호 데이터 얻음
		System.out.println(rawPw);
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		mvo.setMpassword(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장
		mvo.setMname(member.getMname());
		mvo.setMemail(member.getMemail());
		mvo.setMphone(member.getMphone());

		/* 회원가입 쿼리 실행 */
		memberservice.updateMember(mvo);

		return "redirect:/member/mypage";
	}

	/* 회원 정보 삭제 */
	@PostMapping("/deleteMember")
	public String deleteMemberPOST(String mid, HttpServletRequest request) throws Exception {
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("member");

		logger.info("deleteMemberPOST..........");

		/* 회원탈퇴 쿼리 실행 */
		memberservice.deleteMember(mvo.getMid());

		return "redirect:/";

	}

	// 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET() {

		logger.info("로그인 페이지 진입");

	}

	// 아이디 찾기 이동
	@RequestMapping(value = "findID", method = RequestMethod.GET)
	public void findIDGET() {

		logger.info("아이디 찾기 페이지 진입");

	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String mid) throws Exception {
		// logger.info("memberIdChk() 진입");

		int result = memberservice.idCheck(mid);

		logger.info("결과값 = " + result);

		if (result != 0) {

			return "fail"; // 중복 아이디가 존재

		} else {

			return "success"; // 중복 아이디 x

		}
	}

	/* 로그인 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";

		MemberVO mvo = memberservice.memberLogin(member); // 제출한아이디와 일치하는 아이디 있는지

		if (mvo != null) { // 일치하는 아이디 존재시

			rawPw = member.getMpassword(); // 사용자가 제출한 비밀번호
			System.out.println(rawPw);
			encodePw = mvo.getMpassword(); // 데이터베이스에 저장한 인코딩된 비밀번호
			System.out.println(encodePw);
			if (true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단
				mvo.setMpassword(""); // 인코딩된 비밀번호 정보 지움
				session.setAttribute("member", mvo); // session에 사용자의 정보 저장
				return "redirect:/"; // 메인페이지 이동

			} else {

				rttr.addFlashAttribute("result", 0);
				System.out.println("비번틀림");
				return "redirect:/join/login"; // 로그인 페이지로 이동

			}

		} else { // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)

			rttr.addFlashAttribute("result", 0);
			System.out.println("아이디 없음");
			return "redirect:/join/login"; // 로그인 페이지로 이동

		}

	}

	/* 아이디 찾기 */
	@RequestMapping(value = "findID.do", method = RequestMethod.POST)
	public String findIDPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		String name = "";
		String email = "";
		String mname = "";
		String memail = "";

		MemberVO mvo = memberservice.findID(member); // 제출한 이름과 일치하는 아이디 있는지

		if (mvo != null) { // 일치하는 아이디 존재시

			mname = member.getMname(); // 사용자가 제출한 이름
			System.out.println(mname);
			name = mvo.getMname(); // 데이터베이스에 저장된 이름
			System.out.println(name);

			memail = member.getMemail(); // 사용자가 제출한 이메일
			System.out.println(memail);
			email = mvo.getMemail(); // 데이터베이스에 저장한 이메일
			System.out.println(email);

			if (name.equals(mname) && email.equals(memail)) { // 일치여부 판단

				session.setAttribute("member", mvo); // session에 사용자의 정보 저장
				rttr.addFlashAttribute("result", 1);
				return "redirect:/member/findID"; // 메인페이지 이동

			} else {

				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/findID"; // 로그인 페이지로 이동

			}

		} else { // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)

			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/findID"; // 로그인 페이지로 이동

		}
	}

	/* 메인페이지 로그아웃 */
	/* 비동기방식 로그아웃 메서드 */
	@RequestMapping(value = "logout.do", method = RequestMethod.POST)
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) throws Exception {

		logger.info("비동기 로그아웃 메서드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void myPage(HttpServletRequest request, Model model) throws Exception {
		log.info("마이페이지 접속");

		MemberVO mvo = (MemberVO) request.getSession().getAttribute("member");
		model.addAttribute("mid", memberservice.myPage(mvo.getMid()));
		model.addAttribute("mname", memberservice.myPage(mvo.getMname()));
		model.addAttribute("mgrade", memberservice.myPage(mvo.getMid()));

	}
}
