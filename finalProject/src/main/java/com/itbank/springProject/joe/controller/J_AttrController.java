package com.itbank.springProject.joe.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.springProject.db.AttractionsDAO;
import com.itbank.springProject.db.AttractionsDTO;

@Controller
public class J_AttrController {

	@Autowired
	@Qualifier("AttractionsDAO")
	private AttractionsDAO attractionsDAO;
	
	@RequestMapping("joe/selectPid")
	@ResponseBody
	public AttractionsDTO selectPid(@RequestParam("pid") String pid ,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
		
//		System.out.println(pid);
		
		
		return attractionsDAO.select(pid);
	}
	
	
	@RequestMapping("joe/search")
	public String search(@RequestParam("text") String text, Model model ,HttpSession session,@RequestParam("page") String page ,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
		
		model.addAttribute("list", attractionsDAO.searchSelect(text));
		model.addAttribute("page", page);
		session.setAttribute("text", text);
		return "joe/attList";
	}
	
}
