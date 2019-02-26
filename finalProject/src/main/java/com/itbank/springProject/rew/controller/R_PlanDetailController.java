package com.itbank.springProject.rew.controller;

import java.util.Date;
import java.util.List;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.springProject.db.Mongo_ShareProjectDAO;
import com.itbank.springProject.db.Mongo_ShareProjectDTO;
import com.itbank.springProject.db.PlanDAO;
import com.itbank.springProject.db.PlanDTO;

@Controller
public class R_PlanDetailController {
	
	@Autowired
	@Qualifier("PlanDAO")
	private PlanDAO planDAO;
	
	@Autowired
	@Qualifier("Mongo_ShareProjectDAO")
	Mongo_ShareProjectDAO mongoShareDAO;

	@RequestMapping("rew/DetailPlan")
	public void getDetailPlanInfo(@RequestParam("mid") String mid, @RequestParam("ptitle") String ptitle , Model model) {
		PlanDTO planDTO = new PlanDTO();
		planDTO.setMid(mid);
		planDTO.setPtitle(ptitle);
		model.addAttribute("planDetail_list" , planDAO.selectAllById(planDTO));
		model.addAttribute("mid", mid);
		model.addAttribute("ptitle", ptitle);
	}
	
	@RequestMapping("rew/getCommentInfoAjax")
	@ResponseBody
	public List<Document> getCommentInfoAjax(Mongo_ShareProjectDTO mongoDTO) {
		return mongoShareDAO.selectAll(mongoDTO);
	}
	
	@RequestMapping("rew/setHeadCommentInfoAjax")
	@ResponseBody
	public Document setHeadCommentInfoAjax(Mongo_ShareProjectDTO mongoDTO) {
		
		mongoDTO.setMid("temp");
		mongoDTO.setLevel(1);
		System.out.println(mongoDTO.getPtitle());
		Document result = mongoShareDAO.insertComment(mongoDTO);
		
		return result;
	}
	
	

}
