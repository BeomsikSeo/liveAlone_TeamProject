package com.multi.liveAlone.share.messageShare;

public class MessageShareVO {
	private int messageNo;
	private int roomId;
	private String sender;
	private String content;
	private String time;
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "MessageShareVO [messageNo=" + messageNo + ", roomId=" + roomId + ", sender=" + sender + ", content="
				+ content + ", time=" + time + "]";
	}
	
}
