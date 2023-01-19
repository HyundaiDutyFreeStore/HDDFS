package com.hyundai.dutyfree.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyundai.dutyfree.service.MemberService;
import com.hyundai.dutyfree.service.OrderService;
import com.hyundai.dutyfree.service.ProductService;
import com.hyundai.dutyfree.vo.CategoryVO;
import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.MemberVO;
import com.hyundai.dutyfree.vo.PageDTO;
import com.hyundai.dutyfree.vo.PassportVO;
import com.hyundai.dutyfree.vo.ProductVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService service;
	
	@Autowired
	private OrderService orderservice;
	
	@Autowired
	private MemberService memberservice;

	// 맨처음 리스트를 띄울때 (카테고리 선택해서)
	@GetMapping("/list")
	public String list(Criteria cri, Model model, @RequestParam("clarge") String clarge,
			@RequestParam("cmedium") String cmedium, @RequestParam("csmall") String csmall) {

		System.out.println("/list controller에서 cri: " + cri);

		// 선택한 카테고리 model에 저장
		CategoryVO category = new CategoryVO(clarge, cmedium, csmall);
		model.addAttribute("category", category);

		// 정렬기준 model에 저장
		model.addAttribute("order", cri.getOrder());

		// 카테고리 별 상품리스트를 model에 저장
		List<ProductVO> list = service.getList(cri, category);
		model.addAttribute("list", list);

		// selectBox를 위해서 중분류목록, 소분류목록 저장
		List<String> cateMedList = service.getMedCategory(clarge);
		model.addAttribute("cateMedList", cateMedList);
		List<String> cateSmallList = service.getSmallCategory(cmedium);
		model.addAttribute("cateSmallList", cateSmallList);

		// 하위카테고리 목록 받아오기(대분류->중분류, 중분류->소분류, 소분류->소분류) => 표를 위해서
		List<String> cateList = null;
		if (cmedium.contentEquals("")) {
			cateList = cateMedList;
		} else {
			cateList = cateSmallList;
		}
		// 하위카테고리수, 하위카테고리 리스트 보내기
		model.addAttribute("cateList", cateList);

		// 페이징 처리를 위해 총상품 개수와 pageDTO를 model로 넘김
		int total = service.getTotal(cri, category);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("totalProducts", total);

		return "product/ProductList";
	}

	// 정렬,필터적용으로 상품목록 다시 띄우기
	@ResponseBody
	@GetMapping(value = "/filter", produces = "application/json; charset=UTF-8")
	public String filterList(Criteria cri, CategoryVO cate) {
		System.out.println("filter에 들어옴");
		System.out.println("cate: "+cate);
		System.out.println("cri: "+cri);
		//CategoryVO cate = new CategoryVO(clarge, cmedium, csmall);
		//System.out.println(cate);
		System.out.println("controller에서 cri값: " + cri);

		JSONObject jsonObj = new JSONObject();

		// 정렬
		jsonObj.put("order", cri.getOrder());
		// 현재 페이지번호
		jsonObj.put("ppage", cri.getPageNum());

		// 카테고리,정렬,필터에 맞춘 상품개수
		int total = service.getTotal(cri, cate);
		System.out.println("controller에서 총개수: " + total);
		jsonObj.put("total", total);

		// 카테고리,정렬,필터에 맞춘 상품목록 받아오기
		List<ProductVO> list = service.getList(cri, cate);

		JSONArray jarr = new JSONArray();
		for (ProductVO vo : list) {
			JSONObject obj = new JSONObject(vo);
			jarr.put(obj);
		}

		jsonObj.put("products", jarr);
		String json = jsonObj.toString();
		return json;
	}

	// ajax로 페이지이동
	@ResponseBody
	@GetMapping(value = "/filterPaging", produces = "application/json; charset=UTF-8")
	public String filterPaging(Criteria cri, int total) {
		System.out.println("filterPaging controller");
		System.out.println("cri: " + cri);
		PageDTO pd = new PageDTO(cri, total);
		System.out.println("paging pageDTO: " + pd);
		JSONObject obj = new JSONObject(pd);
		String json = obj.toString();
		return json;
	}

	// 상품디테일로 이동
	@GetMapping("/Productdetail")
	public String productdetail(@RequestParam("pcode") String pcode, Model model,Principal prin) throws Exception {
		List<String> imglist = new ArrayList<String>();
		ProductVO product = service.productdetail(pcode);
		if(prin != null) {
			PassportVO passport=orderservice.PassportConsist(prin.getName());
			if(passport==null) {
				model.addAttribute("userpassport", null);
			}else {
				model.addAttribute("userpassport", passport);
			}
		}
		
		System.out.println(product.toString());
		if (product.getImg1() != null) {
			imglist.add(product.getImg1());
		}
		if (product.getImg2() != null) {
			imglist.add(product.getImg2());
		}
		if (product.getImg3() != null) {
			imglist.add(product.getImg3());
		}
		if (product.getImg4() != null) {
			imglist.add(product.getImg4());
		}
		if (product.getImg5() != null) {
			imglist.add(product.getImg5());
		}
		for (int i = 0; i < imglist.size(); i++) {
			System.out.println(imglist.get(i));
		}
		
		
		model.addAttribute("product", product);
		model.addAttribute("imglist", imglist);
		return "/product/Productdetail";
	}

	// 상품검색 결과창으로 이동
	@GetMapping("/search")
	public String search(Criteria cri, Model model) {
		
		//현재페이지, 검색키워드가 들어간 cri를 model에 저장
		//System.out.println("controller에서 cri: " + cri);
		model.addAttribute("cri",cri);

		//비어있는 categoryVO만들기, 쿼리에서 필요
		CategoryVO  cate = new CategoryVO();
		
		// 검색결과 상품리스트를 model에 저장
		List<ProductVO> list = service.getList(cri, cate);
		model.addAttribute("list", list);
		
		// 페이징 처리를 위해 총상품 개수와 pageDTO를 model로 넘김
		int total = service.getTotal(cri, cate);
		//System.out.println("검색결과: "+total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("searchTotal", total);

		return "/product/SearchResult";
	}

}
