package com.multi.liveAlone.rice.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.liveAlone.MemberDAO;
import com.multi.liveAlone.MemberVO;
import com.multi.liveAlone.rice.food.FoodDAO;
import com.multi.liveAlone.rice.food.FoodVO;
import com.multi.liveAlone.rice.mileage.MileageDAO;
import com.multi.liveAlone.rice.mileage.MileageVO;
import com.multi.liveAlone.rice.store.StoreDAO;
import com.multi.liveAlone.rice.store.StoreVO;
import com.multi.liveAlone.rice.ticket.TicketDAO;
import com.multi.liveAlone.rice.ticket.TicketVO;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class KakaoPayController {

	@Autowired
	OrderDAO orderDAO; // 티켓 정보를 저장

	@Autowired
	TicketDAO ticketDAO;

	@Autowired
	StoreDAO storeDAO;

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	FoodDAO foodDAO;

	@Autowired
	MileageDAO mileageDAO;
	
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
	public String kakaoPay(Model model, OrderVOList list, TicketVO ticket, StoreVO store) {
		
		StoreVO compareStore = storeDAO.selectOne(store.getStore_no());
		
		System.out.println(store.toString());
		System.out.println(compareStore.toString());
		if (!compareStore.getStore_name().equals(store.getStore_name()) || !compareStore.getStore_addr().equals(store.getStore_addr())) {
			return "redirect:/mainPage.jsp";
		}

		List<FoodVO> compareFoodList = foodDAO.showMenu(compareStore.getStore_no());

		for (int i = 0; i < list.getList().size(); i++) {
			for (int j = 0; j <= compareFoodList.size(); j++) {
				if (j == compareFoodList.size()) {
					return "redirect:/index.jsp";
				}
				if (list.getList().get(i).getOrder_fName().equals(compareFoodList.get(j).getFood_name())) { 
					if (list.getList().get(i).getOrder_fPrice() == compareFoodList.get(j).getFood_price()) { 
						break;
					}
				}
			}
		}

		System.out.println(ticket.toString());
		
		resultTicket = ticket;
		resultStore = store;
		resultOrderList = list;

		return "redirect:" + kakaopay.kakaoPayReady(ticket);
	}

	
	@GetMapping("/rice/order/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token,HttpServletRequest request, Model model ,HttpSession session) {
		
		String memberID = (String) session.getAttribute("member_id");
		if(memberID.equals(null)) {
			return "redirect:/index.jsp";
		}
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd a HH:mm:ss");
		String timeNow = simpleDateFormat.format(date);

		resultTicket.setTicket_userID(memberID);
		resultTicket.setTicket_tid(kakaopay.getKakaoPayReadyVO().getTid());
		resultTicket.setTicket_storeID(resultStore.getStore_no());
		resultTicket.setTicket_start(timeNow);
		resultTicket.setTicket_end("");
		resultTicket.setTicket_use("미사용");
		
		KakaoPayApprovalVO kakaoPayApprovalVO = kakaopay.kakaoPayInfo(pg_token, resultTicket);
		
		if(kakaoPayApprovalVO != null) {
			// 성공적으로 결제 메시지가 날라왔음
			
			ticketDAO.insertTicket(resultTicket);
			TicketVO resultTicketOne = ticketDAO.selectTicketOne(resultTicket);
			
			List<OrderVO> orderList = new ArrayList<OrderVO>();
			for (int i = 0; i < resultOrderList.getList().size(); i++) {
				orderList.add(resultOrderList.getList().get(i));
				orderList.get(i).setTicket_ID(resultTicketOne.getTicket_ID());
			}
			orderDAO.insertOrder(orderList);
			
			// 1 이상의 마일리지를 사용했다면
			if(resultTicket.getTicket_usedMileage() > 0) {
				MemberVO member = memberDAO.selectOne(memberID);
				member.setMileage(member.getMileage() - resultTicketOne.getTicket_usedMileage());
				memberDAO.updateUserMileage(member);
				
				MileageVO mileage = new MileageVO();
				mileage.setMileage_how("사용");
				mileage.setMileage_why("식권 구매");
				mileage.setMileage_when(timeNow);
				mileage.setMileage_what(resultTicketOne.getTicket_usedMileage());
				mileage.setMileage_memberID(memberID);
				
				mileageDAO.insertMileageHistory(mileage);
			}
			
			
			// member.getMileage()												사용전 마일리지
			// resultTicketOne.getTicket_usedMileage() 							사용한 마일리지
			// member.getMileage() - resultTicketOne.getTicket_usedMileage() 	사용후 마일리지

			model.addAttribute("ticket", resultTicketOne);
			model.addAttribute("info", kakaoPayApprovalVO);
			
			return null;
		}
		System.out.println("비정상 출력	");
		
		return "redirect:/index.jsp";
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
		TicketVO ticket = ticketDAO.selectTicketOne(ticket_ID);
		MemberVO member = memberDAO.selectOne((String)session.getAttribute("member_id"));
		
		Date date = new Date(); 
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat ("yyyy.MM.dd a HH:mm:ss");
		String timeNow = simpleDateFormat.format(date);
		
		
		if(member.equals(null)) {
			return "redirect:/index.jsp";
		}
		
		if(ticket.getTicket_usedMileage() != 0) {
			member.setMileage(member.getMileage() + (int)(Math.round(ticket.getTicket_usedMileage()*0.9)));
			memberDAO.updateUserMileage(member);
			
			MileageVO mileage = new MileageVO();
			mileage.setMileage_how("적립");
			mileage.setMileage_why("식권 환불");
			mileage.setMileage_when(timeNow);
			mileage.setMileage_what((int)(Math.round(ticket.getTicket_usedMileage()*0.9)));
			mileage.setMileage_memberID(member.getMember_id());
			
			mileageDAO.insertMileageHistory(mileage);
		}
		
		KakaoPayRefundVO kakaoPayRefundVO = kakaopay.kakaoPayRefund(ticket);
		
		ticket.setTicket_use("환불");
		ticket.setTicket_end(timeNow);
		
		// 마일리지 업데이트
		ticketDAO.updateTicketOne(ticket);
		return null;
	}
}