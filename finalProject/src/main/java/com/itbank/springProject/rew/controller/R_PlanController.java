package com.itbank.springProject.rew.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.resource.HttpResource;

import com.itbank.springProject.db.PlaceCartDAO;
import com.itbank.springProject.db.PlanDAO;
import com.itbank.springProject.db.PlanDTO;
import com.sun.javafx.collections.MappingChange.Map;

@Controller
public class R_PlanController {

	@Autowired
	@Qualifier("PlanDAO")
	private PlanDAO planDAO;

	@RequestMapping("rew/getProjectData")
	@ResponseBody
	public List<PlanDTO> projectDataMove(String mid, String ptitle) {
		PlanDTO planDTO = new PlanDTO();
		planDTO.setMid(mid);
		planDTO.setPtitle(ptitle);
		return planDAO.selectAllById(planDTO);
	}

	@RequestMapping("rew/projcetDataSave")
	public void projcetDataSave(@RequestParam HashMap<String, Object> parameters, @RequestParam("ptitle") String ptitle , HttpServletResponse response ) throws IOException {
		
		String json = parameters.get("form0").toString();

        System.out.println(json);  

	}

}
