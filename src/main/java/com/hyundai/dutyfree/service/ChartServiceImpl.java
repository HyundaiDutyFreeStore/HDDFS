package com.hyundai.dutyfree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.ChartMapper;
import com.hyundai.dutyfree.vo.ChartCategoryVO;
import com.hyundai.dutyfree.vo.ChartDailyVO;
import com.hyundai.dutyfree.vo.ChartMemberVO;

/**
 * ChartServiceImpl
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

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private ChartMapper mapper;

	// 회원 수 불러오기
	@Override
	public List<ChartMemberVO> cntMember() {
		return mapper.cntMember();
	}

	// 일일 매출 불러오기
	@Override
	public List<ChartDailyVO> dailyTotal() {
		return mapper.dailyTotal();
	}

	// 판매 카테고리 종합
	@Override
	public List<ChartCategoryVO> categoryTotal() {
		return mapper.categoryTotal();
	}
}
