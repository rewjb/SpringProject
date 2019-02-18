package com.itbank.springProject.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("PlaceCartDAO")
public class PlaceCartDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<PlaceCartDTO> selectCartAll(String mid){
		return session.selectList("PlaceCart.selectCartAll",mid);
	}
	
	//번외 메서드입니다.
	public List<String> selectPlanNameAll(String mid){
		return session.selectList("Plan.selectPlanNameAll",mid);
	}
	

}
