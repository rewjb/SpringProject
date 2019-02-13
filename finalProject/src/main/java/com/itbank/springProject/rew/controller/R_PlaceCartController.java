package com.itbank.springProject.rew.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.rew.db.R_PlaceCartDAO;
import com.itbank.springProject.rew.db.R_PlanDAO;
import com.itbank.springProject.rew.db.R_PlanDTO;

@Controller
public class R_PlaceCartController {

	@Autowired
	@Qualifier("R_PlaceCartDAO")
	private R_PlaceCartDAO placeCartDAO;
	
	@RequestMapping("rew/TravelPlan")
	public void cartSelectAll(@RequestParam("mid") String mid, Model model ) {
		model.addAttribute("cart_list", placeCartDAO.selectAll(mid));
	}
	
	
}
