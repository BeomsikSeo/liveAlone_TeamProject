package com.multi.liveAlone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	@RequestMapping("certi")
	public void certi(String member_id) {
		System.out.println("certi요청됨.");
		dao.certi(member_id);
	}
	
	@RequestMapping("getaddress")
	public void getAddress(String member_id, Model model) {
		System.out.println("getaddress요청됨.");
		System.out.println(member_id);
		MemberVO bag = dao.getaddress(member_id);
		model.addAttribute("bag", bag);
	}
	
	/*@RequestMapping("one")
	public void one(String id, Model model) {
		System.out.println("one요청됨.");
		System.out.println(id);
		MemberVO bag = dao.one(id);
		model.addAttribute("bag", bag);
	}*/
}
