package com.hyundai.dutyfree.vo;

import lombok.Data;
/**
 * PickupDetailVO
 * 
 * @author 김민규
 * @since 02.01
 * 
 * 
 * 	수정일                 수정자                                  수정내용
 * ----------  ---------------      ---------------------------
 * 2023.02.01	    김민규			 		최초 생성
 */

@Data
/* 상품상세정보 */
public class PickupDetailVO {
	// product
	/* 상품코드 */
	private String pcode;
	/* 상품브랜드명 */
	private String pbrand;
	/* 상품명 */
	private String pname;
	/* 상품가격 */
	private int pprice;
	/* 상품재고량 */
	private int pstock;
	/* 상품등록날짜 */
	private String pregdate;
	
	
	// category
	/* 상품카테고리 */
	private String category;
	

	// productimg
	/* 상품이미지 */
	private String img1;

}
