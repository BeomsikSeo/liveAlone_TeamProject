package com.multi.liveAlone;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.liveAlone.share.bbsShare.BbsShareVO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	MemberVO bag = new MemberVO();

	public int certi(String member_id) {
		int result = my.update("member.upcerti", member_id);
		return result;
	}
	
	public MemberVO one(String member_id) {
		bag = my.selectOne("member.one", member_id);
		return bag;
	}
	
	// 유저 정보를 가지고 옵니다.
	public MemberVO selectOne(String memberID) {
		bag= my.selectOne("member.one", memberID);
		
		return bag;
	}

	
	public void updateUserMileage(MemberVO member) {
		my.update("member.updateUserMileage", member);
	}
	
	public MemberVO login(String member_id) {
		bag = my.selectOne("member.login", member_id);
		return bag;
	}
	
	public int checkid(String member_id) {
		int result = my.selectOne("member.checkid",member_id);
		return result;
		}
	
	public int checknick(String nickname) {
		int result = my.selectOne("member.checknick",nickname);
		return result;
		}
	
	public int signup(MemberVO bag) {
		int result = my.insert("member.signup", bag);
		return result;
	}
}

