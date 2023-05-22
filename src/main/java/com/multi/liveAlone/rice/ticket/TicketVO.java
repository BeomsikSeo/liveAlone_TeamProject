package com.multi.liveAlone.rice.ticket;

public class TicketVO {

	private int ticket_ID;
	private String ticket_userID;
	private int ticket_storeID;
	private String ticket_start;
	private String ticket_end;
	private int ticket_price;
	private int ticket_usedMileage;
	private int ticket_use;
	public int getTicket_ID() {
		return ticket_ID;
	}
	public void setTicket_ID(int ticket_ID) {
		this.ticket_ID = ticket_ID;
	}
	public String getTicket_userID() {
		return ticket_userID;
	}
	public void setTicket_userID(String ticket_userID) {
		this.ticket_userID = ticket_userID;
	}
	public int getTicket_storeID() {
		return ticket_storeID;
	}
	public void setTicket_storeID(int ticket_storeID) {
		this.ticket_storeID = ticket_storeID;
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
	public int getTicket_use() {
		return ticket_use;
	}
	public void setTicket_use(int ticket_use) {
		this.ticket_use = ticket_use;
	}
	public int getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}
	public int getTicket_usedMileage() {
		return ticket_usedMileage;
	}
	public void setTicket_usedMileage(int ticket_usedMileage) {
		this.ticket_usedMileage = ticket_usedMileage;
	}
	
	
	@Override
	public String toString() {
		return "TicketVO [ticket_ID=" + ticket_ID + ", ticket_userID=" + ticket_userID + ", ticket_storeID="
				+ ticket_storeID + ", ticket_start=" + ticket_start + ", ticket_end=" + ticket_end + ", ticket_price="
				+ ticket_price + ", ticket_usedMileage=" + ticket_usedMileage + ", ticket_use=" + ticket_use + "]";
	}
	
	
	
	
	
	
	
}
