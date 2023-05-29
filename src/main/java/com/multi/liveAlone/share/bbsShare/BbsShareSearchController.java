package com.multi.liveAlone.share.bbsShare;

import org.springframework.stereotype.Controller;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.liveAlone.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BbsShareSearchController {
	@Autowired
	BbsShareSearchDAO dao;
	
	@Autowired
	BbsShareDAO dao2;

	@RequestMapping("share/bbsShare/search")
	public String searchA(String keyword,String pageno, Model model, RedirectAttributes redirectAttributes) {
		System.out.println("search요청됨.");
		if(pageno == null) {pageno = "1";}
		if ("".equals(keyword)) { //빈칸 검색시 리스트 1페이지로
			List<BbsShareVO> list = dao2.list("1");
	            model.addAttribute("list", list);
	            System.out.println("empty 검색 실행");
	            return "redirect:/share/bbsShare/list?pageno=1";
		}
		
		List<BbsShareVO> list = dao.search(keyword, pageno);
		if (list.isEmpty()) {
			// list가 empty인 경우
	        model.addAttribute("message", "검색 결과가 없습니다.");
	        return "share/bbsShare/search";
		} else {
			// list가 empty가 아닌 경우
			model.addAttribute("list", list);
			return "share/bbsShare/search";
		}
	}

	/*
	 * @RequestMapping("share/bbsShare/search") public String search(String keyword,
	 * String pageno, Model model, RedirectAttributes redirectAttributes) {
	 * System.out.println("search요청됨."); if (pageno == null) { pageno = "1"; }
	 * List<BbsShareVO> list = dao.search(keyword, pageno); int x =
	 * Integer.parseInt(pageno) - 1; if (list.isEmpty()) { // list가 empty인 경우
	 * redirectAttributes.addFlashAttribute("message", "검색 결과가 없거나 잘못된 페이지입니다");
	 * return "redirect:/share/bbsShare/search?pageno=" + x; } else { // list가
	 * empty가 아닌 경우 model.addAttribute("search", list); return
	 * "share/bbsShare/search"; } }
	 */

}
