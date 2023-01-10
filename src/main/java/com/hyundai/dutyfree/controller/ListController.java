package com.hyundai.dutyfree.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyundai.dutyfree.service.ProductService;
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
		model.addAttribute("list", list);
		return "product/ProductList";
	}

}
