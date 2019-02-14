package com.itbank.springProject.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("PlanDAO")
public class PlanDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<PlanDTO> selectAllById(PlanDTO planDTO){
		
		//System.out.println("dao에서 받는 값="+planDTO.getMid());
		//System.out.println("dao에서 받는 값="+planDTO.getPtitle());
	    //ajax로 넘어오는 값 확인용..	
		return session.selectList("Plan.selectAllById", planDTO);
	}
	
}