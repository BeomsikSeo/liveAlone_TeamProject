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
	
	public StoreVO listMax() {
		StoreVO vo = my.selectOne("store.max");
		return vo;
	}
	
	public StoreVO one(int store_no) {
		StoreVO vo = my.selectOne("store.one", store_no);
		return vo;
	}
}
