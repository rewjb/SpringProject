package com.itbank.springProject.rew.controller;

import java.util.Collection;
import java.util.Collections;
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
import com.itbank.springProject.db.PlaceCartDAO;
import com.itbank.springProject.db.PlanDAO;
import com.itbank.springProject.db.PlanDTO;

@Controller
public class R_PlanDetailController {
	
	@Autowired
	@Qualifier("PlanDAO")
	private PlanDAO planDAO;
	
	@Autowired
	@Qualifier("PlaceCartDAO")
	private PlaceCartDAO placeCartDAO;
	
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
		model.addAttribute("cart_list", placeCartDAO.selectCartAll("temp"));
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
	
	@RequestMapping("rew/setBodyCommentInfoAjax")
	@ResponseBody
	public Document setBodyCommentInfoAjax(Mongo_ShareProjectDTO mongoDTO) {
		mongoDTO.setMid("임시 아이디!");
		System.out.println(mongoDTO);
		Document result = mongoShareDAO.insertComment(mongoDTO);
		return result;
	}
	
	@RequestMapping("rew/setBodyCommentInfoUpdateAjax")
	@ResponseBody
	public String setBodyCommentInfoUpdateAjax(Mongo_ShareProjectDTO mongoDTO) {
		mongoDTO.setMid("임시 아이디!");
		return mongoShareDAO.updateComment(mongoDTO);
	}
	
	@RequestMapping("rew/setDeleteCommentAjax")
	@ResponseBody
	public String setDeleteCommentAjax(Mongo_ShareProjectDTO mongoDTO , @RequestParam("dist") String dist) {
		
		System.out.println(mongoDTO);
		System.out.println(dist);
		return mongoShareDAO.deleteComment(mongoDTO,dist);
	}
	

}
