package com.hyundai.dutyfree.service;

import java.util.HashMap;
import java.util.List;

import com.hyundai.dutyfree.admin.vo.AdminChat;
import com.hyundai.dutyfree.admin.vo.AdminMessage;

public interface AdminService {

	// List<String> chatList();

	List<AdminChat> selectAdminInChat();
	
	List<AdminChat> prevChat(String mid);

	void insertAdminChat(AdminChat ac);

	List<String> firstUsidList();

	List<String> secondUsidList();

	AdminMessage loadAdminMessage(HashMap<String, String> usidMap);
}
