package com.multi.liveAlone.rice.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.liveAlone.rice.food.FoodVO;
import com.multi.liveAlone.rice.ticket.TicketVO;

@Repository
public class OrderDAO {

	@Autowired
	SqlSessionTemplate my;
	
	
	public List<FoodVO> showMenu(int storeNo) {
		List<FoodVO> list = my.selectList("order.showMenu",storeNo);
	
		return list;
	}
	
	
	public void insertOrder(List<OrderVO> list, int no) {
		for(int i=0; i < list.size(); i++) {
			list.get(i).setTicket_ID(no);
			
			my.insert("order.insertOrder", list.get(i));
		}
	}
	
	
}
