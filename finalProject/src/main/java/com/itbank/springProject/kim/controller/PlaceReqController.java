package com.itbank.springProject.kim.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.springProject.db.PlaceReqDAO;
import com.itbank.springProject.db.PlaceReqDTO;

@Controller
public class PlaceReqController {

	@Autowired
	//@Qualifier("PlaceReqDAO")
	PlaceReqDAO dao;

	@RequestMapping("kim/placeReq")
	public void add(PlaceReqDTO placeReqDTO) throws Exception{
		dao.insert(placeReqDTO);
	}
	
	@RequestMapping("kim/placeReq_list")
	public void list(Model model, HttpSession session) throws Exception {
		List<PlaceReqDTO> list = dao.selectAll();	
		List<Integer> page = new ArrayList<>();
		
		for (int i = 0; i < list.size()/10 + 1; i++) {
			page.add(i+1);
		}
		
		model.addAttribute("list", list);
		session.setAttribute("req_list", list);
		session.setAttribute("req_page", page);
	}
}
