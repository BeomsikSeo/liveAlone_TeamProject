package com.multi.liveAlone;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberDAO {
	@Autowired
	SqlSessionTemplate my;

	public int certi(String member_id) {
		int result = my.update("member.upcerti", member_id);
		return result;
	}
}
