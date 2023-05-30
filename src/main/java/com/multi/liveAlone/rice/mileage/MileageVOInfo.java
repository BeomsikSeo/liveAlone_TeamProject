package com.multi.liveAlone.rice.mileage;

public class MileageVOInfo {
	private int start_mileageVO;
	private int end_mileageVO;
	private int pageSize = 5;

	private int pageNo;
	private String userID;
	
	// 생성자
	public MileageVOInfo(int pageNo,String memberID) {
		this.userID = memberID;
		this.pageNo = pageNo;
		start_mileageVO = 1 + ((this.pageNo-1) * pageSize);
		end_mileageVO = 5 + ((this.pageNo-1) * pageSize);
	}

	public int getStart_mileageVO() {
		return start_mileageVO;
	}

	public void setStart_mileageVO(int start_mileageVO) {
		this.start_mileageVO = start_mileageVO;
	}

	public int getEnd_mileageVO() {
		return end_mileageVO;
	}

	public void setEnd_mileageVO(int end_mileageVO) {
		this.end_mileageVO = end_mileageVO;
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
		return "MileageVOInfo [start_mileageVO=" + start_mileageVO + ", end_mileageVO=" + end_mileageVO + ", pageSize="
				+ pageSize + ", pageNo=" + pageNo + ", userID=" + userID + "]";
	}


	
	
	
}
