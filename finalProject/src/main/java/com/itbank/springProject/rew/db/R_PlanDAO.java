package com.itbank.springProject.rew.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("R_PlanDAO")
public class R_PlanDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<R_PlanDTO> selectAllById(R_PlanDTO planDTO){
		return session.selectList("R_Plan.selectAllById",planDTO);
	}
	

}
