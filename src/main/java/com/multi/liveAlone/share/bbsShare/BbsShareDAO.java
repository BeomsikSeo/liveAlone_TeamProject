package com.multi.liveAlone.share.bbsShare;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class BbsShareDAO {
	@Autowired
	SqlSessionTemplate my;

	BbsShareVO bag = new BbsShareVO();

	public int insert(BbsShareVO bag) {
		int result = my.insert("member.create", bag);
		// namespace . id
		return result;
	}

	public int delete(String id) {
		int result = my.delete("member.del", id);
		return result;
	}

	public int update(BbsShareVO bag) {
		int result = my.update("member.up", bag);
		return result;
	}

	public BbsShareVO one(String id) {
		bag = my.selectOne("member.one", id);
		return bag;
	}

//	public int login(BbsShareVO bag) {
//		return result;
//	}
//
	public List<BbsShareVO> list() {
		List<BbsShareVO> list = my.selectList("member.all");
		System.out.println(list.size());
		return list;
	}
}
