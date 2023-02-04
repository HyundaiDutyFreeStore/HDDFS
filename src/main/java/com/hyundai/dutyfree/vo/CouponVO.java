package com.hyundai.dutyfree.vo;

import java.sql.Date;

import lombok.Data;
/**
 * CouponVO
 * 
 * @author 박진수
 * @since 01.26
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.26    박진수                         최초 생성
 *        </pre>
 */
@Data
public class CouponVO {
	private String cid;
	private String mid;
	private Date cexpirationdate;
	private String eid;
	private String cenabled;
	private String oid;
	private EventVO event;
}
