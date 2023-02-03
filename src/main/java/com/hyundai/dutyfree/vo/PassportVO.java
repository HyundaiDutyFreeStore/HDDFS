package com.hyundai.dutyfree.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
/**
 * PassportVO
 * 
 * @author 박진수
 * @since 01.21
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.21    박진수                         최초 생성
 *        </pre>
 */
@Data
public class PassportVO {
	private String mid;
	private String passportno;
	private String surname;
	private String givenname;
	private String pgender;
	private Date pbirth;
	private Date expirydate;
	private String nationality;
	
	
}
