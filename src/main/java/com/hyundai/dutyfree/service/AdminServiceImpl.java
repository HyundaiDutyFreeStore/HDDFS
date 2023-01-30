package com.hyundai.dutyfree.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.admin.vo.AdminChat;
import com.hyundai.dutyfree.admin.vo.AdminMessage;
import com.hyundai.dutyfree.mapper.AdminMapper;
import com.hyundai.dutyfree.mapper.ProductMapper;
/**
 * AdminServiceImpl
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

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	/*
	 * @Override public List<AdminChat> selectAdminInChat() { return
	 * mapper.selectAdminInChat(); }
	 */
	
	//1대1 실시간 상담 관련
	
	//이전 채팅내역 불러오기
	@Override
	public List<AdminChat> prevChat(String mid) {
		return mapper.prevChat(mid);
	}

	//채팅insert
	@Override
	public void insertAdminChat(AdminChat ac) {
		mapper.insertAdminChat(ac);
	}

	//관리자에게 채팅신청한 고객ID 리스트 조회 (발신자: 고객)
	@Override
	public List<String> firstUsidList() {
		return mapper.firstUsidList();
	}

	//관리자가 채팅을 보낸 고객ID 리스트 조회 (수신자: 고객)
	@Override
	public List<String> secondUsidList() {
		return mapper.secondUsidList();
	}
	
	//관리자가 모든 채팅방ID 조회 
	@Override
	public List<AdminChat> roomNoList() {
		return mapper.roomNoList();
	}

	//관리자와 특정고객의 가장 최신 대화 조회
	@Override
	public AdminMessage loadAdminMessage(HashMap<String, String> usidMap) {
		return mapper.loadAdminMessage(usidMap);
	}

	

}
