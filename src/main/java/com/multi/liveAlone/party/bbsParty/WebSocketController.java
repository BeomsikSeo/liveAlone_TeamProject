package com.multi.liveAlone.party.bbsParty;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebSocketController {
	@Autowired
	BbsPartyDAO dao;

	@MessageMapping("/chat/{roomId}") // 채팅 내용 받을 때 사용하는 주소
	@SendTo("/topic/messages/{roomId}") // 가입한 주소 브라우저에 return message를 json으로 변환해서 보내줌
	public OutputMessage send(Message message, @DestinationVariable("roomId") int roomId) {

		System.out.println("받은 데이터>>" + message);
		OutputMessage out = new OutputMessage();
		out.setFrom(message.getFrom());
		out.setText(message.getText());
		Date date = new Date();
		out.setTime(date.getHours() + ":" + date.getMinutes());

		
		ChatPartyVO vo = new ChatPartyVO(); 
		vo.setMember_id(message.getFrom());
		vo.setChat_log(message.getText()); 
		vo.setPartyBbs_num(roomId);
		vo.setChat_time(date.getHours() + ":" + date.getMinutes()); 
		dao.insert3(vo);
		 

		return out;
	}
}
