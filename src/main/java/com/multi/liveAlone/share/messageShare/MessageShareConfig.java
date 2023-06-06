package com.multi.liveAlone.share.messageShare;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.core.annotation.Order;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

import com.multi.liveAlone.party.bbsParty.WebSocketConfig;


@Configuration
@ComponentScan(excludeFilters = @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = WebSocketConfig.class))
@EnableWebSocketMessageBroker

public class MessageShareConfig extends AbstractWebSocketMessageBrokerConfigurer{
	//채팅방 이름 설정
		@Override
		public void configureMessageBroker(MessageBrokerRegistry config) {
			// 구독 topic - 1:n / queue - 1:1
			config.enableSimpleBroker("/topic", "/topic2");
		    config.setApplicationDestinationPrefixes("/app", "/app2");
		}
		@Override
		public void registerStompEndpoints(StompEndpointRegistry registry) {
			//chat : 소켓연결주소
			registry.addEndpoint("/chat/{roomId}", "/chat2")
            .withSockJS();
		}
}
