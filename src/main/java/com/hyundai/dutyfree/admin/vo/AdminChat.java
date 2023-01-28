package com.hyundai.dutyfree.admin.vo;

import java.util.Date;

import lombok.Data;
/**
 * AdminChat
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
@Data
public class AdminChat {
	private String adminFirstUsid;	//발신인
	private String adminSecondUsid;	//수신인
	private String adminChatContent;	//내용
	private Date adminChatDate;	//발신시간
	//private String adminChatFile;
	//private String adminChatSenderNickname;
}
