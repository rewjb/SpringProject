package com.itbank.springProject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {
	
	@Autowired
	private SqlSession session;
	
	public void insert(MemberDTO memberDTO){
		session.insert("member.insertMember", memberDTO);
	}
}
