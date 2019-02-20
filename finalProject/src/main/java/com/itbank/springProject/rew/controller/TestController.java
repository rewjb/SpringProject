package com.itbank.springProject.rew.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.springProject.db.MongoTestDAO;

@Controller
public class TestController {
	
	
	@Autowired
	@Qualifier("MongoTestDAO")
	MongoTestDAO mongoTestDAO;
	
	
	@RequestMapping("rew/test")
	public void test(){
		
		mongoTestDAO.mongoTest();
		
	}
	

}
