package com.multi.liveAlone.rice.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StoreDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(StoreVO vo) {
		int result = my.insert("store.create", vo);
		System.out.println(result);
	}
	
	public List<StoreVO> list() {
		List<StoreVO> list = my.selectList("store.all");
		System.out.println(list.size());
		return list;
	}
}
