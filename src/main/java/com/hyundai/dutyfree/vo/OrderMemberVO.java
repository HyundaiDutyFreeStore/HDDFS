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
	private String mname; // 고객이름
	private String memail; // 고객 이메일
	private String oid; // 주문번호
	private String odept; // 인도장
	private Date odeptdate; // 비행기 출발 시간
}