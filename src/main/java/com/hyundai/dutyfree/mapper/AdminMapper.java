package com.hyundai.dutyfree.mapper;

import java.util.HashMap;
import java.util.List;

import com.hyundai.dutyfree.admin.vo.AdminChat;
import com.hyundai.dutyfree.admin.vo.AdminMessage;

public interface AdminMapper {
	
	public List<AdminChat> selectAdminInChat();
	
	public List<AdminChat> prevChat(String mid);

	public void insertAdminChat(AdminChat ac);
	
	public List<String> firstUsidList();
	
	public List<String> secondUsidList();
	
	public AdminMessage loadAdminMessage(HashMap<String, String> usidMap);
}
