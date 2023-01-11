package com.hyundai.dutyfree.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyundai.dutyfree.service.ProductService;
import com.hyundai.dutyfree.vo.CategoryVO;
import com.hyundai.dutyfree.vo.ProductVO;

@Controller
public class ListController {
	@Autowired
	private ProductService service;

	@GetMapping("/list")
	public String list(Model model, @RequestParam("clarge") String clarge, @RequestParam("cmedium") String cmedium,
			@RequestParam("csmall") String csmall) {
		// 카테고리 별 상품리스트를 model에 저장
		List<ProductVO> list = service.getList(clarge, cmedium, csmall);
		List<String> cateList = null;
		int cateCnt = 0;
		if (cmedium.contentEquals("")) {
			System.out.println("medium없음");
			cateCnt = service.CategoryCnt(clarge);
			cateList = service.getMedCategory(clarge);
		} else {
			System.out.println("small없음");
			cateList = service.getSmallCategory(cmedium);
		}
		for (String s : cateList) {
			System.out.println(s);
		}

		CategoryVO category = new CategoryVO(clarge, cmedium, csmall);
		model.addAttribute("category", category);

		model.addAttribute("cateCnt", cateCnt);
		model.addAttribute("cateList", cateList);
		model.addAttribute("list", list);
		return "product/ProductList";
	}

}
