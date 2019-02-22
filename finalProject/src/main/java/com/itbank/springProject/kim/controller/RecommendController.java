package com.itbank.springProject.kim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.springProject.db.TagDAO;

@Controller
public class RecommendController {

	@Autowired
	@Qualifier("TagDAO")
	TagDAO dao1;
	
	@RequestMapping("kim/Tag_Select")
	public String move(){
		System.out.println("태그셀렉");
		return "tagSelect";
	}
}
