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
		/*
		 * ChatPartyVO vo = new ChatPartyVO(); vo.setPartyBbs_num(partyBbs_num);
		 */
		return my.selectList("bbsParty.chatAll", partyBbs_num);
	}
	
	public int count() {
		return my.selectOne("bbsParty.count");
	}                                                               
	public BbsPartyVO one(BbsPartyVO vo) {
		return my.selectOne("bbsParty.one", vo);
	}                                                               
	public int insert(BbsPartyVO vo) {
		return my.insert("bbsParty.in", vo);
	}
	public int insert2(MemberPartyVO vo) {
		return my.insert("bbsParty.in2", vo);
	}
	public int up(BbsPartyVO vo) {
		return my.update("bbsParty.up", vo);
	}
	public int del(BbsPartyVO vo) {
		return my.delete("bbsParty.del", vo);
	}

}
