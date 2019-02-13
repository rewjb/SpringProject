package com.itbank.springProject.rew.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.springProject.db.PlaceCartDAO;
import com.itbank.springProject.db.PlanDAO;
import com.itbank.springProject.db.PlanDTO;

@Controller
public class R_PlanController {
	
	@Autowired
	@Qualifier("PlanDAO")
	private PlanDAO planDAO;
	
	@RequestMapping("rew/GetProjectData")
	@ResponseBody
	public List<PlanDTO> projectDataMove(String mid , String ptitle) {
		PlanDTO planDTO = new PlanDTO();
		planDTO.setMid(mid);
		planDTO.setPtitle(ptitle);
		
		return planDAO.selectAllById(planDTO);
	}

}
