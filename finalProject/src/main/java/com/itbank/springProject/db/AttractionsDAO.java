package com.itbank.springProject.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("AttractionsDAO")
public class AttractionsDAO {
	
	@Autowired
	private SqlSession session;
	
	public AttractionsDTO select(String id) {//고유 아이디를 통한  select문
		return session.selectOne("attractions.select", id);
	}
	
	public List<AttractionsDTO> selectTag(String continent) {//대륙을 통한  select문
		return session.selectList("attractions.selectCon", continent);
	}
	
	public List<AttractionsDTO> selectCity(String city) {//대륙을 통한  select문
		return session.selectList("attractions.selectCity", city);
	}
	
	public void insert(AttractionsDTO dto) {
		session.insert("attractions.insert", dto);
	}
	
	public List<AttractionsDTO> selectAll() {
		return session.selectList("attractions.selectAll");
	}
	
}
