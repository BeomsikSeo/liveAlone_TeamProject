package com.multi.liveAlone.party.bbsParty;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BbsPartyController {
	@Autowired
	BbsPartyDAO dao;
	
	@Autowired
	BbsPartyService pls;
	
	
	@RequestMapping(value="party/bbsParty/SummerNoteImageFile" , method = RequestMethod.POST)
	public @ResponseBody JSONVO SummerNoteImageFile(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		//JsonObject jsonObject = pls.up(file);
		JSONVO vo = pls.up(file, request );
		System.out.println(vo);
		return vo;
	}

	
	@RequestMapping("bbsPartyAll")
	public void all(PagePartyVO vo, Model model) {
		System.out.println(vo.getPage());
		vo.setStartEnd(vo.getPage());
		List<BbsPartyVO> list = dao.all(vo);
		int count = dao.count();
		System.out.println("all count>> " + count);
		int pages = (count - 1) / 10 + 1; //전체 페이지 개수 구하기 
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}
	
	@RequestMapping("bbsPartyOne")
	public void one(BbsPartyVO vo, Model model) {
		BbsPartyVO one = dao.one(vo);
		model.addAttribute("one", one);
		System.out.println(one);
	}
	
	@RequestMapping("bbsPartyList")
	public void list2(PagePartyVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BbsPartyVO> list = dao.all(vo);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("bbsPartyDelete")
	public String delete(BbsPartyVO vo, Model model) {
		int result = dao.del(vo);
	
		/* model.addAttribute("result", result); */
		
		if(result == 1) {
			return "redirect:bbsPartyAll?page=1"; 
		}else {
			return "no";
		}
	
	}

	@RequestMapping("bbsPartyInsert")
	public String insert(BbsPartyVO vo, Model model, HttpSession session) {

		String partyBbs_writer = (String) session.getAttribute("member_id");
		
		vo.setPartyBbs_writer(partyBbs_writer);
		
		dao.insert(vo);

		MemberPartyVO vo2 = new MemberPartyVO();
		vo2.setMember_id(partyBbs_writer);
		vo2.setParty_host(1);
		vo2.setPartyBbs_num(vo.getPartyBbs_num());
		int result = dao.insert2(vo2);
		
		/* String text = "게시물 작성 성공"; */

		/* model.addAttribute("result", text); */
		
		if(result == 1) {
			return "redirect:bbsPartyAll?page=1"; 
		}else {
			return "no";
		}

	}
	
	@RequestMapping("chatLog")
	@ResponseBody
	public List<ChatPartyVO> chatAll(HttpSession session) {
		  int partyBbs_num = (int)session.getAttribute("partyBbs_num");
		 
		  List<ChatPartyVO> list = dao.chatAll(partyBbs_num); 
		  
		  return list;
	}
	

	
	
}
