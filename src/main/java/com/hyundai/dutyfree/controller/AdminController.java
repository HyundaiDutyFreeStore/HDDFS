package com.hyundai.dutyfree.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyundai.dutyfree.admin.vo.AdminChat;
import com.hyundai.dutyfree.admin.vo.AdminMessage;
import com.hyundai.dutyfree.service.AdminService;
import com.hyundai.dutyfree.service.ChartService;
import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.service.OrderService;
import com.hyundai.dutyfree.service.ProductService;
import com.hyundai.dutyfree.vo.ChartCategoryVO;
import com.hyundai.dutyfree.vo.ChartDailyVO;
import com.hyundai.dutyfree.vo.ChartMemberVO;
import com.hyundai.dutyfree.vo.ChartVisiterVO;
import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.OrderListVO;
import com.hyundai.dutyfree.vo.ProductVO;

/**
 * AdminController
 *
 * @author 김가희, 김찬중
 * @since 01.26
 *
 *        <pre>
 * 수정일                 수정자                          	수정내용
 * ----------  ---------------      ---------------------------
 * 2023.01.26 	  김가희 				최초 생성
 * 2023.01.30	  김찬중			    chart.js 생성
 *        </pre>
 */
@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	@Autowired
	private MemberService memberService;

	@Autowired
	private ProductService prodService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private ChartService chartService;

	LocalDateTime now = LocalDateTime.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
	String formatedNow = now.format(formatter);

	// 주문목록 리스트 보기
	@RequestMapping("/admin/orderList")
	public void orderList(Model model) {
		List<OrderListVO> list = orderService.getList();
		model.addAttribute("orderList", list);
	}

	// 상품목록 리스트 보기
	@RequestMapping("/admin/prodList")
	public void prodList(Criteria cri, Model model) {
		List<ProductVO> list = prodService.getList2();
		// log.info("adminController에서 prodlist: "+list);
		model.addAttribute("prodList", list);
	}

	// 1:1 채팅방 목록 보기
	@RequestMapping("/admin/adminChatRoom")
	public void adminChat(Model model, Principal prin) throws Exception {

		String adminUsid = prin.getName();

		List<AdminChat> totalUsidList = new ArrayList<>();

		totalUsidList = service.roomNoList();
		System.out.println(totalUsidList);

		// 각 채팅방의 사용자아이디,프로필사진,닉네임,최근메세지,그시간을 담은am객체들의 리스트
		List<AdminMessage> memberInfoList = new ArrayList<AdminMessage>();

		// 모든 채팅방을 돌면서 각각 사용자정보와 최근메세지를 담는다
		for (int i = 0; i < totalUsidList.size(); i++) {

			AdminMessage am = new AdminMessage();
			MemberVO member = new MemberVO();
			HashMap<String, String> usidMap = new HashMap<>();

			String memberUsid = totalUsidList.get(i).getAdminChatRoomNo();
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

	// 관리자 1대1 실시간상담 입장
	@RequestMapping("/admin/adminChat") // 1
	public void adminChat(@RequestParam("memberUsid") String memberUsid, @RequestParam("adminUsid") String adminUsid,
			Model model) throws Exception {
		// member와 admin의 정보 가져오기
		MemberVO adminInfo = new MemberVO();
		adminInfo = memberService.read(adminUsid);

		MemberVO memberInfo = new MemberVO();
		memberInfo = memberService.read(memberUsid);

		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("adminInfo", adminInfo);
	}

	@RequestMapping("/admin/index")
	public void forChart(Model model) throws Exception {
		List<ChartMemberVO> cntMember = chartService.cntMember();
		List<ChartDailyVO> cntTotal = chartService.dailyTotal();
		List<ChartVisiterVO> cntVisiter = chartService.cntTodayVisiter();
		float cntm = 0;
		float cntw = 0;
		float cnta = 0;
		float total = 0;
		for (int i = 0; i < cntMember.size(); i++) {
			switch (cntMember.get(i).getSex()) {
			case "F":
			case "female":
			case "여성":
				cntw += cntMember.get(i).getMcnt();
				break;
			case "M":
			case "male":
			case "남성":
				cntm += cntMember.get(i).getMcnt();
				break;
			default:
				cnta += cntMember.get(i).getMcnt();
				break;
			}
		}
		total = cntm + cntw + cnta;
		double todaysales = 0;
		double weeklysales = 0;
		for (int i = 0; i < cntTotal.size(); i++) {
			if (cntTotal.get(i).getOdate().equals(formatedNow))
				todaysales = cntTotal.get(i).getTotal();
			weeklysales += cntTotal.get(i).getTotal();
		}
		model.addAttribute("cntm", Math.round(cntm / total * 100));
		model.addAttribute("cntw", Math.round(cntw / total * 100));
		model.addAttribute("cnta", Math.round(cnta / total * 100));
		model.addAttribute("cnttotal", (int) total);
		model.addAttribute("todaysales", Math.round(todaysales));
		model.addAttribute("weeklysales", Math.round(weeklysales));
		model.addAttribute("cntVisiter", cntVisiter.get(0).getVisitcnt());
	}

	@RequestMapping(value = "/admin/index/dailyTotal", method = RequestMethod.GET)
	public @ResponseBody List<ChartDailyVO> dailyTotal(Model model) {
		List<ChartDailyVO> dailyTotal = chartService.dailyTotal();
		model.addAttribute("dailyTotal", dailyTotal);
		return dailyTotal;
	}

	@RequestMapping(value = "/admin/index/categoryTotal", method = RequestMethod.GET)
	public @ResponseBody List<ChartCategoryVO> categoryTotal(Model model) {
		List<ChartCategoryVO> categoryTotal = chartService.categoryTotal();
		model.addAttribute("categoryTotal", categoryTotal);
		return categoryTotal;
	}
}
