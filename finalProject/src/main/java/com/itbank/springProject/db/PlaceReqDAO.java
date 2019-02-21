package com.itbank.springProject.db;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("PlaceReqDAO")
public class PlaceReqDAO {

	@Autowired
	SqlSession session;
	
	public void insert(PlaceReqDTO dto) throws Exception{
		session.insert("PlaceReq.insert", dto);
	}
	
	public void delete(String no) throws Exception{
		session.delete("PlaceReq.delete", no);
	}
	
	public List<PlaceReqDTO> selectAll() throws Exception{		
		return session.selectList("PlaceReq.selectAll");
	}
	
	public PlaceReqDTO select(String no) throws Exception{		
		return session.selectOne("PlaceReq.select", no);
	}
	
}
