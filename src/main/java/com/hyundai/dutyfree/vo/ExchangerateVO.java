package com.hyundai.dutyfree.vo;

import lombok.Data;

/**
 * MemberVO
 * 
 * @author 김찬중
 * @since 01.09
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.09    김찬중                         최초 생성
 *        </pre>
 */
@Data
public class ExchangerateVO {
	private String mcountry; // 화폐
	private double mmoney; // 환률
}