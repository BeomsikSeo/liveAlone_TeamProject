package com.multi.liveAlone.rice.store;

<<<<<<< HEAD
=======
import java.util.ArrayList;
>>>>>>> order
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
import org.springframework.stereotype.Component;

@Component
=======
import org.springframework.stereotype.Repository;

import com.multi.liveAlone.rice.ticket.TicketVOPage;

@Repository
>>>>>>> order
public class StoreDAO {

	@Autowired
	SqlSessionTemplate my;
<<<<<<< HEAD
	
	public void insert(StoreVO vo) {
		int result = my.insert("store.create", vo);
		System.out.println(result);
	}
	
	public List<StoreVO> list() {
		List<StoreVO> list = my.selectList("store.all");
		System.out.println(list.size());
		return list;
	}
	
	public StoreVO listMax() {
		StoreVO vo = my.selectOne("store.max");
		return vo;
	}
	
	public StoreVO one(int store_no) {
		StoreVO vo = my.selectOne("store.one", store_no);
		return vo;
	}
=======

	public StoreVO selectOne(int ticket_storeID) {
		
		// 가게 고유번호를 활용해 가게 정보를 찾습니다.
		return my.selectOne("store.selectOne", ticket_storeID);
	}

	
	// 페이징한 이름의 
	public List<StoreVO> selectStorePage(List<TicketVOPage> ticketList) {
		List<StoreVO> store = new ArrayList<>();
		for(int i=0;i<ticketList.size();i++) {
			store.add(my.selectOne("store.selectOne-page", ticketList.get(i)));
		}
		
		return store;
	}
	
	
	
>>>>>>> order
}
