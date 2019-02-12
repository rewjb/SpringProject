package com.itbank.springProject.rew.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("PlanDAO")
public class PlanDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<PlanDTO> selectAllById(PlanDTO planDTO){
		return session.selectList("Plan.selectAllById",planDTO);
	}
	

}
