package com.multi.liveAlone.share.bbsShare;

import org.springframework.stereotype.Controller;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;


@Controller
public class BbsShareController {
	@Autowired
	BbsShareDAO dao;

	@RequestMapping("insert")
	public void insert(BbsShareVO bag) {
		System.out.println("insert 요청됨");
		
		String userID = "user01"; //userId session 넣기
		bag.setBbsShareWriter(userID);
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		bag.setBbsShareDate(formatter.format(date));
		
		bag.setBbsShareView(0);
		bag.setBbsShareInterest(0);
		bag.setBbsShareSuccess(false);
		
		dao.insert(bag);
		

	}

	@RequestMapping("update")
	public void update(BbsShareVO bag) {
		System.out.println("update 요청됨");
		System.out.println(bag);
		dao.update(bag);
	}

	@RequestMapping("delete")
	public void delete(String bbsShareNo) {
		System.out.println("delete 요청됨");
		dao.delete(bbsShareNo);
	}

	@RequestMapping("one")
	public void one(String bbsShareNo, Model model) {
		System.out.println("one요청됨.");
		BbsShareVO bag = dao.one(bbsShareNo);
		model.addAttribute("bag", bag);
	}

	@RequestMapping("list")
	public void list(Model model) {
		System.out.println("list요청됨.");
		List<BbsShareVO> list = dao.list();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("success")
	public void success(String bbsShareNo, Model model) {
		System.out.println("success요청됨.");
		dao.success(bbsShareNo);
		model.addAttribute("bbsShareNo", bbsShareNo);
	}

}
