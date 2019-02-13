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
public class R_PlanController {
	
	@Autowired
	@Qualifier("R_PlanDAO")
	private R_PlanDAO planDAO;
	
	@RequestMapping("rew/GetProjectData")
	public void projectDataMove(String mid ,  String title) {
		R_PlanDTO planDTO = new R_PlanDTO();
		planDTO.setMid(mid);
		planDTO.setTitle(title);
		
		List<R_PlanDTO> list =  planDAO.selectAllById(planDTO);
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getMid());
		}
		
	}

}
