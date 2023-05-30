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
	
	// 유저 정보를 가지고 옵니다.
	public MemberVO selectOne(String memberID) {
		MemberVO memberInfo= my.selectOne("member.one", memberID);
		
		return memberInfo;
	}

	
	public void updateUserMileage(MemberVO member) {
		my.update("member.updateUserMileage", member);
	}
	
	public int login(MemberVO bag) {
		int result = my.selectOne("member.login", bag.getMember_id());
		System.out.println("로그인 결과는?! : " + result);
		return result;
	}
}

