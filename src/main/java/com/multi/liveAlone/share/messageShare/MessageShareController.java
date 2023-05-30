package com.multi.liveAlone.share.messageShare;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.liveAlone.share.chatRoomShare.ChatRoomShareVO;

@Controller
public class MessageShareController {

	@Autowired
	MessageShareDAO dao;
	
	//ws프로토콜로 요청을 받음.
	@MessageMapping("/chat2/{roomNo}") // chat으로 요청을 받으면 아래 실행하라는 말 
	@SendTo("/topic/{roomNo}") // /share/message에 가입된 사람들 모두에게 return output;
	// @DestinationVariable String roomId 안해줘도 넘어오네..? -> 메소드에서 roomId안쓸거면 굳이 해줄 필요 없는듯
	// 알아서 roomId넘어와서 {roomId}에 들어가는 듯? 일단 패스
	public MessageShareVO send(MessageShareVO bag) {
		System.out.println("----------------");
		Date date = new Date();
		int hour = date.getHours();
		int min = date.getMinutes();
		String time = hour + ":" + min;
		
		bag.setTime(time);
		System.out.println(bag);
		dao.insert(bag);
		
		return bag;
	}
}
