package com.multi.liveAlone.rice.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAO {

	@Autowired
	SqlSessionTemplate my;

	public StoreVO selectOne(int ticket_storeID) {
		
		// 가게 고유번호를 활용해 가게 정보를 찾습니다.
		return my.selectOne("store.selectOne", ticket_storeID);
	}
	
	
	
}
