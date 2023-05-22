package com.multi.liveAlone.party.voyage;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.Random;

@Component
public class VoyageDAO {
		
	@Autowired
		SqlSessionTemplate my; 
		
		
		public void delete(String id) {
			int result = my.delete("recommend.del", id); //int
			System.out.println(result);
		}
		public void update(VoyageVO bag) {
			int result = my.update("voyage.up", bag); //bag
			System.out.println(result);
		}
		 public void updateBasket(VoyageVO bag) {
		        int result = my.update("voyage.updateBasket", bag);
		        System.out.println(result);
		    }
		
		public VoyageVO one(String name) {
			VoyageVO vo = my.selectOne("voyage.one", name); 
			System.out.println(vo);
			return vo;
		}
		
		public List<VoyageVO> list() {
			List<VoyageVO> list = my.selectList("voyage.all"); 
			System.out.println(list.size());
			return list;
		}

		public List<String> getRandomNames(int count) {
		    List<String> randomNames = new ArrayList<>();
		    Random random = new Random();
		    for (int i = 0; i < count; i++) {
		        int index = random.nextInt(this.list().size());
		        randomNames.add(this.list().get(index).getName());
		    }
		    return randomNames;
		}
		}

