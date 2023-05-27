package com.multi.liveAlone.rice.food;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
import org.springframework.stereotype.Component;

@Component
=======
import org.springframework.stereotype.Repository;

@Repository
>>>>>>> order
public class FoodDAO {

	@Autowired
	SqlSessionTemplate my;
	
<<<<<<< HEAD
	public void insert(FoodVO vo) {
		int result = my.insert("food.create", vo);
		System.out.println(result);
	}
	
	public List<FoodVO> list(int store_no) {
		List<FoodVO> list = my.selectList("food.list", store_no);
		return list;
	}
=======
	public List<FoodVO> showMenu(int storeNo) {
		List<FoodVO> list = my.selectList("food.selectAllMenu",storeNo);
	
		return list;
	}

	
	
>>>>>>> order
}
