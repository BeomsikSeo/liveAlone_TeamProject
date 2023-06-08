package com.multi.liveAlone.rice.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.liveAlone.rice.store.StoreVO;
import com.multi.liveAlone.rice.ticket.TicketVO;

import lombok.Setter;

@Controller
public class KakaoPayController {
	
	
	@Autowired
	KakaoPayService_Interface kakaoPayService;
	
	@Setter(onMethod_ = @Autowired) 
	private KakaoPay kakaopay;

	private OrderVOList resultOrderList = null;
	private TicketVO resultTicket = null;
	private StoreVO resultStore = null;

	@GetMapping("/kakaoPay")
	public void kakaoPayGet() {

	}

	// 결제시 연동
	@PostMapping("/rice/order/kakaoPay")
	public String kakaoPay(HttpSession session, RedirectAttributes redirect ,Model model, OrderVOList list, TicketVO ticket, StoreVO store, int total_price ) {
		// 로그인이 되어있지 않다면 리턴합니다.
		String memberID = (String)session.getAttribute("member_id");
		if(memberID.equals(null)) {
			return "redirect:/mainPage.jsp";
		}
		
		// checkResult에 결과값에 따라 다른 페이지로 이동하게 만듭니다.
		int checkResult = kakaoPayService.compareInfo(memberID, list, ticket, store, total_price);
		switch(checkResult) {
		// 입력 정보에 오류가 있음
		case -1 :
			return "redirect:" + "/mainPage.jsp";
			
		// 입력 정보에 오류가 없음
		case 1 :
			resultTicket = ticket;
			resultStore = store;
			resultOrderList = list;
			
			return "redirect:" + kakaopay.kakaoPayReady(ticket);
		default : 
			System.out.println("관련 없는 오류 발생");
			
			return "redirect:" + "/mainPage.jsp";
		} 
	}

	
	@GetMapping("/rice/order/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token,HttpServletRequest request, Model model ,HttpSession session) {
		String memberID = (String)session.getAttribute("member_id");
		if(memberID.equals(null)) {
			return "redirect:/mainPage.jsp";
		}
		
		
		int result = kakaoPayService.compareMileage(memberID, resultTicket);
		if(result == -1) {
			return "redirect:/mainPage.jsp";
		}
		
		KakaoPayApprovalVO kakaoPayApprovalVO = kakaopay.kakaoPayInfo(pg_token, resultTicket);
		
		if(kakaoPayApprovalVO != null) {
			String TID = kakaopay.getKakaoPayReadyVO().getTid();
			
			TicketVO resultTicketOne = kakaoPayService.insertInfo(memberID , TID, resultTicket, resultOrderList, resultStore);
			
			model.addAttribute("ticket", resultTicketOne);
			model.addAttribute("info", kakaoPayApprovalVO);
			return null;
		}
		
		return "redirect:/mainPage.jsp";
	}


	// 2. 결제 취소시 이쪽으로 이동
	@GetMapping("/rice/order/kakaoPayCancel")
	public void kakaoPayCancel() {
		System.out.println("결제 취소");
	}

	public void kakaoPaySuccessFail(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("결제 실패");
	}

	
	// 카카오페이 환불
	@PostMapping("/rice/order/kakaoPayRefund")
	public String kakaoPayRefund(HttpSession session, HttpServletRequest request, int ticket_ID) {
		int result = 0;
		
		String memberID = (String)session.getAttribute("member_id");
		if(memberID.equals(null)) {
			return "redirect:/mainPage.jsp";
		}
		
		result = kakaoPayService.refundTicket(memberID ,ticket_ID);
		if(result == -1) {
			return "redirect:/mainPage.jsp";
		}
		
		result = kakaoPayService.updateTicket(ticket_ID);
		if(result == -1) {
			return "redirect:/mainPage.jsp";
		}
		
		TicketVO ticket = kakaoPayService.selectTicketOne(ticket_ID);
		kakaopay.kakaoPayRefund(ticket);
		
		return null;
	}
}