package com.hyundai.dutyfree.vo;

import lombok.Data;

@Data
public class CartVOforJSP {
	
	private String pname;
	private String pbrand;
	private String pcode;
	private int pstock;
	private float pprice;
	private int pdiscount;
	private String img1;
	private String mid;
	private int cartno;
	private int cartstock;
}
