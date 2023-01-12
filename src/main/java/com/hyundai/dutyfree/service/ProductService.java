package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.PageDTO;
import com.hyundai.dutyfree.vo.ProductVO;


public interface ProductService {
	
	// 대, 중, 소 분류에 해당하는 상품 리스트 조회
    public List<ProductVO> getList(Criteria cri, String clarge, String cmedium, String csmall);
    
 // 대, 중, 소 분류에 해당하는 총 상품개수 조회
    public int getTotal(String clarge, String cmedium, String csmall);
    
    //대분류 시 중분류 가져오기
    public List<String> getMedCategory(String clarge);
    
    //중분류 시 소분류 가져오기
    public List<String> getSmallCategory(String cmedium);
    
    //하위 카테고리 개수가져오기 (대분류시 중분류, 중분류시 소분류)
    public int CategoryCnt(String category);

    //페이징처리 리스트조회
	public List<ProductVO> getAjaxList(PageDTO pto);
 
}

