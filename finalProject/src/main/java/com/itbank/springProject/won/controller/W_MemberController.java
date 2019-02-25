package com.itbank.springProject.won.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.db.MemberDAO;
import com.itbank.springProject.db.MemberDTO;

@Controller
public class W_MemberController{
	
	@Autowired
	@Qualifier("MemberDAO")
	MemberDAO memberDAO;
	
	//회원가입
	@RequestMapping("won/insertMember")
	public String insertMember(MemberDTO memberDTO){
		try {
			memberDAO.insert(memberDTO);
			return "won/insertM";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:signup.jsp";
		}
	}
	
	//정보수정
	@RequestMapping("won/updateMember")
	public String updateMember(MemberDTO memberDTO){
		try {
			memberDAO.update(memberDTO);
			return "won/updateM";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:mypage.jsp";
		}
	}
	
	//회원탈퇴
	@RequestMapping("won/deleteMember")
	public String deleteMember(@RequestParam("mid") String mid){
		try {
			memberDAO.delete(mid);
			return "won/deleteM";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:mypage.jsp";
		}
	}
	
	//로그인을 위한 확인
	@RequestMapping("won/login")
	public String selectIdPw(MemberDTO memberDTO){
		try {
			memberDAO.select(memberDTO);
			return "won/login";
		} catch (Exception e) {
			return "";
		}
	}
	
	
	//계정 수정을 위한 본인확인
	@RequestMapping("won/selectMember")
	public String selectMember(
			@RequestParam("mid") String mid,
			Model model)
	{
		
		return "won/selectM";
	}
	
}
