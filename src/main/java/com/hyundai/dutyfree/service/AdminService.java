package com.hyundai.dutyfree.service;

import java.util.HashMap;
import java.util.List;

import com.hyundai.dutyfree.admin.vo.AdminChat;
import com.hyundai.dutyfree.admin.vo.AdminMessage;
/**
 * AdminService
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
public interface AdminService {

	// List<String> chatList();

	//List<AdminChat> selectAdminInChat();
	
	
	
	//1대1 실시간 상담 관련
	
	//이전 채팅내역 불러오기
	List<AdminChat> prevChat(String mid);

	//채팅insert
	void insertAdminChat(AdminChat ac);

	//관리자에게 채팅신청한 고객ID 리스트 조회 (발신자: 고객)
	List<String> firstUsidList();

	//관리자가 채팅을 보낸 고객ID 리스트 조회 (수신자: 고객)
	List<String> secondUsidList();

	//관리자와 특정고객의 가장 최신 대화 조회
	AdminMessage loadAdminMessage(HashMap<String, String> usidMap);
}
