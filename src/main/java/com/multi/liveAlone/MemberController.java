package com.multi.liveAlone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;


public class MemberController {

	@Autowired
	MemberDAO dao;
	
	@RequestMapping("certi")
	public void certi(String member_id) {
		System.out.println("certi요청됨.");
		dao.certi(member_id);
	}
}
