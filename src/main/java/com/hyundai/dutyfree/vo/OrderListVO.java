package com.hyundai.dutyfree.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

/**
 * OrderListVO
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
public class OrderListVO {
	private String oid;
	private String mid;
	private Date odate;
	private int ohpoint;
	private String ostatus;
	private String odeptdate;
	private String oplnum;
	private String oelnum;
	private String oplace;
	private List<OrderItemVO> orderitemlist;
	private float ordertotalprice;
	private float ordertotaldisprice;
	private String opaymentkey;
}