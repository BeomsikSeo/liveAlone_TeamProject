package com.multi.liveAlone.rice.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

@Service
public class KakaoPayService implements KakaoPayService_Interface {

	@Autowired
	TicketDAO ticketDAO;	// 티켓 
	
	@Autowired
	OrderDAO orderDAO; 

	@Autowired
	StoreDAO storeDAO;

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	FoodDAO foodDAO;

	@Autowired
	MileageDAO mileageDAO;
	
	
	// 결제를 위해 내가 입력한 정보들의 값들을 DB에 저장된 값들과 비교합니다.
	@Override
	public int compareInfo(String memberID, OrderVOList list, TicketVO ticket, StoreVO store, int total_price) {
		
		// 과정 진행 중				>> 0
		// 정보가 일치한다는 결과		>> 1
		// 정보가 불일치한다는 결과		>> -1
		
		int result = 0;
		
		while(true) {
			
			// 가게 정보를 비교합니다.
			result = compareStoresTwo(store);
			if(result == -1) {
				break;
			}
			
			// 내가 주문한 메뉴들과 실제 음식점에 제공하는 메뉴의 정보를 비교합니다.
			result = compareOrderTwo(store, list);
			if(result == -1) {
				break;
			}

			// 총 가격, 사용 마일리지 비교, 티켓 가격을 비교합니다.
			int orderPrice = getOrderPrice(list);
			result = comparePriceInfoTwo(memberID, ticket, total_price, orderPrice);
			if(result == -1) {
				break;
			}
			
			result = 1;
			break;
		}
		
		return result;
	}

	// 주문한 음식점의 정보와 실제 DB에 저장된 음식점의 정보를 비교합니다
	@Override
	public int compareStoresTwo(StoreVO store) {
		
		// 음식점 고유 번호를 통해 음식점의 정보를 가져옵니다.
		StoreVO compareStore = storeDAO.selectOne(store.getStore_no());
		
		
		// 위에서부터 순서대로 음식점의 이름, 음식점의 위치, 음식점의 고유 번호를 비교합니다.
		// 하나라도 이상이 있을 경우 -1값을 반환합니다.
		if(!compareStore.getStore_name().equals(store.getStore_name())) {
			System.out.println(1);
			return -1;
		} else if(!compareStore.getStore_addr().equals(store.getStore_addr())) {
			System.out.println(2);

			return -1;
		} else if(compareStore.getStore_no() != store.getStore_no()) {
			System.out.println(3);

			return -1;
		} else {
			return 0;
		}
	}

	// 주문한 메뉴의 정보와 실제 DB에 저장된 메뉴의 정보를 비교합니다
	@Override
	public int compareOrderTwo(StoreVO store, OrderVOList list) {
		// 내가 주문한 음식 리스트
		List<OrderVO> foodList = list.getList();
		
		// 음식점에서 제공하는 음식 리스트
		List<FoodVO>  compareFoodList = foodDAO.showMenu(store.getStore_no());
		
		// 내가 주문한 메뉴 리스트크기만큼 반복
		for(int i=0; i<foodList.size(); i++) {
			
			// 비교를 위해 가게에서 제공하는 메뉴의 크기만큼 반복
			for (int j = 0; j <= compareFoodList.size(); j++) {
				
				// 내가 주문한 메뉴의 정보가 실제 음식점에서 주문한 메뉴의 정보와 일치하지 않는다면 -1을 반환합니다.
				if (j == compareFoodList.size()) {
					return -1;
				}
				
				// 내가 주문한 음식 메뉴 정보와, 해당 음식점에서 실제로 제공하는 메뉴들의 정보를 비교합니다.
				// 메뉴 비교 과정에서 음식의 이름, 음식의 가격 정보가 일치한다면 내가 주문한 다음 메뉴로 이동합니다.
				if (foodList.get(i).getOrder_fName().equals(compareFoodList.get(j).getFood_name())) {
					if (foodList.get(i).getOrder_fPrice() == compareFoodList.get(j).getFood_price()) {
						break;
					}
				}
			}
		}
		
		return 0;
	}
	
	// 입력된 가격 및 마일리지 정보와, 실제 가격과 사용자의 마일리지 입력값을 비교합니다.
	@Override
	public int comparePriceInfoTwo(String memberID, TicketVO ticket, int total_price, int order_price ) {
		MemberVO member = memberDAO.selectOne(memberID);
		
		if(order_price != total_price) {
			System.out.println(1);
		
			return -1;
		}
		
		if(member.getMileage() < ticket.getTicket_usedMileage()) {
			System.out.println(2);

			return -1;
		}
		
		
		if(ticket.getTicket_price() != order_price-ticket.getTicket_usedMileage()) {
			System.out.println(3);
			return -1;
		}
		
		return 0;
	}

