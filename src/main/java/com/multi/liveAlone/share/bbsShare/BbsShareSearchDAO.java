package com.multi.liveAlone.share.bbsShare;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsShareSearchDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	BbsShareSearchVO bag = new BbsShareSearchVO();
	
	
	
	public List<BbsShareVO> search(String keyword, String pageno) {
		bag.setKeyword(keyword);
		bag.setPageno(pageno);
		bag.setAddress("x");
		List<BbsShareVO> result = my.selectList("bbsshare.search", bag);
		return result;
	}
	
	public List<BbsShareVO> searchcerti(String keyword, String pageno, String address) {
		bag.setKeyword(keyword);
		bag.setPageno(pageno);
		bag.setAddress(address);
		List<BbsShareVO> result = my.selectList("bbsshare.searchcerti", bag);
		return result;
	}
}
