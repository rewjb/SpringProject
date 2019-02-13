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

@Controller
public class R_PlanController {
	
	@Autowired
	@Qualifier("PlanDAO")
	private PlanDAO planDAO;
	
	@RequestMapping("rew/GetProjectData")
	public void projectDataMove(String mid ,  String title) {
		PlanDTO planDTO = new PlanDTO();
		planDTO.setMid(mid);
		planDTO.setTitle(title);
		
		System.out.println(planDTO.getMid());
		System.out.println(planDTO.getTitle());
		
		List<PlanDTO> list =  planDAO.selectAllById(planDTO);
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getTitle());
		}
		
	}

}
