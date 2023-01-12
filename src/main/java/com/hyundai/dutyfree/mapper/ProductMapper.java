package com.hyundai.dutyfree.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.PageDTO;
import com.hyundai.dutyfree.vo.ProductVO;

public interface ProductMapper {
	// 카테고리별 상품리스트
    public List<ProductVO> getList(Criteria cri,@Param("clarge")String clarge, @Param("cmedium")String cmedium, @Param("csmall")String csmall, @Param("porder")String order); 
    
    //카테고리별 상품 총 개수
    public int getTotal(@Param("clarge")String clarge, @Param("cmedium")String cmedium, @Param("csmall")String csmall);
    
    public int CategoryCnt(String keyword);
    
    public List<String> getMedCategory(String clarge);
    
    public List<String> getSmallCategory(String cmedium);

	public List<ProductVO> getAjaxList(PageDTO pto);
}
