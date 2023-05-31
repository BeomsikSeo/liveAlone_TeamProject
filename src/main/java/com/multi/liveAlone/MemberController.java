package com.multi.liveAlone;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	
	@RequestMapping("share/bbsShare/certi")
	public void certi(String member_id) {
		System.out.println("certi요청됨.");
		dao.certi(member_id);
	}
	
	@RequestMapping("share/bbsShare/getaddress")
	public void getAddress(String member_id, Model model) {
		System.out.println("getaddress요청됨.");
		System.out.println(member_id);
		MemberVO bag = dao.getaddress(member_id);
		model.addAttribute("bag", bag);
	}
	
	@RequestMapping("share/chatShare/login") // 따로 return을 안하면 login을 return + RequestMapping의 결과는 views로
	// jsp에서는 HttpSession이 기본으로 내장, but java에서는 추가해줘야 함
	public String login(String login_id, HttpSession session) {
		System.out.println("x");
		MemberVO result = dao.login(login_id); // 1,0
		System.out.println("---- " + result);
		
		if (result == null){
			// 로그인 실패시, views아래가 아니고, webapp아래 main.jsp로 가고 싶은 경우!
			session.setAttribute("member_id", "null");
			return "redirect:main.jsp";
		}
		else {
			// 로그인이 성공하면, 세션을 잡아두자!
			session.setAttribute("member_id", result.getMember_id());
			session.setAttribute("certification", result.getCertification()+"");
			session.setAttribute("address", result.getAddress());
			
			return "share/chatShare/login"; // views아래 파일이름.jsp
		}
	}
}


