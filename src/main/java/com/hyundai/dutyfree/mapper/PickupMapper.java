package com.hyundai.dutyfree.mapper;

import java.util.List;

import com.hyundai.dutyfree.vo.MemberInfoVO;
import com.hyundai.dutyfree.vo.PickupCustomerVO;
import com.hyundai.dutyfree.vo.PickupDetailVO;
import com.hyundai.dutyfree.vo.PickupListVO;

public interface PickupMapper {
	
	public List<PickupListVO> PickupList(String oid);
	
	public void pickupcomplete(String oid);
	
	public MemberInfoVO memberinfo(String oid);
	
	public PickupDetailVO PickupDetail(String pcode);
	
	public List<PickupCustomerVO> getCustomerPerTime();
}
