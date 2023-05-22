package com.multi.liveAlone.party.voyage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class VoyageController {
	 

		@Autowired
		VoyageDAO dao; 
		
		
		@RequestMapping("delete")
		public void delete(String name) {
			System.out.println(name);
			dao.delete(name);
		}
		@RequestMapping("update")
		public void update(VoyageVO bag) {
		    System.out.println(bag);
		    dao.update(bag);
		}
		@RequestMapping("updatebasket")
	    @ResponseBody
	    public void updateBasket(String member_id, String lat, String longi) {
	        VoyageVO bag = new VoyageVO();
	        bag.setMember_id(member_id);
	        bag.setLat(lat);
	        bag.setLongi(longi);
	        dao.updateBasket(bag);
	    }
		@RequestMapping("one")
		public void one(String name, Model model) {
			System.out.println(name);
			VoyageVO vo = dao.one(name); //vo
			//views아래까지 전달할 데이터를 model객체를 이용해서
			//속성으로 지정해주세요.
			model.addAttribute("vo", vo); //속성으로 지정
		}
		
		@RequestMapping("list")
		public void list(Model model) {
			List<VoyageVO> list = dao.list();
			//views아래까지 전달할 데이터를 model객체를 이용해서
			//속성으로 지정해주세요.
			model.addAttribute("list", list); //속성으로 지정
		}
		
		
		@RequestMapping("randomNames")
		public String getRandomNames(Model model) {
		    List<String> randomNames = dao.getRandomNames(5); // 5개의 이름 가져오기
		    System.out.println("randomNames  : "+randomNames );
		    model.addAttribute("randomNames", randomNames);
		    return "voyage";
		}
	}

