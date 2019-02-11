package com.itbank.springProject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public class MemberDAO {
	
	private SqlSession session = new SqlSessionTemplate(null);
	
	
	public void insert(MemberDTO memberDTO){
		session.insert("member.insertMember", memberDTO);
	}
}
