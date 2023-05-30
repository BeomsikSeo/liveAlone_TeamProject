package com.multi.liveAlone.rice.food;

import java.util.List;

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
	
	@RequestMapping("rice/store/listFood")
	public void list(int store_no, Model model) {
		List<FoodVO> list = dao.list(store_no);
		model.addAttribute("list", list);
	}
}
