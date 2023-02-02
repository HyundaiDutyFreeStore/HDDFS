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
