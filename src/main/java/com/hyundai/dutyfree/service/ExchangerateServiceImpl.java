package com.hyundai.dutyfree.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.ExchangerateMapper;
import com.hyundai.dutyfree.vo.ExchangerateVO;

/**
 * ExchangerateServiceImpl
 *
 * @author 박진수
 * @since 01.19
 *
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.19	  박진수			최초 생성
 *        </pre>
 */
@Service
public class ExchangerateServiceImpl implements ExchangerateService {

	@Autowired
	ExchangerateMapper erMapper;

	// 환율 수정
	@Override
	public void updateExchangerate(ExchangerateVO Exchangerate) throws Exception {
		erMapper.updateExchangerate(Exchangerate);
	}

	// 국가 선택
	@Override
	public double getExchangerate(String mcountry) {

		return erMapper.getExchangerate(mcountry);
	}

}
