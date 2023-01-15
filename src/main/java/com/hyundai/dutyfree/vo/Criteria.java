package com.hyundai.dutyfree.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/* 작성자 : 김가희
 * 페이징에 필요한 정보를 저장하는 객체
 */
@Getter
@Setter
@ToString
public class Criteria {

	/* 현재 페이지 번호 */
	private int pageNum;

	/* 페이지 표시 개수 */
	private int amount;

	// 필터링 키워드
	private String type;
	
	// 필터링 가격
	private String priceFilter;
	
	// 필터링 - 가격 직접 입력
	private int priceS;
	private int priceE;
	
	//정렬
	private String order;

	//검색 키워드 
	private String keyword;
	 

	private String[] typeArr;
	private String[] priceArr;

	/* Criteria 생성자 */
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	/* Criteria 기본 생성자 */
	public Criteria() {
		this.pageNum = 1;
		this.amount = 12;
		this.order = "베스트순";
		this.keyword="";
	}

	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	public String[] getPriceArr() {
		return priceFilter == null ? new String[] {} : priceFilter.split("");
	}

	/*
	 * @Override public String toString() { return "Criteria [pageNum=" + pageNum +
	 * ", amount=" + amount + ", type=" + type + "]"; }
	 */

}// end class
