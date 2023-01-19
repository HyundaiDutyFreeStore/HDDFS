package com.hyundai.dutyfree.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.ExchangerateMapper;
import com.hyundai.dutyfree.vo.ExchangerateVO;

/**
 *
 * @author 김찬중
 * @since 01.19
 *
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.19	  김찬중			최초 생성
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

}
