package com.hyundai.dutyfree.service;

import com.hyundai.dutyfree.vo.ExchangerateVO;

/**
 * ExchangerateService
 *
 * @author 김찬중
 * @since 01.12
 *
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.12	 김찬중			최초 생성
 *        </pre>
 */
public interface ExchangerateService {
    
    public void updateExchangerate(ExchangerateVO Exchangerate) throws Exception;
    
    public double getExchangerate(String mcountry);

}
