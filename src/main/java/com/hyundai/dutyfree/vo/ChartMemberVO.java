package com.hyundai.dutyfree.vo;

import lombok.Data;

/**
 * ChartMemberVO
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
public class ChartMemberVO {
	private String sex; // 성별
	private int mcnt; // 회원 수
}