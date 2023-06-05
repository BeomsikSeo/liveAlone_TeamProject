package com.multi.liveAlone.share.chatRoomShare;

public class ChatRoomMessageJoinVO {
	private int roomNo;
	private int bbsNo;
	private String chatRequestor;
	private String chatReceiver;
	private int chatCode;
	private int messageNo;
	private String sender;
	private String content;
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getBbsNo() {
		return bbsNo;
	}
	public void setBbsNo(int bbsNo) {
		this.bbsNo = bbsNo;
	}
	public String getChatRequestor() {
		return chatRequestor;
	}
	public void setChatRequestor(String chatRequestor) {
		this.chatRequestor = chatRequestor;
	}
	public String getChatReceiver() {
		return chatReceiver;
	}
	public void setChatReceiver(String chatReceiver) {
		this.chatReceiver = chatReceiver;
	}
	public int getChatCode() {
		return chatCode;
	}
	public void setChatCode(int chatCode) {
		this.chatCode = chatCode;
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
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
	@Override
	public String toString() {
		return "ChatRoomMessageJoinVO [roomNo=" + roomNo + ", bbsNo=" + bbsNo + ", chatRequestor=" + chatRequestor
				+ ", chatReceiver=" + chatReceiver + ", chatCode=" + chatCode + ", messageNo=" + messageNo + ", sender="
				+ sender + ", content=" + content + "]";
	}
	
	
}
