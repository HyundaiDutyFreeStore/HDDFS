package com.hyundai.dutyfree.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

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
