package com.multi.liveAlone;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate my;
	
	MemberVO bag = new MemberVO();

	public int certi(String member_id) {
		int result = my.update("member.upcerti", member_id);
		return result;
	}
	
	public MemberVO getaddress(String member_id) {
		bag = my.selectOne("member.one", member_id);
		return bag;
	}
	
	/*public MemberVO one(String id) {
		bag = my.selectOne("member.one", id);
		return bag;
	}*/
}
