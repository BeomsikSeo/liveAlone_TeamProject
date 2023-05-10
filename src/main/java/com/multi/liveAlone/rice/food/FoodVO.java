package com.multi.liveAlone.rice.food;

public class FoodVO {
	
	private int food_no;
	private String food_name;
	private int food_price;
	private String food_info;
	private String food_ingre;
	private String food_img;
	private int fCategory_no;
	private int store_no;
	
	public int getFood_no() {
		return food_no;
	}
	public void setFood_no(int food_no) {
		this.food_no = food_no;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public int getFood_price() {
		return food_price;
	}
	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}
	public String getFood_info() {
		return food_info;
	}
	public void setFood_info(String food_info) {
		this.food_info = food_info;
	}
	public String getFood_ingre() {
		return food_ingre;
	}
	public void setFood_ingre(String food_ingre) {
		this.food_ingre = food_ingre;
	}
	public String getFood_img() {
		return food_img;
	}
	public void setFood_img(String food_img) {
		this.food_img = food_img;
	}
	public int getfCategory_no() {
		return fCategory_no;
	}
	public void setfCategory_no(int fCategory_no) {
		this.fCategory_no = fCategory_no;
	}
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	
	@Override
	public String toString() {
		return "FoodVO [food_no=" + food_no + ", food_name=" + food_name + ", food_price=" + food_price + ", food_info="
				+ food_info + ", food_ingre=" + food_ingre + ", food_img=" + food_img + ", fCategory_no=" + fCategory_no
				+ ", store_no=" + store_no + "]";
	}
	
}
