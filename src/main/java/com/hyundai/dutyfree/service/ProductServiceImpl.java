package com.hyundai.dutyfree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.ProductMapper;
import com.hyundai.dutyfree.vo.ProductVO;


@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
    private ProductMapper mapper;
	
	@Override
	public List<ProductVO> getList(String clarge, String cmedium, String csmall) {
		System.out.println("서비스들어옴"+clarge+" "+cmedium+" "+csmall);
		return mapper.getList(clarge, cmedium, csmall);
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

}
