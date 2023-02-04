package com.hyundai.dutyfree.vo;

import lombok.Data;

/**
 * CustomerVO
 * 
 * @author 김찬중
 * @since 01.24
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.24    김찬중                         최초 생성
 *        </pre>
 */

@Data
public class CustomerVO {
	private int count; // 고객수
	private int hours; // 시간당
}