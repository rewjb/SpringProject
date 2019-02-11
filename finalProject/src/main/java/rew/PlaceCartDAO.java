package rew;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.springProject.MemberDTO;

@Repository("PlaceCartDAO")
public class PlaceCartDAO {
	
	@Autowired
	private SqlSession session;
	
//	public void insert(MemberDTO memberDTO){
//	session.insert("member.insertMember", memberDTO);
//}
	

}
