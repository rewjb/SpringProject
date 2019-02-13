package com.itbank.springProject.kim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


public class MemberController {

	@Autowired
	@Qualifier("MemberDAO")

	@RequestMapping("kim/selectAllMember")
	public void memberSelectAll(Model model) {
	}

}
