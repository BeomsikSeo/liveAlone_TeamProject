package com.multi.liveAlone.share.messageShare;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocketMessageBroker
public class MessageShareConfig extends AbstractWebSocketMessageBrokerConfigurer{
	//채팅방 이름 설정
		@Override
		public void configureMessageBroker(MessageBrokerRegistry config) {
			// 구독 topic - 1:n / queue - 1:1
			config.enableSimpleBroker("/topic");  // 채팅방 이름 : topic으로 메시지 전달
			config.setApplicationDestinationPrefixes("/app"); // 클라이언트로부터 메시지를 받을 주소
		}
		
		@Override
		public void registerStompEndpoints(StompEndpointRegistry registry) {
			//chat : 소켓연결주소
			registry.addEndpoint("/chat/{roomId}"); //자바 소켓 통신 가능 
			registry.addEndpoint("/chat/{roomId}").withSockJS(); //자바 스크립트 소켓 통신 
		}
}
