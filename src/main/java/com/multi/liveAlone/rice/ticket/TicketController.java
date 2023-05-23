package com.multi.liveAlone.rice.ticket;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("rice/ticket")
public class TicketController {
	
	@Autowired
	TicketDAO ticketDAO;
	
	/*
	 * <<	티켓 로직	>>
	 * 식권 티켓을 결제함 (생성 ) Bug
	 * 식권 티켓을 전체 조회	Clear
	 * 식권 티켓을 상세 조회	80%
	 * 식권 티켓을 사용		0
	 * 
	 * 식권 티켓을 환불		??
	 */
	
	// 유저의 전체 티켓 목록을 가지고 옵니다.
	@RequestMapping("userTicket")
	public void userTicket(HttpSession session, Model model) {
		// 임의의 세션 데이터 설정
		session.setAttribute("memberID", "userA");
		
	}
	
	
	// 사용자가 지정한 티켓의 상세 정보를 가지고옵니다.
	@RequestMapping("userTicketOne")
	public void userTicketOne(int ticket_ID) {
	}
	
	
	// 티켓 페이지의 티켓 정보를 가지고 옵니다.
	// 시간의 내림차순으로 정리해 가장 최근에 발행한 것이 맨 위로 올라오도록 합니다.
	@RequestMapping("userTicketAjax")
	public void userTicketAjax(Model model,int pageNo) {
		TicketVOInfo page = new TicketVOInfo(pageNo);
		
		List<TicketVOPage> ticketList = ticketDAO.selectTicketPage(page);
		System.out.println(ticketList.size());
		// 1 Page = 1 ~ 5
		// 2 Page = 6 ~ 10
		
		model.addAttribute("ticketList",ticketList);
	}
}
