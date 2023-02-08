package com.hyundai.dutyfree.vo;

import lombok.Data;

/**
 * MemberInfoVO
 * 
 * @author 김민규
 * @since 01.31
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.31    김민규                         최초 생성
 *        </pre>
 */

@Data
/* 고객정보 */
public class MemberInfoVO {
	//member
	/* 회원 이름 */
	private String mname;
	/* 회원 이메일 */
	private String memail;
	/* 회원 전화번호 */
	private String mphone;
	
	//passport
	/* 여권 번호 */
	private String passportno;
	
	//orderList
	/* 편명 */
	private String oplnum;
	/* 주문번호 */
	private String oid;
	/* 출발 일자 */
	private String odeptdate;
	/* 인도장 */
	private String odept;
	/* 비상연락처 */
	private String oelphone;
	/* 주문 상태 */
	private String ostatus;
	
	

}
