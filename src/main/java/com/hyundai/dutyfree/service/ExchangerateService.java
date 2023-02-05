package com.hyundai.dutyfree.service;

import com.hyundai.dutyfree.vo.ExchangerateVO;

/**
 * ExchangerateService
 *
 * @author 박진수
 * @since 01.12
 *
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.12	 박진수			최초 생성
 *        </pre>
 */
public interface ExchangerateService {
    
	//환률 업데이트
    public void updateExchangerate(ExchangerateVO Exchangerate) throws Exception;
    //국가 선택
    public double getExchangerate(String mcountry);

}
