package com.multi.liveAlone;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	
	@RequestMapping("share/bbsShare/certi")
	public void certi(String member_id, HttpSession session) {
		System.out.println("certi요청됨.");
		dao.certi(member_id);
		session.removeAttribute("member_id");
		session.removeAttribute("certification");
		session.removeAttribute("address");
		session.removeAttribute("nickname");
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
				session.setAttribute("nickname", result.getNickname());
				System.out.println("member_id : " + result.getMember_id());
				System.out.println("certification : " + result.getCertification());
				System.out.println("address : " + result.getAddress());
				System.out.println("nickname : " + result.getNickname());
		        model.addAttribute("loginSuccess", true);
			}
		}
	}
	
	@RequestMapping("signup")
	public void signup(MemberVO bag) {
		System.out.println("signup요청됨.");
		String add = bag.getAddress();
		String address = add;
		
		
		int index = add.indexOf('_');
	    if (index != -1) {
	        String firstPart = add.substring(0, index);
	        String secondPart = add.substring(index + 1);

	        switch (firstPart) {
			case "서울": firstPart = "서울특별시"; break;
			case "부산": firstPart = "부산광역시"; break;
			case "대구": firstPart = "대구광역시"; break;
			case "인천": firstPart = "인천광역시"; break;
			case "광주": firstPart = "광주광역시"; break;
			case "대전": firstPart = "대전광역시"; break;
			case "울산": firstPart = "울산광역시"; break;
			case "경기": firstPart = "경기도"; break;
			case "강원": firstPart = "강원도"; break;
			case "충북": firstPart = "충청북도"; break;
			case "충남": firstPart = "충청남도"; break;
			case "전북": firstPart = "전라북도"; break;
			case "전남": firstPart = "전라남도"; break;
			case "경북": firstPart = "경상북도"; break;
			case "경남": firstPart = "경상남도"; break;
			default: break;
			}
	        
	        address = firstPart +"_"+ secondPart;
	    }
	    bag.setAddress(address);
		
		
		
		
		
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
	
	@RequestMapping("share/bbsShare/checkpoint")
	public void checkpoint(String nickname, Model model) {
		System.out.println("checkpoint요청됨.");
		int result = dao.checkpoint(nickname);
		System.out.println(result);
		model.addAttribute("result", result);
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
			session.setAttribute("nickname", result.getNickname());
			
			return "share/chatShare/login"; // views아래 파일이름.jsp
		}
	}

	@RequestMapping("mypage/{page}")
	public void mypage(@PathVariable("page") String page, Model model, HttpSession session) {		
		if (page.equals("mypage") || page.equals("userInfo")) {
			MemberVO bag = dao.login((String)session.getAttribute("member_id"));
			model.addAttribute("bag", bag);
		}
	}
	
	@RequestMapping("deleteaccount")
	public String deleteaccount(String member_id) {	
		System.out.println(member_id + "에 대한 deleteaccount 요청됨.");
		dao.deleteaccount(member_id);
		
		return "redirect:login.jsp";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {	
		System.out.println("logout 요청됨.");
		session.removeAttribute("member_id");
		session.removeAttribute("address");
		session.removeAttribute("certification");
		
		return "redirect:mainPage.jsp";
	}
}


