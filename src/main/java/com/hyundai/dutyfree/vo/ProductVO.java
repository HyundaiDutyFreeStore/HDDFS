package com.hyundai.dutyfree.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
/**
 * ProductVO
 * 
 * @author 김가희
 * @since 01.11
 * 
 *        
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.11    김가희                        최초 생성
 *        
 */
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
	//상품등록일
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private Date pregdate;
	//판매량
	private int psel;
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
