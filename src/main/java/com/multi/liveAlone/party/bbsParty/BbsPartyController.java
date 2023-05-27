package com.multi.liveAlone.party.bbsParty;

public class BbsPartyController {

<<<<<<< HEAD
=======
	
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
	
	@RequestMapping("party/bbsParty/bbsPartyOne")
	public void one(BbsPartyVO vo, Model model) {
		BbsPartyVO one = dao.one(vo);
		model.addAttribute("one", one);
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
		
		int result = dao.del(vo);
	
		/* model.addAttribute("result", result); */
		
		if(result == 1) {
			return "redirect:bbsPartyAll?page=1"; 
		}else {
			return "no";
		}
	
	}

/*	@RequestMapping("party/bbsParty/bbsPartyJoin")
	public String join(BbsPartyVO vo, Model model, HttpSession session) {
		
		MemberPartyVO vo2 = new MemberPartyVO();
		vo2.setMember_id((String)session.getAttribute("member_id"));
		vo2.setParty_host(0);
		vo2.setPartyBbs_num((int)session.getAttribute("partyBbs_num"));

		
		int bbsMemberCount = dao.count2(vo); //현재인원
		int max = dao.one2(vo); // 최대인원
		int already = dao.count3(vo2); //이미 가입한 인원
		
		if(already == 1) {
			return "redirect:chatparty.jsp"; 
		}else {
			if (bbsMemberCount >= max) {
				model.addAttribute("message", "이미 최대 인원에 도달했습니다.");
				return "alert";
			}else {
				dao.insert2(vo2);
				return "redirect:chatparty.jsp";
			}
		}
		
	}*/

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
	

	
	
>>>>>>> party
}
