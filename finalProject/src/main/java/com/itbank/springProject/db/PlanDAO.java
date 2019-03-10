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
	public int insertProjectData(List<PlanDTO> planList){
		
		int check = 1;
		
		for (int i = 0; i < planList.size(); i++) {
			
			if (session.insert("Plan.insertProjectData", planList.get(i))==0) {
				check = 0;
				break;
			}else {
				check = 1;
			}
		}
		return check;
	}
	
	//계획서 삭제
	public int deleteProjectData(PlanDTO planDTO){
		return session.insert("Plan.deleteAllById", planDTO);
	}
	
	public List<PlanDTO> selectAllPid(ShareProjectDTO shareProjectDTO){
		return session.selectList("Plan.selectAllPid", shareProjectDTO);
	}
	
}
