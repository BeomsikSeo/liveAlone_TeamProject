package com.multi.liveAlone.rice.mileage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MileageDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<MileageVOPage> selectMileagePage(MileageVOInfo page) {
		return my.selectList("mileage.selectMileagePage", page);
	}

	
	public void insertMileageHistory(MileageVO mileageVO) {
		my.insert("mileage.insertMileageHistory", mileageVO);
	}
}
