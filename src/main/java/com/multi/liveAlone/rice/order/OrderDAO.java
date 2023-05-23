package com.multi.liveAlone.rice.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrderDAO {

	@Autowired
	SqlSessionTemplate my;
	
	
	// 주문 내역을 넣습니다.
	public void insertOrder(List<OrderVO> list) {
		for(int i=0; i < list.size(); i++) {
			my.insert("order.insertOrder", list.get(i));
		}
	}
	
}
