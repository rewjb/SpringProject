package com.itbank.springProject.rew.controller;

import java.io.IOException;
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

@Controller
public class R_PlanController {
	
	@Autowired
	@Qualifier("PlanDAO")
	private PlanDAO planDAO;
	
	@RequestMapping("rew/getProjectData")
	@ResponseBody
	public List<PlanDTO> projectDataMove(String mid , String ptitle) {
		PlanDTO planDTO = new PlanDTO();
		planDTO.setMid(mid);
		planDTO.setPtitle(ptitle);
		return planDAO.selectAllById(planDTO);
	}
	
   @RequestMapping("rew/projcetDataSave")
	public void projcetDataSave(PlanDTO planDTO, HttpServletResponse response, @RequestParam("ptitle") String ptitle)
			throws IOException {

		planDTO.setMid("temp");

		int result1 = planDAO.deleteProjectData(planDTO);

		response.getWriter().write("success");

		int result2 = planDAO.insertProjectData(planDTO);
	
//		if (result1==0) {
//			result2=planDAO.insertProjectData(planDTO);
//			
//			if (result2==0) {
//				
//				response.getWriter().write("success");
//				
//			}else {
//				
//				response.getWriter().write("insert success");
//				
//			}
//		}else {
//			
//			response.getWriter().write("delete fail");
//		}

	}

}
