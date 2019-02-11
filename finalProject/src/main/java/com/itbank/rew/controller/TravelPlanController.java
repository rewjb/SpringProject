package com.itbank.rew.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.rew.db.PlaceCartDAO;

@Controller
public class TravelPlanController {
	
	@Autowired
	@Qualifier("PlaceCartDAO")
	private PlaceCartDAO placeCartDAO;
	
	@RequestMapping
	public void aa(){
		
	}
	
	
	

}
