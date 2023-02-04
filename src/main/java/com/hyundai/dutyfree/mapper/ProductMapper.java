package com.hyundai.dutyfree.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.dutyfree.vo.Criteria;
import com.hyundai.dutyfree.vo.PageDTO;
import com.hyundai.dutyfree.vo.ProductVO;
/**
 * ProductMapper
 * 
 * @author 김가희
 * @since 01.11
 * 
 *        
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.11    김가희                        최초 생성
 * 2023.01.12    김가희                        페이징 처리 추가
 * 2023.01.14    김가희                        상품필터링 추가
 * 2023.01.15    김가희                        상품검색 추가
 * 2023.01.16 	  박진수			     싱품상세 추가
 *        
 */
public interface ProductMapper {
	
	//목록띄우기
	public List<ProductVO> getList(HashMap<String, Object> listMap);
	
	//조건에 맞는 총 상품개수
	public int getTotal(HashMap<String, Object> listMap);

	//해당 대분류의 중분류 가져오기
	public List<String> getMedCategory(String clarge);

	//해당 중분류의 소분류 가져오기
	public List<String> getSmallCategory(String cmedium);
	
	//상품디테일
	public ProductVO productdetail(String pcode);
	
	//관리자 상품목록
	public List<ProductVO> getList2();
	
	//관리자 상품총개수
	public int getTotal2();
	
	//관리자 상품삭제
    public void deleteProd(String pid);
    
    //관리자 상품수정
    public void updateProd(ProductVO prod);
}
