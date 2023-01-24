package com.hyundai.dutyfree.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * CategoryVO
 * 
 * @author 김가희
 * @since 01.11
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.11    김가희                         최초 생성
 *        </pre>
 */
@Data
@AllArgsConstructor
public class CategoryVO {
	private String clarge;
	private String cmedium;
	private String csmall;
	
	public CategoryVO() {
		this.clarge="";
		this.cmedium="";
		this.csmall="";
	}
}
