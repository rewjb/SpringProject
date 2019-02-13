package com.itbank.springProject;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


public class MemberDAO {
	
	private SqlSession session = new SqlSessionTemplate(null);
	ArrayList<String> temp;
	
	public void insert(MemberDTO memberDTO){
		session.insert("member.insertMember", memberDTO);
	}
	
	public void name() {
		temp = new ArrayList<>();
	}
}
