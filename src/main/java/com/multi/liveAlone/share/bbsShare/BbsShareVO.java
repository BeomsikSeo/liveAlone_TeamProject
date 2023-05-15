package com.multi.liveAlone.share.bbsShare;

import java.util.Date;

public class BbsShareVO {
	private int bbsShare;
	private boolean bbsShareRequest;
	private String bbsShareTitle;
	private String bbsShareContent;
	private String bbsShareWriter;
	private Date bbsShareDate;
	private String bbsShareCategory;
	private int bbsShareView;
	private int bbsShareInterest;
	private boolean bbsShareSuccess;
	private String bbsShareImage;
	public int getBbsShare() {
		return bbsShare;
	}
	public void setBbsShare(int bbsShare) {
		this.bbsShare = bbsShare;
	}
	public boolean isBbsShareRequest() {
		return bbsShareRequest;
	}
	public void setBbsShareRequest(boolean bbsShareRequest) {
		this.bbsShareRequest = bbsShareRequest;
	}
	public String getBbsShareTitle() {
		return bbsShareTitle;
	}
	public void setBbsShareTitle(String bbsShareTitle) {
		this.bbsShareTitle = bbsShareTitle;
	}
	public String getBbsShareContent() {
		return bbsShareContent;
	}
	public void setBbsShareContent(String bbsShareContent) {
		this.bbsShareContent = bbsShareContent;
	}
	public String getBbsShareWriter() {
		return bbsShareWriter;
	}
	public void setBbsShareWriter(String bbsShareWriter) {
		this.bbsShareWriter = bbsShareWriter;
	}
	public Date getBbsShareDate() {
		return bbsShareDate;
	}
	public void setBbsShareDate(Date bbsShareDate) {
		this.bbsShareDate = bbsShareDate;
	}
	public String getBbsShareCategory() {
		return bbsShareCategory;
	}
	public void setBbsShareCategory(String bbsShareCategory) {
		this.bbsShareCategory = bbsShareCategory;
	}
	public int getBbsShareView() {
		return bbsShareView;
	}
	public void setBbsShareView(int bbsShareView) {
		this.bbsShareView = bbsShareView;
	}
	public int getBbsShareInterest() {
		return bbsShareInterest;
	}
	public void setBbsShareInterest(int bbsShareInterest) {
		this.bbsShareInterest = bbsShareInterest;
	}
	public boolean isBbsShareSuccess() {
		return bbsShareSuccess;
	}
	public void setBbsShareSuccess(boolean bbsShareSuccess) {
		this.bbsShareSuccess = bbsShareSuccess;
	}
	public String getBbsShareImage() {
		return bbsShareImage;
	}
	public void setBbsShareImage(String bbsShareImage) {
		this.bbsShareImage = bbsShareImage;
	}
	
	@Override
	public String toString() {
		return "BbsShareVO [bbsShare=" + bbsShare + ", bbsShareRequest=" + bbsShareRequest + ", bbsShareTitle="
				+ bbsShareTitle + ", bbsShareContent=" + bbsShareContent + ", bbsShareWriter=" + bbsShareWriter
				+ ", bbsShareDate=" + bbsShareDate + ", bbsShareCategory=" + bbsShareCategory + ", bbsShareView="
				+ bbsShareView + ", bbsShareInterest=" + bbsShareInterest + ", bbsShareSuccess=" + bbsShareSuccess
				+ ", bbsShareImage=" + bbsShareImage + "]";
	}
	
	
	
}
