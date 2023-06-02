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
		JSONVO vo = pls.up(file, request);
		System.out.println(vo);
		return vo;
	}

	
	@RequestMapping("party/bbsParty/bbsPartyAll")
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

	
//	@RequestMapping("party/bbsParty/bbsPartyThemeAll")
//	public void all(String partyBbs_theme,PagePartyVO vo, Model model) {
//		vo.setStartEnd(vo.getPage());
//		List<BbsPartyVO> list = dao.all(vo); //all에 추가
//		int count = dao.count(partyBbs_theme); //count에 추가
//		System.out.println("all count>> " + count);
//		int pages = (count - 1) / 10 + 1; //전체 페이지 개수 구하기 
//		model.addAttribute("list", list);
//		model.addAttribute("count", count);
//		model.addAttribute("pages", pages);
//	}
	
	@RequestMapping("party/bbsParty/bbsPartyOne")
	public void one(BbsPartyVO vo, Model model) {
		BbsPartyVO one = dao.one(vo);
		List<MemberPartyVO> memList = dao.memList(vo);
		model.addAttribute("one", one);
		model.addAttribute("memList", memList);
		
		System.out.println(one);
	}
	
	@RequestMapping("party/bbsParty/bbsPartyList")
	public void list2(PagePartyVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BbsPartyVO> list = dao.all(vo);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("party/bbsParty/bbsPartyDelete")
	public String delete(BbsPartyVO vo, Model model) {
		dao.del2(vo);
		dao.del3(vo);
		dao.del5(vo);//blacklist에서 해당방 블랙리스트 삭제
		
		int result = dao.del(vo);
	
		/* model.addAttribute("result", result); */
		
		if(result == 1) {
			return "redirect:bbsPartyAll?page=1"; 
		}else {
			return "no";
		}
	
	}

	@RequestMapping("party/bbsParty/bbsPartyJoin")
	public String join(BbsPartyVO vo, Model model, HttpSession session) {
		
		MemberPartyVO vo2 = new MemberPartyVO();
		vo2.setMember_id((String)session.getAttribute("member_id"));
		vo2.setParty_host(0);
		vo2.setPartyBbs_num((int)session.getAttribute("partyBbs_num"));

		/* vo.setPartyBbs_num((int)session.getAttribute("partyBbs_num")); */
		
		int bbsMemberCount = dao.count2(vo); //현재인원
		int max = dao.one2(vo); // 최대인원
		int already = dao.count3(vo2); //이미 가입한 인원
		int blackList = dao.count4(vo2);
		
		
		if(already == 1) {
			return "redirect:chatParty.jsp"; 
		}else {
			if (bbsMemberCount >= max) {
				model.addAttribute("message", "이미 최대 인원에 도달했습니다.");
				return "party/bbsParty/alert";
			}else {
				if (blackList == 1) {
					model.addAttribute("message", "강제 퇴장당하여 참여하실 수 없습니다");
					return "party/bbsParty/alert";
				}else {
					dao.insert2(vo2);
					return "redirect:chatParty.jsp";					
				}
			}
		}	
	}

	@RequestMapping("party/bbsParty/bbsPartyFire")
	public String fire(String member_id, Model model, HttpSession session) {
		MemberPartyVO vo2 = new MemberPartyVO();
		int roomNum = (int)session.getAttribute("partyBbs_num");
		
		String host = (String)session.getAttribute("member_id");
		
		if (host.equals(member_id)) {
			model.addAttribute("message", "본인을 강제퇴장시킬 수 없습니다.");
			return "party/bbsParty/alert";
		}
		
		vo2.setMember_id(member_id);
		vo2.setPartyBbs_num(roomNum);
		dao.del4(vo2);
		dao.insert4(vo2);
		
		return "redirect:bbsPartyOne?partyBbs_num=" + roomNum;
	}
	
	
	@RequestMapping("party/bbsParty/bbsPartyInsert")
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
	
	
	
	
	
	
	
	@RequestMapping("party/bbsParty/chatLog")
	@ResponseBody
	public List<ChatPartyVO> chatAll(HttpSession session) {
		  int partyBbs_num = (int)session.getAttribute("partyBbs_num");
		 
		  List<ChatPartyVO> list = dao.chatAll(partyBbs_num); 
		  
		  return list;
	}
	
	
	
}
