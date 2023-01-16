package com.hyundai.dutyfree.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class CartVO {
	private int cartno;
	private int cartstock;
	private Date cartregdate;
	private String mid;
	private String pcode;
	private ProductVO product;
	
}
