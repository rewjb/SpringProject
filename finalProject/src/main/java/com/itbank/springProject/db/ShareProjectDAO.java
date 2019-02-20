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
	
	public List<ShareProjectDTO> selectAllShareProjectById(String mid) {
		
		List<ShareProjectDTO> list = session.selectList("ShareProject.insertShareProject",mid);
		
		for (int i = 0; i < list.size(); i++) {
			
		}
		
		return null;
	}

}
