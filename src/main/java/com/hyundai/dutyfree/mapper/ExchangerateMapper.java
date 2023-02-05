package com.hyundai.dutyfree.mapper;

import com.hyundai.dutyfree.vo.ExchangerateVO;

/**
 * ExchangerateMapper
 * 
 * @author 박진수
 * @since 01.09
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.09    박진수                        최초 생성
 *        </pre>
 */

public interface ExchangerateMapper {

	// 환률수정
	public void updateExchangerate(ExchangerateVO Exchangerate);
	
	//국가 선택
	public double getExchangerate(String mcountry);
}