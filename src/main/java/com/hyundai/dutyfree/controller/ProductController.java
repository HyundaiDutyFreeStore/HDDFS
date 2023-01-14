package com.hyundai.dutyfree.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.hyundai.dutyfree.service.ProductService;
import com.hyundai.dutyfree.vo.CategoryVO;
import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.PageDTO;
import com.hyundai.dutyfree.vo.ProductVO;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;

	@GetMapping("/list")
	public String list(Criteria cri, Model model, @RequestParam("clarge") String clarge,
			@RequestParam("cmedium") String cmedium, @RequestParam("csmall") String csmall,
			@RequestParam("order") String order) {

		// 선택한 카테고리 model에 저장
		CategoryVO category = new CategoryVO(clarge, cmedium, csmall);
		model.addAttribute("category", category);

		// 정렬지정안됬으면 베스트순으로 지정
		if (order.equals(""))
			order = "베스트순";
		model.addAttribute("order", order);

		// 카테고리 별 상품리스트를 model에 저장
		List<ProductVO> list = service.getList(cri, clarge, cmedium, csmall, order);
		model.addAttribute("list", list);

		// selectBox를 위해서 중분류목록, 소분류목록 저장
		List<String> cateMedList = service.getMedCategory(clarge);
		model.addAttribute("cateMedList", cateMedList);
		List<String> cateSmallList = service.getSmallCategory(cmedium);
		model.addAttribute("cateSmallList", cateSmallList);

		// 하위카테고리 목록 받아오기(대분류->중분류, 중분류->소분류, 소분류->소분류) => 표를 위해서
		List<String> cateList = null;
		int cateCnt = 0;
		if (cmedium.contentEquals("")) {
			cateCnt = service.CategoryCnt(clarge);
			cateList = service.getMedCategory(clarge);
		} else {
			cateCnt = service.CategoryCnt(cmedium);
			cateList = service.getSmallCategory(cmedium);
		}
		// 하위카테고리수, 하위카테고리 리스트 보내기
		model.addAttribute("cateCnt", cateCnt);
		model.addAttribute("cateList", cateList);

		// 페이징 처리를 위해 총상품 개수와 pageDTO를 model로 넘김
		int total = service.getTotal(clarge, cmedium, csmall, "");
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("totalProducts", total);

		return "product/ProductList";
	}
	
	@ResponseBody
	@GetMapping(value = "/filterPaging", produces = "application/json; charset=UTF-8")
	public String filterPaging(Criteria cri,int total) {
		System.out.println("filterPaging controller");
		System.out.println("cri: "+cri);
		PageDTO pd = new PageDTO(cri, total);
		System.out.println("paging pageDTO: "+pd);
		//JSONObject jsonObj = new JSONObject();
		JSONObject obj = new JSONObject(pd);
		//jsonObj.put("pageMaker", pd);
		String json = obj.toString();
		return json;
	}
			

	@ResponseBody
	@GetMapping(value = "/filter", produces = "application/json; charset=UTF-8")
	public String filterList(Criteria cri, Model model, @RequestParam("clarge") String clarge,
			@RequestParam("cmedium") String cmedium, @RequestParam("csmall") String csmall) {
		System.out.println("filter에 들어옴");
		
		CategoryVO cate = new CategoryVO(clarge, cmedium, csmall);
		System.out.println(cate);
		System.out.println("controller에서 cri값: "+cri);
		
		JSONObject jsonObj = new JSONObject();
		
		//정렬
		jsonObj.put("order", cri.getOrder());
		
		//카테고리,정렬,필터에 맞춘 상품개수
		int total = service.getTotal2(cri, cate);
		System.out.println("controller에서 총개수: "+total);
		jsonObj.put("total", total);
		
		//카테고리,정렬,필터에 맞춘 상품목록 받아오기
		List<ProductVO> list = service.getFilterList(cri, cate);

		JSONArray jarr = new JSONArray();
		for(ProductVO vo : list) {
			JSONObject obj = new JSONObject(vo);
			jarr.put(obj);
		}
		
		jsonObj.put("products", jarr);
		String json = jsonObj.toString();
		return json;

		/*
		 * // 선택한 카테고리 model에 저장 CategoryVO category = new CategoryVO(clarge, cmedium,
		 * csmall); model.addAttribute("category", category);
		 * 
		 * // 정렬지정안됬으면 베스트순으로 지정 if (order.equals("")) order = "베스트순";
		 * model.addAttribute("order", order);
		 * 
		 * // 카테고리 별 상품리스트를 model에 저장 List<ProductVO> list = service.getFilterList(cri,
		 * clarge, cmedium, csmall, order, "최신순");
		 * 
		 * for(ProductVO vo : list) { System.out.println(vo); }
		 * 
		 * model.addAttribute("list", list);
		 * 
		 * // selectBox를 위해서 중분류목록, 소분류목록 저장 List<String> cateMedList =
		 * service.getMedCategory(clarge); model.addAttribute("cateMedList",
		 * cateMedList); List<String> cateSmallList = service.getSmallCategory(cmedium);
		 * model.addAttribute("cateSmallList", cateSmallList);
		 * 
		 * // 하위카테고리 목록 받아오기(대분류->중분류, 중분류->소분류, 소분류->소분류) => 표를 위해서
		 * List<String>cateList = null; int cateCnt = 0; if (cmedium.contentEquals(""))
		 * { cateCnt = service.CategoryCnt(clarge); cateList =
		 * service.getMedCategory(clarge); } else { cateCnt =
		 * service.CategoryCnt(cmedium); cateList = service.getSmallCategory(cmedium); }
		 * // 하위카테고리수, 하위카테고리 리스트 보내기 model.addAttribute("cateCnt", cateCnt);
		 * model.addAttribute("cateList", cateList);
		 * 
		 * // 페이징 처리를 위해 총상품 개수와 pageDTO를 model로 넘김 int total = service.getTotal(clarge,
		 * cmedium, csmall,"최신순"); model.addAttribute("pageMaker", new PageDTO(cri,
		 * total)); model.addAttribute("totalProducts", total);
		 * model.addAttribute("filter","최신순");
		 * 
		 * for (String s : filters) { System.out.println("filter: " + s); }
		 */
		// return "product/ProductList";
	}

	@GetMapping("/listOrder")
	public String listOrder(Criteria cri, Model model, @RequestParam("clarge") String clarge,
			@RequestParam("cmedium") String cmedium, @RequestParam("csmall") String csmall,
			@RequestParam("order") String order) {
		/*
		 * // 카테고리 별 상품리스트를 model에 저장 List<ProductVO> list = service.getList(cri,clarge,
		 * cmedium, csmall); List<String> cateList = null; int cateCnt = 0; if
		 * (cmedium.contentEquals("")) { System.out.println("medium없음"); cateCnt =
		 * service.CategoryCnt(clarge); cateList = service.getMedCategory(clarge); }
		 * else { System.out.println("small없음"); cateList =
		 * service.getSmallCategory(cmedium); }
		 * 
		 * //페이징 처리를 위해 총상품 개수와 pageDTO를 model로 넘김 int total = service.getTotal(clarge,
		 * cmedium, csmall); model.addAttribute("pageMaker", new PageDTO(cri, total));
		 * model.addAttribute("totalProducts", total);
		 * 
		 * CategoryVO category = new CategoryVO(clarge, cmedium, csmall);
		 * model.addAttribute("category", category);
		 * 
		 * model.addAttribute("cateCnt", cateCnt); model.addAttribute("cateList",
		 * cateList); model.addAttribute("list", list);
		 */
		System.out.println("listOrder컨트롤러");
		System.out.println("clarge: " + clarge + "cmedium: " + cmedium + "csmall: " + csmall + "order: " + order);
		return "product/ProductList";
	}

	/*
	 * @GetMapping("/ajax_prodList") public String ajaxProdList(HttpServletRequest
	 * request, HttpSession session) { System.out.println("ajax controller들어옴");
	 * //한페이지에 상품을 몇개씩 표시할 것인지 final int PAGE_ROW_COUNT = 40;
	 * 
	 * //보여줄 페이지번호 int pageNum = 1; //파라미터로 넘어온 페이지번호 String strPageNum =
	 * request.getParameter("pageNum"); if(strPageNum!=null) { pageNum =
	 * Integer.parseInt(strPageNum); }
	 * 
	 * //보여줄 상품번호의 시작 int startRowNum = 0 + (pageNum - 1) * PAGE_ROW_COUNT; //보여줄
	 * 상품번호의 끝 int endRowNum = pageNum * PAGE_ROW_COUNT;
	 * 
	 * int rowCount = PAGE_ROW_COUNT; PageDTO pto = new
	 * PageDTO(startRowNum,endRowNum,rowCount); List<ProductVO> list =
	 * service.getAjaxList(pto);
	 * 
	 * request.setAttribute("list", list); return "product/ajax_page"; }
	 */

}
