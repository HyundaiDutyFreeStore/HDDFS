package com.hyundai.dutyfree.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.ProductMapper;
import com.hyundai.dutyfree.vo.CategoryVO;
import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.PageDTO;
import com.hyundai.dutyfree.vo.ProductVO;


@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
    private ProductMapper mapper;
	
	@Override
	public List<ProductVO> getList(Criteria cri, CategoryVO cate) {
		System.out.println("service에서 cri: "+cri);
		System.out.println("service에서 cate: "+cate);
		
		HashMap<String,Object> listMap = new HashMap<>();
		listMap.put("cri", cri);
		listMap.put("cate",cate);
		return mapper.getList(listMap);
	}
	
	@Override
	public int getTotal(Criteria cri, CategoryVO cate) {
		System.out.println("service에서 cri: "+cri);
		System.out.println("service에서 cate: "+cate);
		HashMap<String,Object> listMap = new HashMap<>();
		listMap.put("cri", cri);
		listMap.put("cate",cate);
		return mapper.getTotal(listMap);
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
	public ProductVO productdetail(String pcode) {
		return mapper.productdetail(pcode);
	}


}
