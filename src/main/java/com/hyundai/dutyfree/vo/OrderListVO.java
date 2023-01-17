package com.hyundai.dutyfree.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
 * OrderListVO
 * 
 * @author 박진수
 * @since 01.11
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.11    박진수                         최초 생성
 *        </pre>
 */

@Data
public class OrderListVO {
	private String oid;
	private String mid;
	private Date odate;
	private int ohpoint;
	private String ostatus;
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private Date oarrdate;
	private String oplnum;
}