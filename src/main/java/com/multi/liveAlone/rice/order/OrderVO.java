package com.multi.liveAlone.rice.order;

public class OrderVO {
	private int order_ID;	
	private int ticket_ID;		
	
	private String order_fName;
	private int order_fCount;
	private int order_fPrice;
	
	public int getOrder_ID() {
		return order_ID;
	}
	public void setOrder_ID(int order_ID) {
		this.order_ID = order_ID;
	}
	public int getTicket_ID() {
		return ticket_ID;
	}
	public void setTicket_ID(int ticket_ID) {
		this.ticket_ID = ticket_ID;
	}
	public String getOrder_fName() {
		return order_fName;
	}
	public void setOrder_fName(String order_fName) {
		this.order_fName = order_fName;
	}
	public int getOrder_fCount() {
		return order_fCount;
	}
	public void setOrder_fCount(int order_fCount) {
		this.order_fCount = order_fCount;
	}
	public int getOrder_fPrice() {
		return order_fPrice;
	}
	public void setOrder_fPrice(int order_fPrice) {
		this.order_fPrice = order_fPrice;
	}
	
	public String toString() {
		return "OrderVO [order_ID=" + order_ID + ", ticket_ID=" + ticket_ID + ", order_fName=" + order_fName
				+ ", order_fCount=" + order_fCount + ", order_fPrice=" + order_fPrice + "]";
	}
	
	
}
