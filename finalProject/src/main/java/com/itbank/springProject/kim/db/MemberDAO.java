package com.itbank.springProject.kim.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.springProject.MemberDTO;

@Repository("MemberDAO")
public class MemberDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<MemberDTO> selectAll(){
		return session.selectList("Member.selectAll");
	}
	
	

}
