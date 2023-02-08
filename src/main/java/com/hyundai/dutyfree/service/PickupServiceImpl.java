package com.hyundai.dutyfree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.PickupMapper;
import com.hyundai.dutyfree.vo.MemberInfoVO;
import com.hyundai.dutyfree.vo.PickupCustomerVO;
import com.hyundai.dutyfree.vo.PickupDetailVO;
import com.hyundai.dutyfree.vo.PickupListVO;

/**
 * PickupServiceImpl
 * 
 * @author 김민규
 * @since 01.20
 * 
 * 
 * 수정일                 수정자                                  수정내용
 * ----------  ---------------      ---------------------------
 * 2023.01.20     김민규                 최초 생성
 * 2023.01.23	    김민규			 주문목록 조회, 인도완료
 * 2023.01.30	    김민규			 주문목록 조회 출력 컬럼 변경, 인도완료  OSTATUS 변경
 * 2023.01.31	    김민규			 액티비티와 VO 구성 변경으로 인한 변경, 주문목록과 고객정보 분리
 * 2023.02.01	    김민규			 제품 상세 화면
 * 2023.02.02	    김민규			 금일 인도중 상태인 고객의 수를 시간별로 보여주는 기능
 * 
 */


@Service	
public class PickupServiceImpl implements PickupService {
	
	@Autowired
	private PickupMapper mapper;


	@Override
	public List<PickupListVO> PickupList(String oid) { // 주문목록 조회
		return mapper.PickupList(oid);
	}

	@Override
	public String pickupcomplete(String oid) { // 인도완료 기능
		mapper.pickupcomplete(oid);
		return "Pickup Complete!!";
	}

	@Override
	public MemberInfoVO memberinfo(String oid) { // 고객정보 조회
		return mapper.memberinfo(oid);
		
	}

	@Override
	public PickupDetailVO PickupDetail(String pcode) { // 상품상세정보조회
		return mapper.PickupDetail(pcode);
	}

	@Override
	public List<PickupCustomerVO> getCustomerPerTime() { // 인도 예정인 고객의 수를 시간별로 보여주는 기능
		return mapper.getCustomerPerTime();
	}

}
