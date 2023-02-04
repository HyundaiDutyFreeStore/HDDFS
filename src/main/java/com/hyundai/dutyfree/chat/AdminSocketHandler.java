package com.hyundai.dutyfree.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hyundai.dutyfree.admin.vo.AdminChat;
import com.hyundai.dutyfree.mapper.MemberMapper;
import com.hyundai.dutyfree.service.AdminService;
import com.hyundai.dutyfree.vo.MemberVO;

import lombok.extern.log4j.Log4j;
/**
 * AdminSocketHandler
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
@Log4j
public class AdminSocketHandler extends TextWebSocketHandler {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private AdminService service;

	Map<MemberVO, WebSocketSession> users = new HashMap<MemberVO, WebSocketSession>();
	private ObjectMapper objectMapper = new ObjectMapper();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		log.debug("핸들러실행됨");

		MemberVO member = memberMapper.read(session.getPrincipal().getName());
		log.info("연결된 member: " + member);
		log.info("session: " + session);
		
		users.put(member, session);
		
		//이전채팅 내역 보내기
		String loginId = session.getPrincipal().getName();
		List<AdminChat> allChatList = new ArrayList<AdminChat>();
		Map<String, List<AdminChat>> mapToSend = new HashMap<>();
		allChatList = service.prevChat(loginId);
		System.out.println("allchatlist:" + allChatList);
		mapToSend.put("prev", allChatList);
		String jsonStr = objectMapper.writeValueAsString(mapToSend);
		session.sendMessage(new TextMessage(jsonStr));

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {


		String loginId = session.getPrincipal().getName();
		log.info("handleTextMessage에서 loginId: "+loginId);
		
		if(message.getPayload().equals("memberConnected")) {
			return;
		}

		AdminChat ac = new AdminChat();
		ac = objectMapper.readValue(message.getPayload(), AdminChat.class);
		log.info("들어온메세지: " + ac);
		service.insertAdminChat(ac); //새로들어온 메세지 DB에 insert하기
		
		Iterator<MemberVO> it = users.keySet().iterator();// users라는 map 전체를 돌릴 것이다
		while (it.hasNext()) {
			MemberVO key = it.next();// user에 있는 Member객체로 하나씩 뽑아와서key변수로 지정
			users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(ac)));
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("핸들러끝");
		List<MemberVO> keyList = new ArrayList<>();
		Iterator<MemberVO> it = users.keySet().iterator();
		while (it.hasNext()) {
			MemberVO key = it.next();
			if (users.get(key).equals(session)) {
				keyList.add(key);
			}
		}

		for (MemberVO listkey : keyList) {
			users.remove(listkey);
		}

	}

}
