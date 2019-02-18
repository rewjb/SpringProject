package com.itbank.springProject.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.springProject.db.MemberDTO;

@Repository("MemberDAO")
public class MemberDAO{
	//DAO == Member테이블 DB를 처리할 수 있는 클래스
	
	@Autowired
	private SqlSession session; 

	public void insert(MemberDTO dto) {
		try {
			session.insert("member.insert", dto);	//member : member.xml 파일의 namespace
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update(MemberDTO dto){
		try {
			session.update("member.update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(MemberDTO dto) throws Exception {
		session.delete("member.delete", dto);
	}
	
	public MemberDTO select(MemberDTO dto) throws Exception {	
		return session.selectOne("member.select", dto);
	}
	
	public List<MemberDTO> selectAll() throws Exception {
		return session.selectList("member.selectAll");
	}
	
}
