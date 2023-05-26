package com.multi.liveAlone.party.bbsParty;

import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebSocketController {
	

	@MessageMapping("/chat") //채팅 내용 받을 때 사용하는 주소
	@SendTo("/topic/messages") //가입한 주소 브라우저에 return message를 json으로 변환해서 보내줌
	public OutputMessage send(Message message) {
		System.out.println("받은 데이터>>" + message);
		OutputMessage out = new OutputMessage();
		out.setFrom(message.getFrom());
		out.setText(message.getText());
		Date date = new Date();
		out.setTime(date.getHours() + ":" + date.getMinutes());
		
		return out;	
	}
}
