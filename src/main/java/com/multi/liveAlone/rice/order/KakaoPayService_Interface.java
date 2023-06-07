package com.multi.liveAlone.rice.order;


import com.multi.liveAlone.rice.store.StoreVO;
import com.multi.liveAlone.rice.ticket.TicketVO;

public interface KakaoPayService_Interface {

	
	// 내가 선택한 음식점, 선택한 메뉴들의 정보, 선택한 메뉴들의 총 가격을 비교
	int compareInfo(String memberID, OrderVOList list, TicketVO ticket, StoreVO store, int total_price);
	
	// 가게 정보 비교합니다.
	int compareStoresTwo(StoreVO store);
	
	// 메뉴 주문 정보를 비교합니다.
	int compareOrderTwo(StoreVO store, OrderVOList list);
	
	// 가격 정보를 빅합니다.
	int comparePriceInfoTwo(String memberID, TicketVO ticket, int total_price, int order_price);

	// 마일리지를 비교합니다.
	int compareMileage(String memberID, TicketVO resultTicket);

	
	// 메뉴 주문 가격의 합을 구합니다.
	int getOrderPrice(OrderVOList list);

	// 현재 시간을 읽어옵니다.
	String getTimeNow();
	
	
	// 결제가 완료되었을 경우 정보들을 DB에 집어넣습니다.
	TicketVO insertInfo(String memberID, String TID, TicketVO resultTicket, OrderVOList resultOrderList, StoreVO resultStore);

	// 티켓을 환불합니다.
	int refundTicket(String memberID, int ticket_ID);

	
	// 티켓의 상태를 업데이트 합니다.
	int updateTicket(int ticket_ID);

	
	// 티켓의 정보를 하나 가지고 옵니다.
	TicketVO selectTicketOne(int ticket_ID);

	
	
	
}