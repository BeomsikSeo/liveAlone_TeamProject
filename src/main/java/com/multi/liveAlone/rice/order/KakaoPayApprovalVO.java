package com.multi.liveAlone.rice.order;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayApprovalVO {
    
    //response
    private String aid, tid, cid, sid;			// 확인
    private String partner_order_id, partner_user_id, payment_method_type;	// 확인
    private KakaoPayAmount amount;				// 확인
    private KakaoPayCardInfo card_info;			// 카드 정보
    private String item_name, item_code, payload;	// 아이템 이름, 아이템 코드, 아이템
    private Integer quantity;
    private Date created_at, approved_at;
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getPayment_method_type() {
		return payment_method_type;
	}
	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}
	public KakaoPayAmount getAmount() {
		return amount;
	}
	public void setAmount(KakaoPayAmount amount) {
		this.amount = amount;
	}
	public KakaoPayCardInfo getCard_info() {
		return card_info;
	}
	public void setCard_info(KakaoPayCardInfo card_info) {
		this.card_info = card_info;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getPayload() {
		return payload;
	}
	public void setPayload(String payload) {
		this.payload = payload;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}
    
    
}
 