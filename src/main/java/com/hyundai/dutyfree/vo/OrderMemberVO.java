package com.hyundai.dutyfree.vo;

import java.sql.Date;

import lombok.Data;

/**
 * OrderMemberVO
 * 
 * @author 김찬중
 * @since 01.26
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.26    김찬중                         최초 생성
 *        </pre>
 */

@Data
public class OrderMemberVO {
	private String mname;
	private String memail;
	private String oid;
	private String odept;
	private Date odeptdate;
}