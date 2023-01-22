package com.hyundai.dutyfree.vo;

import lombok.Data;
/**
 * OrderItemVO
 * 
 * @author 박진수
 * @since 01.11
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.11    박진수                         최초 생성
 *        </pre>
 */
@Data
public class OrderItemVO {
	
	private String pcode;
	private int oamount;
	private String oid;
	private ProductVO product;

}
