package com.itbank.springProject.db;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MemberDAO")
public class MemberDAO{
	//DAO == Member테이블 DB를 처리할 수 있는 클래스
	
	@Autowired
	SqlSessionTemplate myBatis;

	public void insert(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		
	}
	
}
