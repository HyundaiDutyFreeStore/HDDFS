package com.hyundai.dutyfree.mapper;

import com.hyundai.dutyfree.vo.ExchangerateVO;

/**
 * MemberMapper
 * 
 * @author 김찬중
 * @since 01.09
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.09    김찬중                        최초 생성
 *        </pre>
 */

public interface ExchangerateMapper {

	// 환률수정
	public void updateExchangerate(ExchangerateVO Exchangerate);

}