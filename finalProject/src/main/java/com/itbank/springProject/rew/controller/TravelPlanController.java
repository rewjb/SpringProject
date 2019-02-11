package com.itbank.springProject.rew.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.rew.db.PlaceCartDAO;
import com.itbank.springProject.rew.db.PlaceCartDTO;

@Controller
public class TravelPlanController {

	@Autowired
	@Qualifier("PlaceCartDAO")
	private PlaceCartDAO placeCartDAO;

	@RequestMapping("rew/TravelPlan")
	public void placeCartSelectAll(@RequestParam("mid") String mid, Model model) {
		model.addAttribute("cart_list", placeCartDAO.selectAll(mid));
	}

}
