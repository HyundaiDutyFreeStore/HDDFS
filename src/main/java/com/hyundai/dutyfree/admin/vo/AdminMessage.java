package com.hyundai.dutyfree.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminMessage {
	
	private String mid;
	private String mname;
	private Date time;
	private String latestMsg;
	private String latestDateStr;
	
}
