package com.itbank.springProject.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("PlanDAO")
public class PlanDAO {
	
	@Autowired
	private SqlSession session;
	
	// 아이디에 해당하는 계획서 갖고오기
	public List<PlanDTO> selectAllById(PlanDTO planDTO){
		//System.out.println("dao에서 받는 값="+planDTO.getMid());
		//System.out.println("dao에서 받는 값="+planDTO.getPtitle());
	    //ajax로 넘어오는 값 확인용..	
		return session.selectList("Plan.selectAllById", planDTO);
	}
	
	// 계획서 저장하기
	public int insertProjectData(PlanDTO planDTO){
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
		return session.insert("Plan.insertProjectData", planDTO);
	}
	
	//계획서 삭제
	public int deleteProjectData(PlanDTO planDTO){
		return session.insert("Plan.deleteAllById", planDTO);
	}
	
}
