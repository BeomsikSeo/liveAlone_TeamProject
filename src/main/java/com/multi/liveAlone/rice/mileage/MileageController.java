package com.multi.liveAlone.rice.mileage;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.liveAlone.MemberDAO;
import com.multi.liveAlone.MemberVO;

@Controller
public class MileageController {
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	MileageDAO mileageDAO;
	
	@RequestMapping("rice/mileage/userMileage")
	public String userMileage(HttpSession session,Model model) {
		if( session.getAttribute("member_id") == null ) {
			return "redirect:/login.jsp";
		}
		
		System.out.println("userMileage MemberID >> " + (String)session.getAttribute("member_id"));
		
		MemberVO member = memberDAO.selectOne((String)session.getAttribute("member_id"));
		
		model.addAttribute("member",member);
		
		return null;
	}
	
	
	@RequestMapping("rice/mileage/userMileageAjax") 
	public void userMileageAjax(HttpSession session,Model model, int pageNum) {
		MileageVOInfo page = new MileageVOInfo(pageNum, (String)session.getAttribute("member_id"));
		
		System.out.println(page.toString());
		
		
		
		List<MileageVOPage> list = mileageDAO.selectMileagePage(page);
		System.out.println("리스트의 크기는 " + list.size() );
		  
		model.addAttribute("mileageList", list);
	}
	 
}
