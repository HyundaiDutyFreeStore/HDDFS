package com.hyundai.dutyfree.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.ProductVO;

public interface ProductMapper {
	// 카테고리별 상품리스트
    public List<ProductVO> getList(@Param("clarge")String clarge, @Param("cmedium")String cmedium, @Param("csmall")String csmall); 
    //public List<ProductVO> getList(String clarge, String cmedium, String csmall); 
}
