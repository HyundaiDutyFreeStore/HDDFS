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
 * <pre>
 * 수정일                 수정자                                  수정내용
 * 2023.01.20     김민규                                  최초 생성
 * </pre>
 */


@Service	
public class PickupServiceImpl implements PickupService {
	
	@Autowired
	private PickupMapper mapper;


	@Override
	public List<PickupListVO> PickupList(String oid) {
		return mapper.PickupList(oid);
	}

	@Override
	public String pickupcomplete(String oid) {
		mapper.pickupcomplete(oid);
		return "Pickup Complete!!";
	}

	@Override
	public MemberInfoVO memberinfo(String oid) {
		return mapper.memberinfo(oid);
		
	}

	@Override
	public PickupDetailVO PickupDetail(String pcode) {
		return mapper.PickupDetail(pcode);
	}

	@Override
	public List<PickupCustomerVO> getCustomerPerTime() {
		return mapper.getCustomerPerTime();
	}

}
