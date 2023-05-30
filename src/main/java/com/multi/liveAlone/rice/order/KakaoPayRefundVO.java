package com.multi.liveAlone.rice.order;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayRefundVO {
	
	// response
	private String aid;		//	
	private String tid;		//
	private String cid;		//
	private String status;	//
	private String partner_order_id;	//
	private String partner_user_id;		//
	private String payment_method_type;	//
	private KakaoPayAmount amount;				//
	private ApprovedCancelAmount approved_cancel_amount;	//
	private CanceledAmount canceled_amount;				//
	private CancelAvailableAmount cancel_available_amount;	//
	private String item_name;	//
	private String item_code;	//
	private Integer quantity;	//
	private Date created_at;
	private Date approved_at;
	private Date canceled_at;
	private String payload;
}
