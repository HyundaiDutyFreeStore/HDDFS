package com.hyundai.dutyfree.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyundai.dutyfree.service.ProductService;
import com.hyundai.dutyfree.vo.CategoryVO;
import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.PageDTO;
import com.hyundai.dutyfree.vo.ProductVO;

@Controller
public class ListController {
	@Autowired
	private ProductService service;

	@GetMapping("/list")
	public String list(Criteria cri,Model model, @RequestParam("clarge") String clarge, @RequestParam("cmedium") String cmedium,
			@RequestParam("csmall") String csmall,@RequestParam("order") String order) {
		if(order.equals("")) order="베스트순";
		// 카테고리 별 상품리스트를 model에 저장
		List<ProductVO> list = service.getList(cri,clarge, cmedium, csmall,order);
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
		
		//페이징 처리를 위해 총상품 개수와 pageDTO를 model로 넘김
        int total = service.getTotal(clarge, cmedium, csmall);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        model.addAttribute("totalProducts", total);
		
		CategoryVO category = new CategoryVO(clarge, cmedium, csmall);
		model.addAttribute("category", category);

		model.addAttribute("cateCnt", cateCnt);
		model.addAttribute("cateList", cateList);
		model.addAttribute("list", list);
		model.addAttribute("order",order);
		return "product/ProductList";
	}
	
	@GetMapping("/listOrder")
	public String listOrder(Criteria cri,Model model, @RequestParam("clarge") String clarge, @RequestParam("cmedium") String cmedium,
			@RequestParam("csmall") String csmall,@RequestParam("order") String order) {
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
		System.out.println("clarge: "+clarge+"cmedium: "+cmedium+"csmall: "+csmall+"order: "+order);
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
