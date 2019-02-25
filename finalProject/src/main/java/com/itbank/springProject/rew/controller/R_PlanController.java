package com.itbank.springProject.rew.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.resource.HttpResource;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.springProject.db.PlaceCartDAO;
import com.itbank.springProject.db.PlanDAO;
import com.itbank.springProject.db.PlanDTO;
import com.itbank.springProject.db.ShareProjectDAO;
import com.itbank.springProject.db.ShareProjectDTO;
import com.sun.javafx.collections.MappingChange.Map;

@Controller
public class R_PlanController {

	@Autowired
	@Qualifier("PlanDAO")
	private PlanDAO planDAO;

	@Autowired
	@Qualifier("PlaceCartDAO")
	private PlaceCartDAO placeCartDAO;

	@Autowired
	@Qualifier("ShareProjectDAO")
	private ShareProjectDAO shareProjectDAO;

//	@Autowired
//	@Qualifier("Mongo_ShareProjectDAO")
//	Mongo_ShareProjectDAO mongo_ShareProjectDAO;

	@RequestMapping("rew/insertShareProject")
	@ResponseBody
	public String cartSelectAll(@RequestParam("ptitle") String ptitle) {
		String check = "good";

		ShareProjectDTO shareProjectDTO = new ShareProjectDTO();
		shareProjectDTO.setMid("temp");
		shareProjectDTO.setPtitle(ptitle);

		if (shareProjectDAO.insertShareProject(shareProjectDTO) != 1) {
			// 공유 실패
			check = "bad";
		} else {
			// 공유 성공
//			mongo_ShareProjectDAO.mongoTest(planDAO.selectAllPid(shareProjectDTO));

		}
		return check;
	}

	@RequestMapping("rew/getProjectData")
	@ResponseBody
	public List<PlanDTO> projectDataMove(String mid, String ptitle) {
		PlanDTO planDTO = new PlanDTO();
		planDTO.setMid(mid);
		planDTO.setPtitle(ptitle);
		return planDAO.selectAllById(planDTO);
	}

	@RequestMapping("rew/TravelPlan")
	public void cartSelectAll(@RequestParam("mid") String mid, Model model) {
		model.addAttribute("project_list", placeCartDAO.selectPlanNameAll(mid));
		model.addAttribute("cart_list", placeCartDAO.selectCartAll(mid));
		model.addAttribute("projectShare_list", shareProjectDAO.selectAllShareProjectById(mid));
	}

	@RequestMapping("rew/projcetDataSave")
	@ResponseBody
	public String projcetDataSave(@RequestBody List<PlanDTO> planList, @RequestParam("ptitle") String ptitle) {

		String check = "good";

		for (int i = 0; i < planList.size(); i++) {
			System.out.println(planList.get(i).getPid());
		}

		try {

			if (planList.size() > 0) {
				for (int i = 0; i < planList.size(); i++) {
					planList.get(i).setMid("temp");
					planList.get(i).setPtitle(ptitle);
				}
				planDAO.deleteProjectData(planList.get(0));
				planDAO.insertProjectData(planList);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			check = "no";
		}

		return check;
	}

}
