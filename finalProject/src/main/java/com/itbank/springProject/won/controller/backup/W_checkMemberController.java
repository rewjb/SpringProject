package com.itbank.springProject.won.controller.backup;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.springProject.db.MemberDAO;
import com.itbank.springProject.db.MemberDTO;


//@Controller
public class W_checkMemberController {
	
//	@Autowired
	MemberDAO dao;
	
//	@RequestMapping("won/checkMember.do")
	public String test(MemberDTO memberDTO, Model model, HttpSession session) throws Exception {
		//넘어온 아이디 확인
		System.out.println(memberDTO.getMid());
		System.out.println(memberDTO.getMname());
		System.out.println(memberDTO.getMprofile());
		//id값으로 조회
		MemberDTO dto=dao.select(memberDTO);
		if(dto == null){
		//값이 없는경우
			System.out.println("return won/askSignup");
			model.addAttribute("dto", dto);
			return "won/askSignup";
			
		}else{
		//값이 있는경우
			System.out.println("return won/successSignin");
			session.setAttribute("mid", dto.getMid());
			return "won/successSignin";
		}
	
	}
}
