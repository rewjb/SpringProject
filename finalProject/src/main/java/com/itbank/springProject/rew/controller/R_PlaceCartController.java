package com.itbank.springProject.rew.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.db.PlaceCartDAO;
import com.itbank.springProject.db.PlanDAO;
import com.itbank.springProject.db.PlanDTO;
import com.itbank.springProject.db.ShareProjectDAO;

@Controller
public class R_PlaceCartController {

	@Autowired
	@Qualifier("PlaceCartDAO")
	private PlaceCartDAO placeCartDAO;
	
	@Autowired
	@Qualifier("ShareProjectDAO")
	private ShareProjectDAO shareProjectDAO;
	
	@RequestMapping("rew/TravelPlan")
	public void cartSelectAll(@RequestParam("mid") String mid, Model model ) {
		model.addAttribute("project_list", placeCartDAO.selectPlanNameAll(mid));
		model.addAttribute("cart_list", placeCartDAO.selectCartAll(mid));
		model.addAttribute("projectShare_list", shareProjectDAO.selectAllShareProjectById(mid));
	}
	
	
}
