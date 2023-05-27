package com.multi.liveAlone.rice.ticket;

public class TicketVOInfo {
	private int start_ticketVO;
	private int end_ticketVO;
	private int pageSize = 5;

	private int pageNo;
	private String userID;
	
	// 생성자
	public TicketVOInfo(int pageNo,String memberID) {
		this.userID = memberID;
		this.pageNo = pageNo;
		start_ticketVO = 1 + ((this.pageNo-1) * pageSize);
		end_ticketVO = 5 + ((this.pageNo-1) * pageSize);
	}

	public int getStart_ticketVO() {
		return start_ticketVO;
	}

	public void setStart_ticketVO(int start_ticketVO) {
		this.start_ticketVO = start_ticketVO;
	}

	public int getEnd_ticketVO() {
		return end_ticketVO;
	}

	public void setEnd_ticketVO(int end_ticketVO) {
		this.end_ticketVO = end_ticketVO;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	@Override
	public String toString() {
		return "TicketVOInfo [start_ticketVO=" + start_ticketVO + ", end_ticketVO=" + end_ticketVO + ", pageSize="
				+ pageSize + ", pageNo=" + pageNo + ", userID=" + userID + "]";
	}
	
	
	
	
}
