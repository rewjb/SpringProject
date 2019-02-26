package com.itbank.springProject.rew.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.db.PlanDAO;
import com.itbank.springProject.db.PlanDTO;

@Controller
public class R_PlanDetailController {
	
	@Autowired
	@Qualifier("PlanDAO")
	private PlanDAO planDAO;

	@RequestMapping("rew/DetailPlan")
	public void getDetailPlanInfo(@RequestParam("mid") String mid, @RequestParam("ptitle") String ptitle , Model model) {
		PlanDTO planDTO = new PlanDTO();
		planDTO.setMid(mid);
		planDTO.setPtitle(ptitle);
		model.addAttribute("planDetail_list" , planDAO.selectAllById(planDTO));

	}

}
