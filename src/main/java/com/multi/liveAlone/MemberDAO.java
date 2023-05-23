package com.multi.liveAlone;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	// 유저 정보를 가지고 옵니다.
	public MemberVO selectOne(String memberID) {
		MemberVO memberInfo= my.selectOne("member.one", memberID);
		
		return memberInfo;
	}
}
