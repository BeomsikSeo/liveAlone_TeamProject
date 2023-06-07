package com.multi.liveAlone.share.messageShare;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MessageShareDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(MessageShareVO bag) {
		my.insert("messageshare.insert", bag);
	}

}
