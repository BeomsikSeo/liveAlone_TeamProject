package com.multi.liveAlone.rice.sReview;

public class SReviewVO {

	private int sReview_id;
	private String sReview_title;
	private String sReview_content;
	private double sReview_star;
	private String sReview_img;
	private String sReview_writer;
	private int store_no;
	
	public int getsReview_id() {
		return sReview_id;
	}
	public void setsReview_id(int sReview_id) {
		this.sReview_id = sReview_id;
	}
	public String getsReview_title() {
		return sReview_title;
	}
	public void setsReview_title(String sReview_title) {
		this.sReview_title = sReview_title;
	}
	public String getsReview_content() {
		return sReview_content;
	}
	public void setsReview_content(String sReview_content) {
		this.sReview_content = sReview_content;
	}
	public double getsReview_star() {
		return sReview_star;
	}
	public void setsReview_star(double sReview_star) {
		this.sReview_star = sReview_star;
	}
	public String getsReview_img() {
		return sReview_img;
	}
	public void setsReview_img(String sReview_img) {
		this.sReview_img = sReview_img;
	}
	public String getsReview_writer() {
		return sReview_writer;
	}
	public void setsReview_writer(String sReview_writer) {
		this.sReview_writer = sReview_writer;
	}
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	
	@Override
	public String toString() {
		return "SReviewVO [sReview_id=" + sReview_id + ", sReview_title=" + sReview_title + ", sReview_content="
				+ sReview_content + ", sReview_star=" + sReview_star + ", sReview_img=" + sReview_img
				+ ", sReview_writer=" + sReview_writer + ", store_no=" + store_no + "]";
	}
	
}
