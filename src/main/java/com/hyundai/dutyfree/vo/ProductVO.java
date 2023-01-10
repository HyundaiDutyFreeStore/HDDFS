package com.hyundai.dutyfree.vo;

import lombok.Data;

@Data
public class ProductVO {
	//상품품번
	private String pcode;
	//상품명
	private String pname;
	//브랜드이름
	private String pbrand;
	//가격
	private float pprice;
	//할인율
	private int pdiscount;
	//재고량
	private int pstock;
	//품절여부
	private boolean penable;
	//대분류
	private String clarge;
	//중분류
	private String cmedium;
	//소분류
	private String csmall;
	//이미지
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;

}
