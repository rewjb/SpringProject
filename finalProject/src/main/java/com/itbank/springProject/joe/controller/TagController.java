package com.itbank.springProject.joe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.db.AttractionsDAO;

@Controller
public class TagController {

	
	@Autowired
	@Qualifier("AttractionsDAO")
	private AttractionsDAO attractionsDAO;
	
	
	@RequestMapping("joe/tagCon")
	public String tagCon(@RequestParam("tag") String continent , Model model) {
		
		model.addAttribute("list", attractionsDAO.selectTag(continent));
		
		return "joe/tag";
	}
	
	@RequestMapping("joe/tagCity")
	public String tagCity(@RequestParam("tag") String city , Model model) {
		
		model.addAttribute("list", attractionsDAO.selectCity(city));
		
		return "joe/tagCity";
	}
	
	
}
