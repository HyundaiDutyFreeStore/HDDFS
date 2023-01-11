package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.ProductVO;


public interface ProductService {
	
	// 대, 중, 소 분류에 해당하는 상품 리스트 조회
    public List<ProductVO> getList(String clarge, String cmedium, String csmall);
    
    //대분류 시 중분류 가져오기
    public List<String> getMedCategory(String clarge);
    
    //중분류 시 소분류 가져오기
    public List<String> getSmallCategory(String cmedium);
    
    public int CategoryCnt(String category);
 
}

