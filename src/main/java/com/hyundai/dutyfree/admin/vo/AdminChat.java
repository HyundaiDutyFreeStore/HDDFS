package com.hyundai.dutyfree.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminChat {
	private String adminFirstUsid;	//발신인
	private String adminSecondUsid;	//수신인
	private String adminChatContent;	//내용
	private Date adminChatDate;	//발신시간
	//private String adminChatFile;
	//private String adminChatSenderNickname;
}
