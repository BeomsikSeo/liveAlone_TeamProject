package com.multi.liveAlone.rice.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@Autowired
	StoreDAO dao;
	
	@RequestMapping("rice/store/insert")
	public void insert(StoreVO vo, Model model) {
		System.out.println(vo);
		dao.insert(vo);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("rice/store/list")
	public void list(Model model) {
		List<StoreVO> list = dao.list();
		model.addAttribute("list", list);
	}
}
