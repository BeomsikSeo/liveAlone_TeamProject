package com.multi.liveAlone.rice.order;

import java.util.Date;

import lombok.Data;
 
@Data
public class KakaoPayReadyVO {
    
    //response
    private String tid;
    private String partner_order_id;
    private String next_redirect_app_url;
    private String next_redirect_mobile_url;
    private String next_redirect_pc_url;
    private String android_app_scheme;
    private String ios_app_scheme;
    private Date created_at;
    
	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public String getNext_redirect_app_url() {
		return next_redirect_app_url;
	}


	public void setNext_redirect_app_url(String next_redirect_app_url) {
		this.next_redirect_app_url = next_redirect_app_url;
	}

	public String getNext_redirect_mobile_url() {
		return next_redirect_mobile_url;
	}

	public void setNext_redirect_mobile_url(String next_redirect_mobile_url) {
		this.next_redirect_mobile_url = next_redirect_mobile_url;
	}

	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}

	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "KakaoPayReadyVO [tid=" + tid + ", partner_order_id=" + partner_order_id + ", next_redirect_app_url="
				+ next_redirect_app_url + ", next_redirect_mobile_url=" + next_redirect_mobile_url
				+ ", next_redirect_pc_url=" + next_redirect_pc_url + ", created_at=" + created_at + "]";
	}
    
    
    
}