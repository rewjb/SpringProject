package com.itbank.springProject.joe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.springProject.db.PlaceCartDAO;
import com.itbank.springProject.db.PlaceCartDTO;

@Controller
public class J_CartController {


	@Autowired
	@Qualifier("PlaceCartDAO")
	private PlaceCartDAO placeCartDAO;
	
	@Autowired
	
	
	
	@RequestMapping("cartInsert")
	public String cartInsert(PlaceCartDTO placeCartDTO) {
		placeCartDAO.cartInsert(placeCartDTO);
		return "j_cart";
	}
	
	
}
