package com.multi.liveAlone.rice.store;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.liveAlone.rice.ticket.TicketVOPage;

@Repository
public class StoreDAO {

	@Autowired
	SqlSessionTemplate my;

	public StoreVO selectOne(int ticket_storeID) {
		
		// 가게 고유번호를 활용해 가게 정보를 찾습니다.
		return my.selectOne("store.selectOne", ticket_storeID);
	}

	
	//
	public List<StoreVO> selectStorePage(List<TicketVOPage> ticketList) {
		List<StoreVO> store = new ArrayList<>();
		for(int i=0;i<ticketList.size();i++) {
			store.add(my.selectOne("store.selectOne-page", ticketList.get(i)));
		}
		
		return store;
	}

	
}
