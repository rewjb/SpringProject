package com.itbank.springProject.joe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TagController {

	
	@RequestMapping("joe/tagCon")
	public String tagCon(@RequestParam("tag") String qt) {
		
		System.out.println(qt);
		
		return null;
	}
	
	
}
