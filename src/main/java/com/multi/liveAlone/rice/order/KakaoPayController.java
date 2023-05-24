package com.multi.liveAlone.rice.order;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.liveAlone.rice.store.StoreDAO;
import com.multi.liveAlone.rice.store.StoreVO;
import com.multi.liveAlone.rice.ticket.TicketDAO;
import com.multi.liveAlone.rice.ticket.TicketVO;

import lombok.Setter;
 
@Controller
public class KakaoPayController {
	
	
	@Autowired
	OrderDAO orderDAO;	// 티켓 정보를 저장
	
	@Autowired
	TicketDAO ticketDAO; 
	
	@Autowired
	StoreDAO storeDAO;
	
	
	@Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;

	private OrderVOList resultOrderList = null; 
	private TicketVO resultTicket = null;		
	private StoreVO resultStore;
	
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    
    // 결제시 연동
    @PostMapping("/rice/order/kakaoPay")
    public String kakaoPay(Model model, OrderVOList list,TicketVO ticket, StoreVO store) {
    	
        resultTicket = ticket;
        resultStore = store;
        resultOrderList = list;
        
        
    	return "redirect:" + kakaopay.kakaoPayReady(ticket);
    }
    
    
    //결제 성공시 이쪽으로 이동
    @GetMapping("/rice/order/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
    	 System.out.println("결제 완료");
    	 
    	 // 티켓 발급 처리
    	 // 멤버 아이디
    	 String memberID = (String)session.getAttribute("memberID");
    	 resultTicket.setTicket_userID(memberID);;
    	 
    	 // 가게 번호
    	 resultTicket.setTicket_storeID(resultStore.getStore_no());
    	 
    	 // 티켓 발행 날짜
    	 Date date = new Date(); 
    	 SimpleDateFormat simpleDateFormat = new SimpleDateFormat ("yyyy.MM.dd a HH:mm:ss");
    	 resultTicket.setTicket_start(simpleDateFormat.format(date));
    	 resultTicket.setTicket_end(" ");
    	 
    	 // 티켓 사용 여부 초기화 (0 : 미사용, 1 : 사용, 2 : 환불)
    	 resultTicket.setTicket_use("미사용");
    	 	
    	 // 티켓 Insert
    	 ticketDAO.insertTicket(resultTicket);
    	 
    	 
    	 // 주문 내역 처리
    	 // Insert한 티켓을 다시 select
    	 TicketVO resultTicketOne = ticketDAO.selectTicketOne(resultTicket);
    	 
    	 StoreVO store = storeDAO.selectOne(resultTicket.getTicket_storeID());
    	 
    	 // OrderVOList를 List로 따로 정렬합니다.
    	 List<OrderVO> orderList = new ArrayList<OrderVO>();
 			for(int i = 0; i < resultOrderList.getList().size(); i++) {
 				// orderList에 resultOrderList의 orderVO을 하나씩 넣습니다
 				orderList.add( resultOrderList.getList().get(i) );
 				
 				
 				// orderList의 orderVO.ticket_ID 값을 초기화합니다.
 				orderList.get(i).setTicket_ID(resultTicketOne.getTicket_ID());
 			}
    	 
    	 
 		// 주문 내역을 Order DB에 넣습니다.
    	 orderDAO.insertOrder(orderList);
    	 
    	 // 주문 정보 , 가게 정보, 티켓 정보를 넘깁니다.
    	 model.addAttribute("orderList", orderList);
    	 model.addAttribute("store", store);
    	 model.addAttribute("ticket", resultTicket);
    	 
    }
    
    // 결제 취소시 이쪽으로 이동
    @GetMapping("/rice/order/kakaoPayCancel")
    public void kakaoPayCancel(@RequestParam("pg_token") String pg_token, Model model) {
    	 System.out.println("결제 취소");
    	 
    	 
    }
    
    // 결재 실패시 이쪽으로 이동
    @GetMapping("/rice/order/kakaoPaySuccessFail")
    public void kakaoPaySuccessFail(@RequestParam("pg_token") String pg_token, Model model) {
    	 System.out.println("결제 실패");
    	 
    	 
    }
}