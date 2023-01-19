package com.hyundai.dutyfree.vo;

import java.sql.Date;

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
	private String oarrdate;
	private String oplnum;
	private String oelnum;
	private String oplace;
}