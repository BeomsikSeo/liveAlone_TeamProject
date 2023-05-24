package com.multi.liveAlone.rice.store;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@Autowired
	StoreDAO dao;
	
	// 가게 정보 등록, 가게 번호 세션등록
	@RequestMapping("rice/store/insert")
	public void insert(StoreVO vo, HttpSession session, Model model) {
		System.out.println(vo);
		dao.insert(vo);
		StoreVO vo2 = dao.listMax();
		// 메뉴 등록 시 가게 번호를 세션으로 넘겨줘서 등록함
		session.setAttribute("no", vo2.getStore_no());
		model.addAttribute("vo", vo2);
	}
	
	// 가게 리스트 출력
	@RequestMapping("rice/store/list")
	public void list(Model model) {
		List<StoreVO> list = dao.list();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("rice/store/one")
	public void one(int store_no, Model model) {
		StoreVO vo = dao.one(store_no);
		model.addAttribute("vo", vo);
	}
	
}
