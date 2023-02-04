package com.hyundai.dutyfree.vo;

import lombok.Data;
/**
 * CartVOforJSP
 * 
 * @author 박진수
 * @since 01.11
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.12    박진수                         최초 생성
 *        </pre>
 */
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
	private boolean cartprodcon;
}
