package com.hyundai.dutyfree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.ProductMapper;
import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.PageDTO;
import com.hyundai.dutyfree.vo.ProductVO;


@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
    private ProductMapper mapper;
	
	@Override
	public List<ProductVO> getList(Criteria cri, String clarge, String cmedium, String csmall, String order) {
		return mapper.getList(cri,clarge, cmedium, csmall,order);
	}
	
	@Override
	public int getTotal(String clarge, String cmedium, String csmall) {
		return mapper.getTotal(clarge, cmedium, csmall);
	}
	
	@Override
	public List<String> getMedCategory(String clarge){
		return mapper.getMedCategory(clarge);
	}
	
	@Override
	public List<String> getSmallCategory(String cmedium){
		return mapper.getSmallCategory(cmedium);
	}

	@Override
	public int CategoryCnt(String category) {
		return mapper.CategoryCnt(category);
	}

	@Override
	public List<ProductVO> getAjaxList(PageDTO pto) {
		return mapper.getAjaxList(pto);
	}

	

}
