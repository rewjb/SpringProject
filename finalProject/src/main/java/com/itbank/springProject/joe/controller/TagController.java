package com.itbank.springProject.joe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.db.AttractionsDAO;
import com.itbank.springProject.db.AttractionsDTO;

@Controller
public class TagController {

	
	@Autowired
	@Qualifier("AttractionsDAO")
	private AttractionsDAO attractionsDAO;
	
	
	@RequestMapping("joe/tagCon")
	public String tagCon(@RequestParam("tag") String continent , Model model , @RequestParam("page") String page) {
		if (page !=null) {
			page = "0";
		}
		model.addAttribute("page", page);
		model.addAttribute("list", attractionsDAO.selectTag(continent));
		
		return "joe/tag";
	}
	
	@RequestMapping("joe/tagCity")
	public String tagCity(@RequestParam("tag") String city , Model model ) {
		
		model.addAttribute("list", attractionsDAO.selectCity(city));
		
		return "joe/tagCity";
	}
	
	@RequestMapping("joe/attList")
	public String attList(AttractionsDTO attractionsDTO , Model model  ) {
		
		if (attractionsDTO.getContinent() != "" && attractionsDTO.getCity() != "" && attractionsDTO.getCategory() != "" ) {
			System.out.println("3가지 ");
			model.addAttribute("list", attractionsDAO.selectThree(attractionsDTO)) ;
		}else if(attractionsDTO.getContinent() != "" && attractionsDTO.getCity() != "" && attractionsDTO.getCategory() == ""){
			model.addAttribute("list", attractionsDAO.selectSecond(attractionsDTO))  ;
		}else if(attractionsDTO.getContinent() != "" && attractionsDTO.getCity() == "" && attractionsDTO.getCategory() == ""){
			model.addAttribute("list", attractionsDAO.selectFirst(attractionsDTO)) ;
		}
		
			System.out.println("태그"+attractionsDTO.getCategory());
			System.out.println("도시"+attractionsDTO.getCity());
			System.out.println("대륙"+attractionsDTO.getContinent());
		return "joe/attList";
	}
	
	@RequestMapping("joe/allList")
	public String allList(Model model ,@RequestParam("page") String page) {
		System.out.println("넘어왔니?????");
		System.out.println(page);
		model.addAttribute("page", page);
		model.addAttribute("list", attractionsDAO.selectAll());
		return "joe/attList";
	}
	
	@RequestMapping("joe/firstButton")
	public String firstButton(Model model ,@RequestParam("page") String page) {
	
		System.out.println("첫번째 넘어왔니");
		model.addAttribute("page", page);
		
		return "joe/attList";
	}
	@RequestMapping("joe/thirdButton")
	public String thirdButton(Model model ,@RequestParam("page") String page) {
		System.out.println("세번째 넘어왔니");
		model.addAttribute("page", page);
		
		return "joe/attList";
	}
	
}
