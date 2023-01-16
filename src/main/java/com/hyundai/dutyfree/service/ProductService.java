package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.CategoryVO;
import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.PageDTO;
import com.hyundai.dutyfree.vo.ProductVO;

public interface ProductService {
	
	//상품목록 불러오기
	public List<ProductVO> getList(Criteria cri, CategoryVO cate);

	//조건에 맞는 총 상품개수
	public int getTotal(Criteria cri, CategoryVO cate);

	// 대분류 시 중분류 가져오기
	public List<String> getMedCategory(String clarge);

	// 중분류 시 소분류 가져오기
	public List<String> getSmallCategory(String cmedium);
	
	//상품 디테일
	public ProductVO productdetail(String pcode);

}
