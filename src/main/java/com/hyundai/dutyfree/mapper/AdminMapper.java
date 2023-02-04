package com.hyundai.dutyfree.mapper;

import java.util.HashMap;
import java.util.List;

import com.hyundai.dutyfree.admin.vo.AdminChat;
import com.hyundai.dutyfree.admin.vo.AdminMessage;
/**
 * AdminMapper
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
public interface AdminMapper {
	
	public List<AdminChat> prevChat(String mid);

	public void insertAdminChat(AdminChat ac);
	
	public List<String> firstUsidList();
	
	public List<String> secondUsidList();
	
	public List<AdminChat> roomNoList();
	
	public AdminMessage loadAdminMessage(HashMap<String, String> usidMap);
}
