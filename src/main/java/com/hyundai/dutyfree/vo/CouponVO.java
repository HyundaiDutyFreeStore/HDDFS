package com.hyundai.dutyfree.vo;

import java.sql.Date;

import lombok.Data;

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