	// 주문 정보의 총 가격을 알아옵니다.
	@Override
	public int getOrderPrice(OrderVOList list) {
		
		int totalPrice = 0;
		
		for(int i=0; i<list.getList().size(); i++) {
			totalPrice = totalPrice + list.getList().get(i).getOrder_fPrice() * list.getList().get(i).getOrder_fCount();
		}
		
		System.out.println(totalPrice);
		return totalPrice;
	}

	

	
	// 현재 시간을 읽어옵니다.
	public String getTimeNow() {
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd a HH:mm:ss");
			String timeNow = simpleDateFormat.format(date);
			
			return timeNow;
		}
		
	
	
	
	
	
	// 최종 결제시 티켓에 대한 정보를 읽어옵니다.
	@Override
	public TicketVO insertInfo(String memberID, String TID,TicketVO resultTicket, OrderVOList resultOrderList, StoreVO resultStore) {
		String time = getTimeNow();
		MemberVO member = memberDAO.selectOne(memberID);
		resultTicket.setTicket_userID(member.getMember_id());
		resultTicket.setTicket_tid(TID);
		resultTicket.setTicket_storeID(resultStore.getStore_no());
		resultTicket.setTicket_start(time);
		resultTicket.setTicket_end("");
		resultTicket.setTicket_use("미사용");
		
		ticketDAO.insertTicket(resultTicket);
		TicketVO resultTicketOne = ticketDAO.selectTicketOne(resultTicket);
		
		
		// 주문 정보를 넣어야하고
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		for (int i = 0; i < resultOrderList.getList().size(); i++) {
			orderList.add(resultOrderList.getList().get(i));
			orderList.get(i).setTicket_ID(resultTicketOne.getTicket_ID());
			
			orderDAO.insertOrder(orderList.get(i));
		}
		
		
		// 마일리지를 사용했다면 마일리지 사용 내역을 넣어야하고
		if(resultTicket.getTicket_usedMileage() > 0) {
			member.setMileage(member.getMileage() - resultTicketOne.getTicket_usedMileage());
			memberDAO.updateUserMileage(member);
			
			MileageVO mileage = new MileageVO();
			mileage.setMileage_how("사용");
			mileage.setMileage_why("식권 구매");
			mileage.setMileage_when(time);
			mileage.setMileage_what(resultTicketOne.getTicket_usedMileage());
			mileage.setMileage_memberID(memberID);
			
			mileageDAO.insertMileageHistory(mileage);
		}
		
		return resultTicketOne;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	

	@Override
	public int refundTicket(String memberID,int ticket_ID) {
		MemberVO member = memberDAO.selectOne(memberID);
		TicketVO ticket = ticketDAO.selectTicketOne(ticket_ID);
		if(!member.getMember_id().equals(ticket.getTicket_userID())) {
			return -1;
		}
		
		String time = getTimeNow();
		
		// 티켓에 사용한 마일리지가 0아 아니라면 멤버의 마일리지를 변경하고
		// 마일리지 사용 내역을 추가합니다.
		if(ticket.getTicket_usedMileage() != 0) {
			member.setMileage(member.getMileage() + (int)(Math.round(ticket.getTicket_usedMileage()*0.9)));
			memberDAO.updateUserMileage(member);
			
			MileageVO mileage = new MileageVO();
			mileage.setMileage_how("적립");
			mileage.setMileage_why("식권 환불");
			mileage.setMileage_when(time);
			mileage.setMileage_what((int)(Math.round(ticket.getTicket_usedMileage() * 0.9)));
			mileage.setMileage_memberID(member.getMember_id());
			
			mileageDAO.insertMileageHistory(mileage);
		}
		
		return 0;
	}


	@Override
	public int updateTicket(int ticket_ID) {
		int result = 0;
		TicketVO ticket = ticketDAO.selectTicketOne(ticket_ID);
		
		
		Date date = new Date(); 
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat ("yyyy.MM.dd a HH:mm:ss");
		String timeNow = simpleDateFormat.format(date);

		ticket.setTicket_use("환불");
		ticket.setTicket_end(timeNow);
		
		ticketDAO.updateTicketOne(ticket);
		
		return result;
	}


	@Override
	public TicketVO selectTicketOne(int ticket_ID) {
		TicketVO ticket = ticketDAO.selectTicketOne(ticket_ID); 
		return ticket;
	}

	@Override
	public int compareMileage(String memberID, TicketVO resultTicket) {
		int result = 0;
		MemberVO member = memberDAO.selectOne(memberID);
		
		if(member.getMileage() < resultTicket.getTicket_usedMileage()) {
			result = -1;
		}
		
		return result;
	}


	
	
	
}
