package com.hyundai.dutyfree.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class CartVO {
	
	private int cartstock;
	private Date cartregdate;
	private String mid;
	
}
