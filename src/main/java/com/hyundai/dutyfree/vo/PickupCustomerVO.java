package com.hyundai.dutyfree.vo;

import lombok.Data;

/**
 * PickupCustomerVO
 *
 * @author 김민규
 * @since 02.02
 *
 *  
 * 수정일                 수정자                          수정내용
 * ----------  ---------------      ---------------------------
 * 2023.02.02	   김민규			 	    최초생성
 *     
 */



@Data
/* 금일 인도중 상태인 고객의 수를 시간별로 보여주는 기능을 위한 VO */
public class PickupCustomerVO {
	/* 시간별 인원수 */
	private int count;
	/* 시간 */
	private int hours;
}
