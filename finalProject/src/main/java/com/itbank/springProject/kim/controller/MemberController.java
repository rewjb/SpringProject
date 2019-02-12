package com.itbank.springProject.kim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.kim.db.MemberDAO;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("MemberDAO")
	private MemberDAO memberDAO;

	@RequestMapping("kim/selectAllMember")
	public void memberSelectAll(Model model) {
		model.addAttribute("list", memberDAO.selectAll());
	}

}
