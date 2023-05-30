package com.multi.liveAlone.rice.mileage;

public class MileageVO {
	private int mileage_ID;				// 마일리지 고유 번호
	private String mileage_memberID;	// 누가 마일리지를 이용했는가
	private String mileage_when;		// 언제 마일리지를 이용했는가
	private String mileage_why;			// 왜 마일리지를 이용했는가
	private int mileage_what;			// 얼만큼 마일리지를 이용했나
	private String mileage_how;			// 어떻게 이용 되었는가
	
	public int getMileage_ID() {
		return mileage_ID;
	}
	public void setMileage_ID(int mileage_ID) {
		this.mileage_ID = mileage_ID;
	}
	public String getMileage_memberID() {
		return mileage_memberID;
	}
	public void setMileage_memberID(String mileage_memberID) {
		this.mileage_memberID = mileage_memberID;
	}
	public String getMileage_when() {
		return mileage_when;
	}
	public void setMileage_when(String mileage_when) {
		this.mileage_when = mileage_when;
	}
	public String getMileage_why() {
		return mileage_why;
	}
	public void setMileage_why(String mileage_why) {
		this.mileage_why = mileage_why;
	}
	public int getMileage_what() {
		return mileage_what;
	}
	public void setMileage_what(int mileage_what) {
		this.mileage_what = mileage_what;
	}
	public String getMileage_how() {
		return mileage_how;
	}
	public void setMileage_how(String mileage_how) {
		this.mileage_how = mileage_how;
	}
	@Override
	public String toString() {
		return "MileageVO [mileage_ID=" + mileage_ID + ", mileage_memberID=" + mileage_memberID + ", mileage_when="
				+ mileage_when + ", mileage_why=" + mileage_why + ", mileage_what=" + mileage_what + ", mileage_how="
				+ mileage_how + "]";
	}
	
	
}
