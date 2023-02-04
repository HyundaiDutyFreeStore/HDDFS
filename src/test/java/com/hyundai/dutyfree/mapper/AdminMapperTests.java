package com.hyundai.dutyfree.mapper;


import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.dutyfree.admin.vo.AdminChat;
import com.hyundai.dutyfree.admin.vo.AdminMessage;
import com.hyundai.dutyfree.vo.CategoryVO;
import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.ProductVO;

import lombok.extern.log4j.Log4j;

/**
 * ProductMapperTests
 * 
 * @author 김가희
 * @since 01.26
 * 
 * <pre>
 * 수정일                 수정자                                  수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.26     김가희                                  최초 생성
 * </pre>
 */
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml"})

public class AdminMapperTests {

	@Autowired
	private AdminMapper adminMapper;
	
	
	//이전대화목록 불러오기 테스트
	@Test
	public void prevChatTests() {
		String mid = "gahee3839";
		List<AdminChat> chatList = adminMapper.prevChat(mid);
		chatList.forEach( i -> log.info(i));
	}
	
	//채팅insert 테스트
	@Test
	public void insertAdminChatTests() {
		Date chatDate = Date.valueOf("2023-01-26");
		
		AdminChat ac = new AdminChat();
		ac.setAdminFirstUsid("admin");
		ac.setAdminSecondUsid("gahee3839");
		ac.setAdminChatContent("채팅테스트내역");
		ac.setAdminChatDate(chatDate);
		ac.setAdminChatRoomNo("gahee3839");
		
		adminMapper.insertAdminChat(ac);
	}
	
	//관리자가 모든 채팅방ID 조회 테스트
	@Test
	public void roomNoListTests() {
		List<AdminChat> totalUsidList = adminMapper.roomNoList();
		totalUsidList.forEach(i -> log.info(i));
	}
	
	//관리자와 특정고객의 가장 최신 대화 조회 테스트
	@Test
	public void loadAdminMessageTests() {
		HashMap<String, String> usidMap = new HashMap<>();
		String memberUsid = "gahee3839";
		String adminUsid = "admin";
		
		usidMap.put("adminUsid", adminUsid);
		usidMap.put("memberUsid", memberUsid);
		AdminMessage am = adminMapper.loadAdminMessage(usidMap);
		log.info(am);
	}
	
	
}
