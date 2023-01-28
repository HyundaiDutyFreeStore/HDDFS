package com.hyundai.dutyfree.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.admin.vo.AdminChat;
import com.hyundai.dutyfree.admin.vo.AdminMessage;
import com.hyundai.dutyfree.mapper.AdminMapper;
import com.hyundai.dutyfree.mapper.ProductMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	@Override
	public List<AdminChat> selectAdminInChat() {
		return mapper.selectAdminInChat();
	}
	
	@Override
	public List<AdminChat> prevChat(String mid) {
		return mapper.prevChat(mid);
	}

	@Override
	public void insertAdminChat(AdminChat ac) {
		mapper.insertAdminChat(ac);
	}

	@Override
	public List<String> firstUsidList() {
		return mapper.firstUsidList();
	}

	@Override
	public List<String> secondUsidList() {
		return mapper.secondUsidList();
	}

	@Override
	public AdminMessage loadAdminMessage(HashMap<String, String> usidMap) {
		return mapper.loadAdminMessage(usidMap);
	}

	

}
