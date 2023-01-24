package com.hyundai.dutyfree.vo;

import java.sql.Date;

import lombok.Data;

/**
 * MemberVO
 * 
 * @author 김찬중
 * @since 01.09
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.09    김찬중                         최초 생성
 *        </pre>
 */
@Data
public class MemberVO {
	private String mid; // 회원 id
	private String mpassword; // 회원 pw
	private String memail; // 회원 이메일
	private String mphone; // 회원 전화번호
	private String mname; // 회원 이름
	private int mhpoint; // mpoint
	private Date mregdate; // 회원가입 날짜
	private String mgender; // 회원 성별
	private String mrole; // 시큐리티를 위한 권한
	private double mtotal; // 주문총금액

}
