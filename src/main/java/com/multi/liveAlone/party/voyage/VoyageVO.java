package com.multi.liveAlone.party.voyage;

public class VoyageVO {
	private String name;
	private String region;
	private String longi;
	private String lat;
	private String tag1;
	private String tag2;
	private String tag3;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getLongi() {
		return longi;
	}
	public void setLongi(String longi) {
		this.longi = longi;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getTag2() {
		return tag2;
	}
	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}
	public String getTag3() {
		return tag3;
	}
	public void setTag3(String tag3) {
		this.tag3 = tag3;
	}
	@Override
	public String toString() {
		return "VoyageVO [name=" + name + ", region=" + region + ", longi=" + longi + ", lat=" + lat + ", tag1=" + tag1
				+ ", tag2=" + tag2 + ", tag3=" + tag3 + "]";
	}
	

}
