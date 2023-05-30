package com.multi.liveAlone.party.bbsParty;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsPartyDAO {
	@Autowired
	SqlSessionTemplate my;


	public List<BbsPartyVO> all(PagePartyVO vo) {
		return my.selectList("bbsParty.all", vo);
	}

	public List<ChatPartyVO> chatAll(int partyBbs_num) {

		return my.selectList("bbsParty.chatAll", partyBbs_num);
	}
	public List<MemberPartyVO> memList(BbsPartyVO vo) {
		return my.selectList("bbsParty.memList", vo);
	}                                                               
	
	public int count() {
		return my.selectOne("bbsParty.count");
	}                                                               
	public int count2(BbsPartyVO vo) {
		return my.selectOne("bbsParty.count2", vo);
	}                                                               
	public int count3(MemberPartyVO vo) {
		return my.selectOne("bbsParty.count3", vo);
	}                                                               
	public int count4(MemberPartyVO vo) {
		return my.selectOne("bbsParty.count4", vo);
	} //blacklist에 올라가 있는지 확인                                                           
	public BbsPartyVO one(BbsPartyVO vo) {
		return my.selectOne("bbsParty.one", vo);
	}                                                               
	public int one2(BbsPartyVO vo) {
		return my.selectOne("bbsParty.one2", vo);
	}                                                               
	public int insert(BbsPartyVO vo) {
		return my.insert("bbsParty.in", vo);
	}
	public int insert2(MemberPartyVO vo) {
		return my.insert("bbsParty.in2", vo);
	}
	public int insert3(ChatPartyVO vo) {
		return my.insert("bbsParty.in3", vo);
	}
	public int insert4(MemberPartyVO vo) {
		return my.insert("bbsParty.in4", vo);
	}//black list 추가
	public int up(BbsPartyVO vo) {
		return my.update("bbsParty.up", vo);
	}
	public int del(BbsPartyVO vo) {
		return my.delete("bbsParty.del", vo);
	}
	public int del2(BbsPartyVO vo) {
		return my.delete("bbsParty.del2", vo);
	}
	public int del3(BbsPartyVO vo) {
		return my.delete("bbsParty.del3", vo);
	}
	public int del4(MemberPartyVO vo) {
		return my.delete("bbsParty.del4", vo);
	}// 파티 멤버에서 제외
	public int del5(BbsPartyVO vo) {
		return my.delete("bbsParty.del5", vo);
	}

}
