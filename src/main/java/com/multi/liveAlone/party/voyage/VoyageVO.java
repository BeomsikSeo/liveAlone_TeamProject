package com.multi.liveAlone.party.voyage;

public class VoyageVO {
	private String name;
	private String region;
	private String longi;
	private String lat;
	private String tag1;
	private String tag2;
	private String tag3;
	private String info;
	private String member_id;
	private String selection;
	private String pic;
	private String voyageaddress;
	
	
	
	public String getVoyageaddress() {
		return voyageaddress;
	}
	public void setVoyageaddress(String voyageaddress) {
		this.voyageaddress = voyageaddress;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getSelection() {
		return selection;
	}
	public void setSelection(String selection) {
		this.selection = selection;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	@Override
	public String toString() {
		return "VoyageVO [name=" + name + ", region=" + region + ", longi=" + longi + ", lat=" + lat + ", tag1=" + tag1
				+ ", tag2=" + tag2 + ", tag3=" + tag3 + ", info=" + info + ", member_id=" + member_id + ", selection="
				+ selection + ", pic=" + pic + ", voyageaddress=" + voyageaddress + "]";
	}
	
}
