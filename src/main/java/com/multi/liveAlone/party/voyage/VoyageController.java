package com.multi.liveAlone.party.voyage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class VoyageController {
	 

		@Autowired
		VoyageDAO dao; 
		
		
	
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
		@RequestMapping("deleteselect")
		public void deleteSelect(String member_id,String select) {
			VoyageVO bag = new VoyageVO();
		    bag.setMember_id(member_id);
		    bag.setSelect(select);
		    dao.deleteSelect(bag);
		}
		@RequestMapping(value = "insertselect", method = RequestMethod.POST)
		@ResponseBody
		public void insertSelect(String member_id, String select) {
		    VoyageVO bag = new VoyageVO();
		    bag.setMember_id(member_id);
		    bag.setSelect(select);
		    dao.insertSelect(bag);
		    
		}
		@RequestMapping("oneselect")
		public void oneSelect(String member_id, Model model) {
			System.out.println(member_id);
			VoyageVO vo = dao.oneselect(member_id); //vo
			//views아래까지 전달할 데이터를 model객체를 이용해서
			//속성으로 지정해주세요.
			model.addAttribute("vo", vo); //속성으로 지정
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

