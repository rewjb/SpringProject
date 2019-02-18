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
   public void projcetDataSave(PlanDTO planDTO , HttpServletResponse response ,  @RequestParam("ptitle") String ptitle) throws IOException{
	   
	   planDTO.setMid("temp");
	   
	   
	   //response.getWriter().write("");
	   //좋은 예시라서 남겨둠.
	   
	   
   }
//   
//	//mid
//	//ptitle
//	form.find('input[name=num]').val();   td[alt=Project_detail_num]
//	form.find('input[name=mainimg]').val();  img
//	form.find('input[name=title]').val();
//	form.find('input[name=content]').val();
//	form.find('input[name=detail]').val();
//	//latitude
//	//longitude
//	form.find('input[name=distance]').val();
//	form.find('input[name=way]').val();
   
//	private String mid;
//	private String ptitle;
//	private String title;
//	private String content;
//	private String latitude;
//	private String longitude;
//	private String way;
//	private String mainImg;
//	private String detail;
//	private int num;
//	private int distance;


}
