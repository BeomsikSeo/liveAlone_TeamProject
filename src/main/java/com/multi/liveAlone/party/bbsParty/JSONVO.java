package com.multi.liveAlone.party.bbsParty;

public class JSONVO {

	private String url;
	private String responseCode;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getResponseCode() {
		return responseCode;
	}
	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}
	@Override
	public String toString() {
		return "JSONVO [url=" + url + ", responseCode=" + responseCode + "]";
	}
	
	
}
