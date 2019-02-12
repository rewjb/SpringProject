package com.itbank.springProject.won.db;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("test.hn")
public class TestDAO {
	
	@Autowired
	private SqlSession session;
	
	public void insert(){
		System.out.println("테스트");
	}
}
