package com.hyundai.dutyfree.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.PageDTO;
import com.hyundai.dutyfree.vo.ProductVO;

public interface ProductMapper {
	
	//목록띄우기
	public List<ProductVO> getList(HashMap<String, Object> listMap);
	
	//조건에 맞는 총 상품개수
	public int getTotal(HashMap<String, Object> listMap);

	//해당 대분류의 중분류 가져오기
	public List<String> getMedCategory(String clarge);

	//해당 중분류의 소분류 가져오기
	public List<String> getSmallCategory(String cmedium);
	
	//상품디테일
	public ProductVO productdetail(String pcode);

}
