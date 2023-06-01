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
		MemberVO bag = dao.one(member_id);
		model.addAttribute("bag", bag);
	}
	
	@RequestMapping("login")
	public void login(String member_id,String password, HttpSession session, Model model) {
		MemberVO result = dao.login(member_id);
		model.addAttribute("loginSuccess", false);
		
		if (result != null) {
			if (password.equals(result.getPassword())) {
				session.setAttribute("member_id", result.getMember_id());
				session.setAttribute("certification", result.getCertification()+"");
				session.setAttribute("address", result.getAddress());
		        model.addAttribute("loginSuccess", true);
			}
		}
	}
	
	@RequestMapping("signup")
	public void signup(MemberVO bag) {
		System.out.println("signup요청됨.");
		int result = dao.signup(bag);
		if (result == 1) {
			System.out.println("회원가입 성공");
		}
		else {
			System.out.println("회원가입 실패");
		}
	}
	
	@RequestMapping("checkid")
	public void checkid(String member_id, Model model) {
		System.out.println("checkid요청됨.");
		int result = dao.checkid(member_id);
		model.addAttribute("result", result);
	}
	
	@RequestMapping("checknick")
	public void checknick(String nickname, Model model) {
		System.out.println("checknick요청됨.");
		int result = dao.checknick(nickname);
		model.addAttribute("result", result);
	}
}


