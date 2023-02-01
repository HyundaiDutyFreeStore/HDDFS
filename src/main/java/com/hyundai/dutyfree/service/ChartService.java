package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.ChartCategoryVO;
import com.hyundai.dutyfree.vo.ChartDailyVO;
import com.hyundai.dutyfree.vo.ChartMemberVO;
import com.hyundai.dutyfree.vo.ChartVisiterVO;

/**
 * ChartService
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
public interface ChartService {

	// 회원 수 불러오기
	List<ChartMemberVO> cntMember();

	// 일일 매출 불러오기
	List<ChartDailyVO> dailyTotal();

	// 판매 카테고리 종합
	List<ChartCategoryVO> categoryTotal();

	// 일일방문자수 종합
	List<ChartVisiterVO> cntTodayVisiter();
}
