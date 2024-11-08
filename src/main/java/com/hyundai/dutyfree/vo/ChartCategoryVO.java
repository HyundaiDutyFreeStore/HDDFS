package com.hyundai.dutyfree.vo;

import lombok.Data;

/**
 * ChartCategoryVO
 * 
 * @author 김찬중
 * @since 01.30
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.30    김찬중                         최초 생성
 *        </pre>
 */
@Data
public class ChartCategoryVO {
	private String cat; // 카테고리
	private int ccnt; // 카테고리 당 판매 수
}