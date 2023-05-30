package com.multi.liveAlone;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 스프링에서 제어하는 역할로 등록
public class MemberController {

	@Autowired // -> MemberDAO의 싱글톤 객체가 ram에 어디에 있는지 찾아서 그 주소를 아래 변수에 넣어주세요
	MemberDAO dao; // 전역변수
	
	@RequestMapping("share/chatShare/login") // 따로 return을 안하면 login을 return + RequestMapping의 결과는 views로
	// jsp에서는 HttpSession이 기본으로 내장, but java에서는 추가해줘야 함
	public String login(MemberVO bag, HttpSession session) { 
		int result = dao.login(bag); // 1,0
		if (result == 1) {
			// 로그인이 성공하면, 세션을 잡아두자!
			session.setAttribute("id", bag.getMember_id());
			
			return "share/chatShare/login"; // views아래 파일이름.jsp
		} else {
			// 로그인 실패시, views아래가 아니고, webapp아래 main.jsp로 가고 싶은 경우!
			session.setAttribute("id", "null");
			return "redirect:main.jsp";
		}
	}
}
