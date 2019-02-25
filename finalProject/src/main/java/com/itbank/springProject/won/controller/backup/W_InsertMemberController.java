package com.itbank.springProject.won.controller.backup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.springProject.db.MemberDAO;
import com.itbank.springProject.db.MemberDTO;

@Controller
public class W_InsertMemberController {

	@Autowired
	MemberDAO dao;
	
	@RequestMapping("won/insertMember.do")
	public void insert(MemberDTO memberDTO) throws Exception {
		dao.insert(memberDTO);
	}
}
