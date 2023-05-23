package com.multi.liveAlone.share.bbsShare;


public class BbsShareVO {
	private int bbsShareNo;
	private boolean bbsShareRequest;
	private String bbsShareTitle;
	private String bbsShareContent;
	private String bbsShareWriter;
	private String bbsShareDate;
	private String bbsShareCategory;
	private int bbsShareView;
	private int bbsShareInterest;
	private boolean bbsShareSuccess;
	private String bbsShareImage;
	public int getbbsShareNo() {
		return bbsShareNo;
	}
	public void setbbsShareNo(int bbsShareNo) {
		this.bbsShareNo = bbsShareNo;
	}
	public boolean isbbsShareRequest() {
		return bbsShareRequest;
	}
	public void setBbsShareRequest(boolean bbsShareRequest) {
		this.bbsShareRequest = bbsShareRequest;
	}
	public String getbbsShareTitle() {
		return bbsShareTitle;
	}
	public void setBbsShareTitle(String bbsShareTitle) {
		this.bbsShareTitle = bbsShareTitle;
	}
	public String getbbsShareContent() {
		return bbsShareContent;
	}
	public void setBbsShareContent(String bbsShareContent) {
		this.bbsShareContent = bbsShareContent;
	}
	public String getbbsShareWriter() {
		return bbsShareWriter;
	}
	public void setBbsShareWriter(String bbsShareWriter) {
		this.bbsShareWriter = bbsShareWriter;
	}
	public String getbbsShareDate() {
		return bbsShareDate;
	}
	public void setBbsShareDate(String bbsShareDate) {
		this.bbsShareDate = bbsShareDate;
	}
	public String getbbsShareCategory() {
		return bbsShareCategory;
	}
	public void setBbsShareCategory(String bbsShareCategory) {
		this.bbsShareCategory = bbsShareCategory;
	}
	public int getbbsShareView() {
		return bbsShareView;
	}
	public void setBbsShareView(int bbsShareView) {
		this.bbsShareView = bbsShareView;
	}
	public int getbbsShareInterest() {
		return bbsShareInterest;
	}
	public void setBbsShareInterest(int bbsShareInterest) {
		this.bbsShareInterest = bbsShareInterest;
	}
	public boolean isbbsShareSuccess() {
		return bbsShareSuccess;
	}
	public void setBbsShareSuccess(boolean bbsShareSuccess) {
		this.bbsShareSuccess = bbsShareSuccess;
	}
	public String getbbsShareImage() {
		return bbsShareImage;
	}
	public void setBbsShareImage(String bbsShareImage) {
		this.bbsShareImage = bbsShareImage;
	}
	@Override
	public String toString() {
		return "BbsShareVO [bbsShareNo=" + bbsShareNo + ", bbsShareRequest=" + bbsShareRequest + ", bbsShareTitle="
				+ bbsShareTitle + ", bbsShareContent=" + bbsShareContent + ", bbsShareWriter=" + bbsShareWriter
				+ ", bbsShareDate=" + bbsShareDate + ", bbsShareCategory=" + bbsShareCategory + ", bbsShareView="
				+ bbsShareView + ", bbsShareInterest=" + bbsShareInterest + ", bbsShareSuccess=" + bbsShareSuccess
				+ ", bbsShareImage=" + bbsShareImage + "]";
	}
	
	
	
}
