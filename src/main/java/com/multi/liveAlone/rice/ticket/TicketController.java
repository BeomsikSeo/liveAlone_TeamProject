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
	 * 식권 티켓을 결제함 (생성 ) insert
	 * 식권 티켓을 전체 조회
	 * 식권 티켓을 상세 조회
	 * 식권 티켓을 사용
	 * 
	 * 식권 티켓을 환불
	 */
	
	@RequestMapping("userTicket")
	public void userTicket(HttpSession session, Model model) {
		/*
		 * // 테스트를 위해 사용자(유저)의 아이디를 임의로 설정 session.setAttribute("memberID", "userA");
		 * 
		 * // 로그인한 유저의 아이디를 가지고 옴 String memberID = (String)
		 * session.getAttribute("memberID");
		 * 
		 * // 해당 유저의 티켓리스트를 가지고 옴 List<TicketVO> ticketList =
		 * ticketDAO.selectTicketAll(memberID);
		 * 
		 * model.addAttribute("ticketList", ticketList);
		 */
	}
}
