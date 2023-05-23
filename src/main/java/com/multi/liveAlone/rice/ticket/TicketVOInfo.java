package com.multi.liveAlone.rice.ticket;

public class TicketVOInfo {
	private int start_ticketVO;
	private int end_ticketVO;
	private int pageNo;
	private int pageSize = 5;
	
	// 생성자
	public TicketVOInfo(int pageNo) {
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

	@Override
	public String toString() {
		return "TicketVOPage [start_ticketVO=" + start_ticketVO + ", end_ticketVO=" + end_ticketVO + ", pageNo="
				+ pageNo + ", pageSize=" + pageSize + "]";
	}
	
}
