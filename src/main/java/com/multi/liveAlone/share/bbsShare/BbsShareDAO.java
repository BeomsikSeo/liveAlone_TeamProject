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
	BbsShareSearchVO bag2 = new BbsShareSearchVO();
	BbsShareInterestVO bag3 = new BbsShareInterestVO();

	@SuppressWarnings("null")
	public int insert(BbsShareVO bag) {
		System.out.println(bag.toString());
		int result = my.insert("bbsshare.create", bag);
		return result;
	}

	public int delete(String bbsShareNo) {
		int result = my.delete("bbsshare.del", Integer.parseInt(bbsShareNo));
		return result;
	}

	public int update(BbsShareVO bag) {
		int result = my.update("bbsshare.up", bag);
		return result;
	}

	public BbsShareVO one(String bbsShareNo) {
		bag = my.selectOne("bbsshare.one", bbsShareNo);
		return bag;
	}

	public List<BbsShareVO> list(String pageno) {
		List<BbsShareVO> list = my.selectList("bbsshare.notsuccess",Integer.parseInt(pageno));
		return list;
	}
	
	public List<BbsShareVO> listcerti(String pageno,String address) {
		bag2.setPageno(pageno);
		bag2.setAddress(address);
		bag2.setKeyword("x");
		List<BbsShareVO> list = my.selectList("bbsshare.notsuccesscerti",bag2);
		return list;
	}
	
	public int success(String bbsShareNo) {
		int result = my.update("bbsshare.upsuccess", Integer.parseInt(bbsShareNo));
		return result;
	}
	
	
	
	public int upview(String bbsShareNo) {
		int result = my.update("bbsshare.upview", Integer.parseInt(bbsShareNo));
		return result;
	}
	
	public void upinterestup(String bbsShareNo, String member_id) {
		int bbsshareI = Integer.parseInt(bbsShareNo);
		bag3.setVal1(bbsshareI);
		bag3.setVal2(member_id);
		my.update("bbsshare.upinterestup1", bbsShareNo);
		my.update("bbsshare.upinterestup2", bag3);
	}
	
	public void upinterestdown(String bbsShareNo, String member_id) {
		int bbsshareI = Integer.parseInt(bbsShareNo);
		bag3.setVal1(bbsshareI);
		bag3.setVal2(member_id);

		System.out.println(bbsShareNo);
		System.out.println(member_id);
		my.update("bbsshare.upinterestdown1", bbsShareNo);
		my.update("bbsshare.upinterestdown2", bag3);
	}
	
	public String checkinterest(String bbsShareNo, String member_id) {
		bag2.setPageno(bbsShareNo);
		bag2.setAddress(member_id);
		bag2.setKeyword("x");
		String result = my.selectOne("bbsshare.checkinterest", bag2);
		return result;
	}
	

}
