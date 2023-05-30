package com.multi.liveAlone.party.voyage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Random;
import java.util.Set;

@Component
public class VoyageDAO {
		
	@Autowired
		SqlSessionTemplate my; 
		
		
	
		public void update(VoyageVO bag) {
			int result = my.update("voyage.up", bag); //bag
			System.out.println(result);
		}
		 public void updateBasket(VoyageVO bag) {
		        int result = my.update("voyage.updateBasket", bag);
		        System.out.println(result);
		    }
		 public void insertSelect(VoyageVO bag) {
			    int result = my.insert("voyage.insertSelect", bag);
			    System.out.println(result);
			} 
		 public void deleteSelect(VoyageVO bag) {
		    int result=my.delete("voyage.deleteSelect", bag);
		   System.out.println(result);
		  }
		
		public VoyageVO one(String name) {
			VoyageVO vo = my.selectOne("voyage.one", name); 
			System.out.println(vo);
			return vo;
		}
		public VoyageVO oneselect(String member_id) {
			VoyageVO vo = my.selectOne("voyage.oneSelect", member_id); 
			System.out.println(vo);
			return vo;
		}
		
		public List<VoyageVO> list() {
			List<VoyageVO> list = my.selectList("voyage.all"); 
			System.out.println(list.size());
			return list;
		}

		public List<String> getRandomNames(int count) {
		    Set<String> randomNames = new HashSet<>();
		    Random random = new Random();

		    while (randomNames.size() < count) {
		        int index = random.nextInt(this.list().size());
		        randomNames.add(this.list().get(index).getName());
		    }

		    return new ArrayList<>(randomNames);
		}
		public List<String> getButtonName(String member_id) {
		    return my.selectList("voyage.getButtonName", member_id);
		}
		
		
		}

