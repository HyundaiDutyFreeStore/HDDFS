package com.hyundai.dutyfree.vo;

import lombok.Data;
/**
 * PickupListVO
 * 
 * @author 김민규
 * @since 01.23
 * 
 * <pre>
 * 수정일                 수정자                                  수정내용
 * ----------  ---------------      ---------------------------
 * 2023.01.23	    김민규			 	최초생성
 * 2023.01.31	    김민규			 	액티비티와 VO 구성 변경으로 인한 변경, 주문목록과 고객정보 분리
 * </pre>
 */

@Data
/* 주문목록  */
public class PickupListVO {
	// product
	/* 상품코드 */
	private String pcode;
	/* 상품브랜드명 */
	private String pbrand;
	/* 상품명 */
	private String pname;

	// orderitem
	/* 구매수량 */
	private int oamount;

	// productimg
	/* 상품이미지 */
	private String img1;

}
