package com.multi.liveAlone.rice.ticket;

public class TicketVO {

	private String _id;
	private int ticket_id;
	private String ticket_userId;
	private int ticket_storeId;
	private String ticket_start;
	private String ticket_end;
	private String ticket_order;
	private int ticket_usePoint;
	private int ticket_possible;
	
	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}
	public int getTicket_id() {
		return ticket_id;
	}
	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}
	public String getTicket_userId() {
		return ticket_userId;
	}
	public void setTicket_userId(String ticket_userId) {
		this.ticket_userId = ticket_userId;
	}
	public int getTicket_storeId() {
		return ticket_storeId;
	}
	public void setTicket_storeId(int ticket_storeId) {
		this.ticket_storeId = ticket_storeId;
	}
	public String getTicket_start() {
		return ticket_start;
	}
	public void setTicket_start(String ticket_start) {
		this.ticket_start = ticket_start;
	}
	public String getTicket_end() {
		return ticket_end;
	}
	public void setTicket_end(String ticket_end) {
		this.ticket_end = ticket_end;
	}
	public String getTicket_order() {
		return ticket_order;
	}
	public void setTicket_order(String ticket_order) {
		this.ticket_order = ticket_order;
	}
	public int getTicket_usePoint() {
		return ticket_usePoint;
	}
	public void setTicket_usePoint(int ticket_usePoint) {
		this.ticket_usePoint = ticket_usePoint;
	}
	public int getTicket_possible() {
		return ticket_possible;
	}
	public void setTicket_possible(int ticket_possible) {
		this.ticket_possible = ticket_possible;
	}
	
	@Override
	public String toString() {
		return "TicketVO [_id=" + _id + ", ticket_id=" + ticket_id + ", ticket_userId=" + ticket_userId
				+ ", ticket_storeId=" + ticket_storeId + ", ticket_start=" + ticket_start + ", ticket_end=" + ticket_end
				+ ", ticket_order=" + ticket_order + ", ticket_usePoint=" + ticket_usePoint + ", ticket_possible="
				+ ticket_possible + "]";
	}
	
}
