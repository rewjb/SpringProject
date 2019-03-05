package com.itbank.springProject.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ShareProjectDAO")
public class ShareProjectDAO {

	@Autowired
	private SqlSession session;

	public int insertShareProject(ShareProjectDTO shareProjectDTO) {
		return session.insert("ShareProject.insertShareProject", shareProjectDTO);
	}
	
	public List<String> selectAllShareProjectById(String mid) {
		return session.selectList("ShareProject.selectAllById",mid);
	}
	
	public List<ShareProjectDTO> selectAllShareProjectByManyId(List<ShareProjectDTO> list) {
		return session.selectList("ShareProject.selectAllShareProjectByManyId",list);
	}
	
	public int deleteOneShareProject(PlanDTO planDTO) {
		return session.insert("ShareProject.deleteOneShareProject", planDTO);
	}

}
