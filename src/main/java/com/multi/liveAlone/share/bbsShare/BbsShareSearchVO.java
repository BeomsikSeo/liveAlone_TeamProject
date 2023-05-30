package com.multi.liveAlone.share.bbsShare;

public class BbsShareSearchVO {
	private String keyword;
	private String pageno;
	private String address;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPageno() {
		return pageno;
	}

	public void setPageno(String pageno2) {
		this.pageno = pageno2;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "BbsShareSearchVO [keyword=" + keyword + ", pageno=" + pageno + ", address=" + address + "]";
	}

}
