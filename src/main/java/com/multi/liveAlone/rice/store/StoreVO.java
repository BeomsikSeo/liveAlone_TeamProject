package com.multi.liveAlone.rice.store;

public class StoreVO {

	private int store_no;
	private String store_name;
	private String store_addr;
	private String store_tel;
	private String store_info;
	private int store_single;
	private String store_img;
	private String store_day;
	private String store_open;
	private String store_closed;
	private int sCategory_no;
	
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_addr() {
		return store_addr;
	}
	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}
	public String getStore_tel() {
		return store_tel;
	}
	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
	}
	public String getStore_info() {
		return store_info;
	}
	public void setStore_info(String store_info) {
		this.store_info = store_info;
	}
	public int getStore_single() {
		return store_single;
	}
	public void setStore_single(int store_single) {
		this.store_single = store_single;
	}
	public String getStore_img() {
		return store_img;
	}
	public void setStore_img(String store_img) {
		this.store_img = store_img;
	}
	public String getStore_day() {
		return store_day;
	}
	public void setStore_day(String store_day) {
		this.store_day = store_day;
	}
	public String getStore_open() {
		return store_open;
	}
	public void setStore_open(String store_open) {
		this.store_open = store_open;
	}
	public String getStore_closed() {
		return store_closed;
	}
	public void setStore_closed(String store_closed) {
		this.store_closed = store_closed;
	}
	public int getsCategory_no() {
		return sCategory_no;
	}
	public void setsCategory_no(int sCategory_no) {
		this.sCategory_no = sCategory_no;
	}
	
	@Override
	public String toString() {
		return "StoreVO [store_no=" + store_no + ", store_name=" + store_name + ", store_addr=" + store_addr
				+ ", store_tel=" + store_tel + ", store_info=" + store_info + ", store_single=" + store_single
				+ ", store_img=" + store_img + ", store_day=" + store_day + ", store_open=" + store_open
				+ ", store_closed=" + store_closed + ", sCategory_no=" + sCategory_no + "]";
	}
	
}
