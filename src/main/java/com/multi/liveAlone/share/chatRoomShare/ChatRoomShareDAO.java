package com.multi.liveAlone.share.chatRoomShare;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.multi.liveAlone.share.messageShare.MessageShareVO;

@Component
public class ChatRoomShareDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(ChatRoomShareVO bag) {
		my.insert("chatroomshare.insert", bag);
		System.out.println("저장완료");
	}
	
	// 유저 채팅방 리스트
	public List<ChatRoomBbsJoinVO> userChatList(String nowSession){
		List<ChatRoomBbsJoinVO> list = my.selectList("chatroomshare.userChatList", nowSession);
		System.out.println("전체 채팅방 개수 : " + list.size());
		return list;
	}
	
	// 게시물 채팅방 리스트
	public List<ChatRoomShareVO> bbschatlist(int bbsNo){
		List<ChatRoomShareVO> list = my.selectList("chatroomshare.room", bbsNo);
		System.out.println("게시물 채팅방 개수 : " + list.size());
		return list;
	}
	
	public ChatRoomShareVO one(ChatRoomShareVO bag) {
		ChatRoomShareVO bag2 = my.selectOne("chatroomshare.one", bag);
		return bag2;
	}
	
	public ChatRoomShareVO one_roomNo(ChatRoomShareVO bag) {
		ChatRoomShareVO bag2 = my.selectOne("chatroomshare.one_roomNo", bag);
		return bag2;
	}
	
	// 채팅방 메시지 리스트
	public List<MessageShareVO> messageList(int roomNo){
		List<MessageShareVO> list = my.selectList("chatroomshare.message", roomNo);
		return list;
	}
	
	public void codeUpdate(ChatRoomShareVO bag) {
		my.update("chatroomshare.update", bag);
	}
}
