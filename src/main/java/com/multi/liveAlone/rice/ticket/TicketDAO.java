package com.multi.liveAlone.rice.ticket;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class TicketDAO {

	@Autowired
	SqlSessionTemplate my;
	
	// 결제 성공 티켓을 발행합니다.
	public void insertTicket(TicketVO ticket) {
		my.insert("ticket.insertTicket", ticket);
	}
	
	// 티켓 정보를 하나 가지고 옵니다.
	public TicketVO selectTicketOne(TicketVO ticket) {
		TicketVO resultTicketVO = my.selectOne("ticket.selectTicketOne", ticket);
		return resultTicketVO;
	}

	// 사용자의 티켓 리스트를 가지고 옵니다.
	public List<TicketVO> selectTicketAll(String userID) {
		List<TicketVO> resultTicketVOList = my.selectList("ticket.selectTicketAll", userID);
		
		return resultTicketVOList;
	}

}
