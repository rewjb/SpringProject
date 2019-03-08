package com.itbank.springProject.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.springProject.db.CommentDTO;

@Repository("CommentDAO")
public class CommentDAO {

	
	@Autowired
	private SqlSession session;
	
	public void insert(CommentDTO dto) {//댓글 입력 메서드
//		System.out.println("넘버확인 : "+dto.getBnum());
		if (dto.getBnum() == 0) {
//			if (dto.getParents() != null) {//댓글의 부모 존재 유무
//				CommentDTO dto2 = session.selectOne("review.pselect", dto.getParents());
//				dto.setDepth(dto2.getDepth());
//				dto.setBorder(dto2.getBorder()+1);
//				session.selectOne("review.update", dto2);
//			}else{
//				System.out.println("상품아이디확인 : "+dto.getPid());
				int order = session.selectOne("review.selectMax", dto.getPid());
				
//				System.out.println(order);
				dto.setBorder(order);
//			}
			session.insert("review.insert",dto);
		}else {
			session.insert("review.insert",dto);
		}
	}
	
	
	public CommentDTO select(CommentDTO dto) {//댓글 번호를 통한 
		return session.selectOne("review.select", dto);
	}
	
	public List<CommentDTO> selectParents(CommentDTO dto) {
		return session.selectList("review.selectParents", dto);
	}
	
	public double starAvgSelect(String pid) {
		
		return session.selectOne("review.starAvgSelect", pid);
	}
	
	
	
	
	public void insertInsert(CommentDTO dto) {//대댓글 입력 메서드
//		System.out.println("아이디"+dto.getPid());
//		System.out.println("댓글번호"+dto.getBnum());
//		System.out.println("순서"+dto.getBorder());
//		System.out.println("깊이"+dto.getDepth());
//		System.out.println("부모"+dto.getParents());
//		System.out.println("내용"+dto.getContent());
		session.update("review.countUpdate",dto);//댓글들의 순서 업데이트
//		System.out.println("유주빈");
		session.insert("review.insertInsert", dto);//대댓글 삽입
//		System.out.println("조광재");
	}
	
	public int borderSelect(CommentDTO dto) {//특정부모를 갖고있는 댓글의 순서 메서드
		return session.selectOne("review.borderSelect", dto);
	}
	
	public void update(CommentDTO dto) {//댓글 업데이트 
		session.update("review.commentUpdate", dto);
	}
	
	
//	public List<CommentDTO> selectAll() {//댓글 전체 리스트 가져오기
//		return session.selectList("review.selectAll" );
//	}
	
	public List<CommentDTO>  selectPid(String pid) {
		
		return session.selectList("review.selectPid" ,  pid);
	}
	
	
	public void delete(CommentDTO dto) {
		session.delete("review.delete2", dto);
	}
	
	public void deleteOne(CommentDTO dto) {
		session.delete("review.delete1", dto);
	}
	
	
}
