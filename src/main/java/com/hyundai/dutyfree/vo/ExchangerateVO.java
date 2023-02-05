package com.hyundai.dutyfree.vo;

import lombok.Data;

/**
 * ExchangerateVO
 * 
 * @author 박진수
 * @since 01.09
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.09    박진수                         최초 생성
 *        </pre>
 */
@Data
public class ExchangerateVO {
	private String mcountry; // 화폐
	private double mmoney; // 환률
}