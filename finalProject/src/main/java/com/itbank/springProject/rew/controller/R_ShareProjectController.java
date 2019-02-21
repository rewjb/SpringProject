package com.itbank.springProject.rew.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.springProject.db.Mongo_ShareProjectDAO;
import com.itbank.springProject.db.PlaceCartDAO;
import com.itbank.springProject.db.PlanDAO;
import com.itbank.springProject.db.PlanDTO;
import com.itbank.springProject.db.ShareProjectDAO;
import com.itbank.springProject.db.ShareProjectDTO;
    
@Controller
public class R_ShareProjectController {

	@Autowired
	@Qualifier("ShareProjectDAO")
	ShareProjectDAO shareProjectDAO;
	
	@Autowired
	@Qualifier("Mongo_ShareProjectDAO")
	Mongo_ShareProjectDAO mongo_ShareProjectDAO;
	
	@Autowired
	@Qualifier("PlanDAO")
	PlanDAO planDAO;  
	
	
	
	@RequestMapping("rew/insertShareProject")
	@ResponseBody
	public String cartSelectAll(@RequestParam("ptitle") String ptitle) {
		String check = "good";
		
		ShareProjectDTO shareProjectDTO = new ShareProjectDTO();
		shareProjectDTO.setMid("temp");
		shareProjectDTO.setPtitle(ptitle);
		
		if (shareProjectDAO.insertShareProject(shareProjectDTO) != 1) {
			//공유 실패
			check = "bad";
		}else {
			//공유 성공
			mongo_ShareProjectDAO.mongoTest(planDAO.selectAllPid(shareProjectDTO));
			
		}
		return check;
	}  
	
}
