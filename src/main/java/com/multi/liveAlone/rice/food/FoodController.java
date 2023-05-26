package com.multi.liveAlone.rice.food;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("rice/food")
public class FoodController {
	
	@Autowired
	FoodDAO foodDAO;
	
	@RequestMapping("foodWorldCup")
	public void foodWorldCup() {
		
	}
	
	@RequestMapping("foodWorldCupList")
	public void foodWorldCupList(int count) {
		/*
		 * 푸드 카테고리를 가지고 옵니다.
		 * */
		System.out.println(count);
		
		List<FoodVO> list = foodDAO.selectFoodCategory(count);
		
	}
}
