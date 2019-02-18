package com.itbank.springProject.joe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.springProject.db.AttractionsDAO;
import com.itbank.springProject.db.PlaceCartDAO;
import com.itbank.springProject.db.PlaceCartDTO;

@Controller
public class J_CartController {


	@Autowired
	@Qualifier("PlaceCartDAO")
	private PlaceCartDAO placeCartDAO;
	
	@Autowired
	@Qualifier("attractionsDAO")
	private AttractionsDAO attractionsDAO;
	
	
	@RequestMapping("cartInsert")
	public String cartInsert(PlaceCartDTO placeCartDTO ,Model model) {
		placeCartDAO.cartInsert(placeCartDTO);
		model.addAttribute("dto", attractionsDAO.select(placeCartDTO.getPid()));
		return "j_cart";
	}
	
	
}
