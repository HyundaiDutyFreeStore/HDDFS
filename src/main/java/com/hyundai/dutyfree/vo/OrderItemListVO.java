package com.hyundai.dutyfree.vo;

import java.util.List;

import lombok.Data;
/**
 * OrderItemListVO
 * 
 * @author 박진수
 * @since 01.16
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.16    박진수                         최초 생성
 *        </pre>
 */
@Data
public class OrderItemListVO {
	private List<OrderItemVO> orderitem;
}
