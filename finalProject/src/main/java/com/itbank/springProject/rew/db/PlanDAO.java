package com.itbank.springProject.rew.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class PlanDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<PlaceCartDTO> selectAll(String mid){
		return session.selectList("Plan.selectAllById",mid);
	}
	

}
