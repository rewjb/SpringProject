package com.itbank.springProject.joe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.springProject.db.AttractionsDAO;
import com.itbank.springProject.db.AttractionsDTO;

@Controller
public class J_AttrController {

	@Autowired
	@Qualifier("AttractionsDAO")
	private AttractionsDAO attractionsDAO;
	
	@RequestMapping("joe/selectPid")
	@ResponseBody
	public AttractionsDTO selectPid(@RequestParam("pid") String pid ) {
		
		System.out.println(pid);
		
		
		return attractionsDAO.select(pid);
	}
	
}
