package com.hyundai.dutyfree.admin.vo;

import java.util.Date;

import lombok.Data;
/**
 * AdminMessage
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
public class AdminMessage {
	
	private String mid;
	private String mname;
	private Date time;
	private String latestMsg;
	private String latestDateStr;
	
}
