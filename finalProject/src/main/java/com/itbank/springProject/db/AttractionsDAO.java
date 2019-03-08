package com.itbank.springProject.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("AttractionsDAO")
public class AttractionsDAO {//관광명소 DAO
	
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
	
	public void insert(AttractionsDTO dto) {//최초의 크롤링시 관관명소 insert문
		session.insert("attractions.insert", dto);
	}
	
	public List<AttractionsDTO> selectAll() {//모든 관광명소 select문
		return session.selectList("attractions.selectAll");
	}
	
	public  List<AttractionsDTO> selectThree(AttractionsDTO dto) {//대륙 도시 태그 3개조건을 다만족하는 경우의 select문
		return session.selectList("attractions.selectThree", dto);
	}
	
	public  List<AttractionsDTO> selectSecond(AttractionsDTO dto) {//대륙 도시 2개조건을 만족하는 경우의 select문
		return session.selectList("attractions.selectSecond", dto);
		
	}
	
	public  List<AttractionsDTO> selectFirst(AttractionsDTO dto) {//대륙 1개조건을 만족하는 경우의 select문
		return session.selectList("attractions.selectFirst", dto);
		
	}
	
	public AttractionsDTO selectImg(String id) {//이미지를 통한  select문
		return session.selectOne("attractions.selectImg", id);
	}
	
	
	public List<AttractionsDTO> searchSelect(String text) {//검색을 통한 리스트
		return session.selectList("attractions.searchSelect", text);
	}
	
	public void starUpdate(AttractionsDTO dto) {//댓글에 별점이 추가될때마다 별점 평균 업데이트
		session.update("attractions.starUpdate", dto);
	}
	
	
	
}
