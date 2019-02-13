package com.itbank.springProject.rew.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.springProject.MemberDTO;

@Repository("R_PlaceCartDAO")
public class R_PlaceCartDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<R_PlaceCartDTO> selectAll(String mid){
		return session.selectList("PlaceCart.selectAll",mid);
	}
	
	

}
