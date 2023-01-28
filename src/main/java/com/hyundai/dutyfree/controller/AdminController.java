package com.hyundai.dutyfree.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hyundai.dutyfree.admin.vo.AdminMessage;
import com.hyundai.dutyfree.service.AdminService;
import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.vo.MemberVO;
/**
 * AdminController
 * 
 * @author 김가희
 * @since 01.26
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.26    김가희                        최초 생성
 *        
 */
@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	@Autowired
	private MemberService memberService;

	//메인으로 이동(임시)
	@RequestMapping("/admin/imsi")
	public void goMain() {
		
	}
	
	//1대1 실시간 상담
	
	// 1:1 채팅방 목록 보기
	@RequestMapping("/admin/adminChatRoom")
	public void adminChat(Model model, Principal prin) throws Exception {

		String adminUsid = prin.getName();

		List<String> totalUsidList = new ArrayList<>();
		List<String> firstUsidList = new ArrayList<>();
		List<String> secondUsidList = new ArrayList<>();

		// 관리자에게 메세지 보낸사람
		firstUsidList = service.firstUsidList();
		// 관리자에게 메세지 받은사람
		secondUsidList = service.secondUsidList();

		// 관리자에게 메세지 보내거나 받은사람 중복없이 totalUsidList에 넣기
		for (int i = 0; i < firstUsidList.size(); i++) {
			totalUsidList.add(firstUsidList.get(i));
		}

		for (int i = 0; i < secondUsidList.size(); i++) {
			if (!totalUsidList.contains(secondUsidList.get(i))) {
				totalUsidList.add(secondUsidList.get(i));
			}
		}

		System.out.println(totalUsidList);

		// 각 채팅방의 사용자아이디,프로필사진,닉네임,최근메세지,그시간을 담은am객체들의 리스트
		List<AdminMessage> memberInfoList = new ArrayList<AdminMessage>();

		// 모든 채팅방을 돌면서 각각 사용자정보와 최근메세지를 담는다
		for (int i = 0; i < totalUsidList.size(); i++) {

			AdminMessage am = new AdminMessage();
			MemberVO member = new MemberVO();
			HashMap<String, String> usidMap = new HashMap<>();

			String memberUsid = totalUsidList.get(i);
			am.setMid(memberUsid);
			member.setMid(memberUsid);

			// 사용자의 닉네임이랑 프로필 받아오기
			member = memberService.read(memberUsid);

			// am.setProfilePic(member.getProfilePic());
			am.setMname(member.getMname());

			// 사용자아이디랑 관리자 아이디를 usidMap에 담아서
			usidMap.put("adminUsid", adminUsid);
			usidMap.put("memberUsid", memberUsid);

			// usidMap사용해서 가장 최근에 보낸 메세지를 받아온다.
			AdminMessage am2 = service.loadAdminMessage(usidMap);

			// 가장 최근메세지랑 시간을 담아서
			am.setLatestMsg(am2.getLatestMsg());
			am.setTime(am2.getTime());

			// 리스트에 담는다.
			memberInfoList.add(am);

		}

		// memberInfoList를 모델에 담아서 전송한다.
		model.addAttribute("memberInfoList", memberInfoList);
		System.out.println("멤버인포리스트:" + memberInfoList);
	}

	//관리자 1대1 실시간상담 입장
	@RequestMapping("/admin/adminChat") // 1
	public void adminChat(@RequestParam("memberUsid") String memberUsid,@RequestParam("adminUsid") String adminUsid, Model model) throws Exception {
		// member와 admin의 정보 가져오기
		MemberVO adminInfo = new MemberVO();
		adminInfo = memberService.read(adminUsid);

		MemberVO memberInfo = new MemberVO();
		memberInfo = memberService.read(memberUsid);

		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("adminInfo", adminInfo);
	}

}
