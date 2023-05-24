package com.multi.liveAlone.rice.food;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FoodDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(FoodVO vo) {
		int result = my.insert("food.create", vo);
		System.out.println(result);
	}
}
