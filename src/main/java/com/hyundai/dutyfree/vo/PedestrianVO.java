package com.hyundai.dutyfree.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * PedestrianVO
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
@NoArgsConstructor
@AllArgsConstructor
public class PedestrianVO {
	private int inside; // 매장 들어온 사람의 수
	private int outside; // 매장 나간 사람의 수
}
