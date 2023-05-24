package com.multi.liveAlone.rice.ticket;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.liveAlone.rice.order.OrderDAO;
import com.multi.liveAlone.rice.order.OrderVO;
import com.multi.liveAlone.rice.store.StoreDAO;
import com.multi.liveAlone.rice.store.StoreVO;

@Controller
@RequestMapping("rice/ticket")
public class TicketController {
	
	@Autowired
	TicketDAO ticketDAO;
	
	@Autowired
	StoreDAO storeDAO;
	
	@Autowired
	OrderDAO orderDAO;
	
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
		// session.setAttribute("memberID", "userA");
		String memberID = (String)session.getAttribute("memberID");
		System.out.println(memberID);


		session.setAttribute("memberID", memberID);
	}
	
	
	// 사용자가 지정한 티켓의 상세 정보를 가지고옵니다.
	@RequestMapping("userTicketOne")
	public String userTicketOne(HttpSession session,Model model, int ticket_ID) {
		
		// 만약 사용자가 자신이 보유한 티켓이 아닌 다른 사람이 보유한 티켓을 억지로 찾으려고 할 때 해당 조건문을 통해
		// 사용자의 티켓 페이지 리스트로 강제로 이동하게 만듭니다.
		String memberID = (String)session.getAttribute("memberID");
		TicketVO ticket = ticketDAO.selectTicketOne(ticket_ID);
		
		if(ticket.getTicket_userID().equals(memberID)) {
			List<OrderVO> orderList = orderDAO.selectOrderList(ticket.getTicket_ID());
			StoreVO store = storeDAO.selectOne(ticket.getTicket_storeID());
			
			model.addAttribute("ticket", ticket);
			model.addAttribute("store", store);
			model.addAttribute("orderList",orderList);
			return "rice/ticket/userTicketOne";
		} else {
			return "redirect:userTicket"; 
		}
	} 
	
	
	// 티켓 페이지의 티켓 정보를 가지고 옵니다.
	// 시간의 내림차순으로 정리해 가장 최근에 발행한 것이 맨 위로 올라오도록 합니다.
	@RequestMapping("userTicketAjax")
	public void userTicketAjax(Model model,HttpSession session,int pageNo) {
		TicketVOInfo page = new TicketVOInfo(pageNo, (String)session.getAttribute("memberID"));
		
		System.out.println(page.getPageNo() + " " + page.getUserID());
		
		// 페이징한 리스트들을 가지고 옵니다.
		List<TicketVOPage> ticketList = ticketDAO.selectTicketPage(page);
		List<StoreVO> storeList = storeDAO.selectStorePage(ticketList);
		
		// 1 Page = 1 ~ 5
		// 2 Page = 6 ~ 10
		
		model.addAttribute("ticketList",ticketList);
		model.addAttribute("storeList",storeList);
	}
}
