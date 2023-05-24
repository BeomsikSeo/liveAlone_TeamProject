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
	
	
	
	
	// 티켓 정보 전체를 이용해 티켓 정보를 하나 가지고 옵니다.
	public TicketVO selectTicketOne(TicketVO ticket) {
		TicketVO resultTicketVO = my.selectOne("ticket.selectTicketOne-Ticket", ticket);
		return resultTicketVO;
	}
	
	// 티켓 아이디를 이용해 티켓 정보 하나를 가지고 옵니다.
	public TicketVO selectTicketOne(int ticket_ID) {
		return my.selectOne("ticket.selectTicketOne-ID",ticket_ID);
	}

	
	
	
	// 사용자의 티켓 리스트를 가지고 옵니다.
	public List<TicketVO> selectTicketAll(String userID) {
		List<TicketVO> resultTicketVOList = my.selectList("ticket.selectTicketAll", userID);
		
		return resultTicketVOList;
	}

	// 페이징 된 티켓의 정보를 가지고 옵니다.
	public List<TicketVOPage> selectTicketPage(TicketVOInfo page) {
		return my.selectList("ticket.selectTicketPage", page);
		
	}

	

	

}
