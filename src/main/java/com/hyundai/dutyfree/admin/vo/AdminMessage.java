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
	
	private String mid;	//고객ID
	private String mname;	//고객이름
	private Date time;	//메세지 작성시간
	private String latestMsg;	//마지막메세지
	private String latestDateStr;
	
}
