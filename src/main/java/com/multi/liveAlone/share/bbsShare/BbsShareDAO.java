package com.multi.liveAlone.share.bbsShare;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsShareDAO {
	
	@Autowired
	SqlSessionTemplate my;

	BbsShareVO bag = new BbsShareVO();

	public int insert(BbsShareVO bag) {
		int result = my.insert("bbsshare.create", bag);
		return result;
	}

	public int delete(String id) {
		int result = my.delete("bbsshare.del", id);
		return result;
	}

	public int update(BbsShareVO bag) {
		int result = my.update("bbsshare.up", bag);
		return result;
	}

	public BbsShareVO one(String id) {
		bag = my.selectOne("bbsshare.one", id);
		return bag;
	}

	public List<BbsShareVO> list() {
		List<BbsShareVO> list = my.selectList("bbsshare.all");
		System.out.println(list.size());
		return list;
	}
}
