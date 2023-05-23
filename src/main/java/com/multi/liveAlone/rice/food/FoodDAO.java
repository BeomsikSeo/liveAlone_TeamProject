package com.multi.liveAlone.rice.food;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FoodDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<FoodVO> showMenu(int storeNo) {
		List<FoodVO> list = my.selectList("food.selectAllMenu",storeNo);
	
		return list;
	}
	
	
}
