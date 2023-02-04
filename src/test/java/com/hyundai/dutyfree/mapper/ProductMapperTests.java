package com.hyundai.dutyfree.mapper;


import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.dutyfree.vo.CategoryVO;
import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.ProductVO;

import lombok.extern.log4j.Log4j;

/**
 * ProductMapperTests
 * 
 * @author 김가희
 * @since 01.11
 * 
 * <pre>
 * 수정일                 수정자                                  수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.11     김가희                                  최초 생성
 * </pre>
 */
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml"})

public class ProductMapperTests {

	@Autowired
	private ProductMapper mapper;
	
	private String oid = "OR20230122203318";
	
	//상품 목록 조회 테스트
	@Test
	public void getListTest() {
		Criteria cri = new Criteria();
		CategoryVO cate = new CategoryVO("스킨케어", "", "");
		HashMap<String,Object> listMap = new HashMap<>();
		listMap.put("cri", cri);
		listMap.put("cate",cate);
		List<ProductVO> list = mapper.getList(listMap);
		list.forEach( i -> log.info(i));
	}
	
	
	//상품 총 개수 조회 테스트
	@Test
	public void getTotalTest() {
		Criteria cri = new Criteria();
		CategoryVO cate = new CategoryVO("스킨케어", "", "");
		HashMap<String,Object> listMap = new HashMap<>();
		listMap.put("cri", cri);
		listMap.put("cate",cate);
		int cnt = mapper.getTotal(listMap);
		log.info("상품총개수: "+cnt);
	}
	
	//대분류에 따른 중분류 목록  조회 테스트
	@Test
	public void getMedCategoryTest() {
		String clarge = "스킨케어";
		List<String> medList = mapper.getMedCategory(clarge);
		medList.forEach(i->log.info(i));
	}
	
	//중분류에 따른 소분류 목록 조회 테스트
	@Test
	public void getSmallCategoryTest() {
		String cmedium = "마스크팩";
		List<String> smallList = mapper.getSmallCategory(cmedium);
		smallList.forEach(i->log.info(i));
	}
	
	//상품상세 조회 테스트
	@Test
	public void productDetailTest() {
		String pcode = "563811207664";
		ProductVO vo = mapper.productdetail(pcode);
		log.info(vo);
	}
	
}
