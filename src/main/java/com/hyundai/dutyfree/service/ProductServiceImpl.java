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
	public List<ProductVO> getFilterList(Criteria cri, CategoryVO cate) {
		HashMap<String,Object> listMap = new HashMap<>();
		listMap.put("cri", cri);
		listMap.put("cate",cate);
		//listMap.put("order",order);
		return mapper.getFilterList(listMap);
	}
	
	@Override
	public int getTotal2(Criteria cri, CategoryVO cate) {
		System.out.println("service에서 cri: "+cri);
		System.out.println("service에서 cate: "+cate);
		/* System.out.println("service에서 order: "+order); */
		HashMap<String,Object> listMap = new HashMap<>();
		listMap.put("cri", cri);
		listMap.put("cate",cate);
		/* listMap.put("order",order); */
		return mapper.getTotal2(listMap);
	}
	
	@Override
	public List<ProductVO> getList(Criteria cri, String clarge, String cmedium, String csmall, String order) {
		return mapper.getList(cri,clarge, cmedium, csmall,order);
	}
	
	@Override
	public int getTotal(String clarge, String cmedium, String csmall, String keyword) {
		return mapper.getTotal(clarge, cmedium, csmall, keyword);
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
