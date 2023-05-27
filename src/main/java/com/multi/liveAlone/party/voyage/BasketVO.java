package com.multi.liveAlone.party.voyage;

public class BasketVO {
	private String member_id;
    private String recommend1;
    private String recommend2;
    private String recommend3;
    private String recommend4;
    private String recommend5;
    private String lat;
    private String longi;
	@Override
	public String toString() {
		return "BasketVO [member_id=" + member_id + ", recommend1=" + recommend1 + ", recommend2=" + recommend2
				+ ", recommend3=" + recommend3 + ", recommend4=" + recommend4 + ", recommend5=" + recommend5 + ", lat="
				+ lat + ", longi=" + longi + "]";
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getRecommend1() {
		return recommend1;
	}
	public void setRecommend1(String recommend1) {
		this.recommend1 = recommend1;
	}
	public String getRecommend2() {
		return recommend2;
	}
	public void setRecommend2(String recommend2) {
		this.recommend2 = recommend2;
	}
	public String getRecommend3() {
		return recommend3;
	}
	public void setRecommend3(String recommend3) {
		this.recommend3 = recommend3;
	}
	public String getRecommend4() {
		return recommend4;
	}
	public void setRecommend4(String recommend4) {
		this.recommend4 = recommend4;
	}
	public String getRecommend5() {
		return recommend5;
	}
	public void setRecommend5(String recommend5) {
		this.recommend5 = recommend5;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLongi() {
		return longi;
	}
	public void setLongi(String longi) {
		this.longi = longi;
	}
}
