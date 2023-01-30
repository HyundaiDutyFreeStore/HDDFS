package com.hyundai.dutyfree.mapper;

import java.util.List;

import com.hyundai.dutyfree.vo.ChartVO;

/**
 * ChartMapper
 * 
 * @author 김찬중
 * @since 01.30
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.30    김찬중                        최초 생성
 *        </pre>
 */
public interface ChartMapper {
	// 회원 수 불러오기
	public List<ChartVO> cntMember();

	// 일일 매출 불러오기
	public List<ChartVO> dailyTotal();

	// 판매 카테고리 종합
	public List<ChartVO> categoryTotal();
}
