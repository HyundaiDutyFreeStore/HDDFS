package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.MemberInfoVO;
import com.hyundai.dutyfree.vo.PickupCustomerVO;
import com.hyundai.dutyfree.vo.PickupDetailVO;
import com.hyundai.dutyfree.vo.PickupListVO;
/**
 * PickupService
 * 
 * @author 김민규
 * @since 01.20
 * 
 * <pre>
 * 수정일                 수정자                                  수정내용
 * 2023.01.20     김민규                                  최초 생성
 * </pre>
 */
public interface PickupService {
	
	public List<PickupListVO> PickupList(String oid); 
	
	public MemberInfoVO memberinfo(String oid); 
	
	public String pickupcomplete(String oid);
	
	public PickupDetailVO PickupDetail(String pcode);
	
	public List<PickupCustomerVO> getCustomerPerTime();
}
