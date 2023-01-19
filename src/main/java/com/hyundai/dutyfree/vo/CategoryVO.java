package com.hyundai.dutyfree.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
