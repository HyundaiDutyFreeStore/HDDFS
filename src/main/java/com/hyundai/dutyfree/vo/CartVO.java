package com.hyundai.dutyfree.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * CartVO
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
@NoArgsConstructor
public class CartVO {
	private int cartno;
	private int cartstock;
	private Date cartregdate;
	private String mid;
	private String pcode;
	private ProductVO product;
	
}
