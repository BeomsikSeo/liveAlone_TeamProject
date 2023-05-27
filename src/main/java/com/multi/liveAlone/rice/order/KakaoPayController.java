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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.liveAlone.MemberDAO;
import com.multi.liveAlone.MemberVO;
import com.multi.liveAlone.rice.food.FoodDAO;
import com.multi.liveAlone.rice.food.FoodVO;
import com.multi.liveAlone.rice.store.StoreDAO;
import com.multi.liveAlone.rice.store.StoreVO;
import com.multi.liveAlone.rice.ticket.TicketDAO;
import com.multi.liveAlone.rice.ticket.TicketVO;

import lombok.Setter;
import lombok.extern.java.Log;
 
@Log
@Controller
public class KakaoPayController {
	
	
	@Autowired
	OrderDAO orderDAO;	// 티켓 정보를 저장
	
	@Autowired
	TicketDAO ticketDAO; 
	
	@Autowired
	StoreDAO storeDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	FoodDAO foodDAO;
	
	
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
    	
    	StoreVO compareStore = storeDAO.selectOne(store.getStore_no());
    	
    	// 가게 번호가 일치하지 않을때 오류 발생
    	if( !compareStore.getStore_name().equals(store.getStore_name())  || !compareStore.getStore_addr().equals(store.getStore_addr())) {
    		return "redirect:/index.jsp";
    	}
    	
    	List<FoodVO> compareFoodList = foodDAO.showMenu(compareStore.getStore_no());
    	
    	for(int i=0; i<list.getList().size(); i++) {
    		for(int j=0; j <= compareFoodList.size(); j++) {
    			if(j == compareFoodList.size()) {
    				return "redirect:/index.jsp";
    			}
    			
    			// 주문한 메뉴의 정보(이름, 가격) 실제 데이터 베이스 내의 존재하는 메뉴의 이름이나 가격과 디르다면
    			// index페이지로 이동하게 만듭니다.
    			if(list.getList().get(i).getOrder_fName().equals(compareFoodList.get(j).getFood_name())) {	// 주문한 메뉴와 실제 메뉴 이름이 같은지를 확인
    					if(list.getList().get(i).getOrder_fPrice() == compareFoodList.get(j).getFood_price()) { // 주문한 메뉴 가격과 실제 메뉴 가격이 같은지 확인
    						break;
    					}
    			}
    		}
    	}
    	
    	
        resultTicket = ticket;
        resultStore = store;
        resultOrderList = list;
        
        
        
        log.info("kakaoPay post............................................");
        
        return "redirect:" + kakaopay.kakaoPayReady();
    }
    
    
    //결제 성공시 이쪽으로 이동
    @GetMapping("/rice/order/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token")String pg_token, Model model, RedirectAttributes re ,HttpSession session) {
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
    	 
    	 // 티켓 사용 여부 초기화 (미사용, 사용, 환불)
    	 resultTicket.setTicket_use("미사용");
    	 	
    	 // 티켓 Insert
    	 ticketDAO.insertTicket(resultTicket);
    	 
    	 
    	 // 주문 내역 처리
    	 // Insert한 티켓을 다시 select
    	 TicketVO resultTicketOne = ticketDAO.selectTicketOne(resultTicket);
    	 
    	 
    	 // OrderVOList를 List로 따로 정렬합니다.
    	 List<OrderVO> orderList = new ArrayList<OrderVO>();
 			for(int i = 0; i < resultOrderList.getList().size(); i++) {
 				// orderList에 resultOrderList의 orderVO을 하나씩 넣습니다
 				orderList.add( resultOrderList.getList().get(i) );
 				
 				
 				// orderList의 orderVO.ticket_ID 값을 초기화합니다.
 				orderList.get(i).setTicket_ID(resultTicketOne.getTicket_ID());
 			}
    	 
 			
 			
 		 MemberVO member = memberDAO.selectOne(memberID);
 		 System.out.println(member.getMember_id());
		 System.out.println(member.getMileage() + ", " + resultTicketOne.getTicket_usedMileage());
		 
		 member.setMileage(member.getMileage() - resultTicketOne.getTicket_usedMileage());
		 
		 log.info("kakaoPaySuccess get............................................");
	     log.info("kakaoPaySuccess pg_token : " + pg_token);
		 
		 memberDAO.updateUserMileage(member);
    	 orderDAO.insertOrder(orderList);
    	 
    	 System.out.println(pg_token.toString());
    		
    	 model.addAttribute("ticket",resultTicketOne);
    	 model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
    	 
    	 // 주문 정보 , 가게 정보, 티켓 정보를 넘깁니다.
			/*
			 * re.addAttribute("orderList", orderList); re.addAttribute("store", store);
			 * re.addAttribute("ticket", resultTicket);
			 */
    }
    
    // 결제 취소시 이쪽으로 이동
    @GetMapping("/rice/order/kakaoPayCancel")
    public void kakaoPayCancel(@RequestParam("pg_token") String pg_token, Model model) {
    	 System.out.println("결제 취소");
    	 
    	 model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
    }
    
    // 결재 실패시 이쪽으로 이동
    @GetMapping("/rice/order/kakaoPaySuccessFail")
    public void kakaoPaySuccessFail(@RequestParam("pg_token") String pg_token, Model model) {
    	 System.out.println("결제 실패");
    	 
    	 
    	 
    	 model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
    }
}