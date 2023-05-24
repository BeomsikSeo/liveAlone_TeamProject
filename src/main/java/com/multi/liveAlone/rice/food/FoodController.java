package com.multi.liveAlone.rice.food;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FoodController {
	
	@Autowired
	FoodDAO dao;
	
	@RequestMapping("rice/store/insertFood")
	public void insert(FoodVO vo, Model model) {
		dao.insert(vo);
		model.addAttribute("vo", vo);
	}
}
