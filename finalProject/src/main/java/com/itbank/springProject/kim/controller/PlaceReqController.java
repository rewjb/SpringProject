package com.itbank.springProject.kim.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.db.AttractionsDAO;
import com.itbank.springProject.db.AttractionsDTO;
import com.itbank.springProject.db.PlaceReqDAO;
import com.itbank.springProject.db.PlaceReqDTO;
import com.itbank.springProject.db.TagDAO;

@Controller
public class PlaceReqController {

	@Autowired
	@Qualifier("PlaceReqDAO")
	PlaceReqDAO dao;
	
	@Autowired
	@Qualifier("AttractionsDAO")
	AttractionsDAO dao2;
	
	@Autowired
	@Qualifier("TagDAO")
	TagDAO dao3;

	@RequestMapping("kim/placeReq")
	public void add(PlaceReqDTO placeReqDTO) throws Exception{
		System.out.println(placeReqDTO.toString());
		dao.insert(placeReqDTO);
	}
	
	@RequestMapping("kim/placeReq_list")
	public void list(Model model, HttpSession session) throws Exception {
		List<PlaceReqDTO> list = dao.selectAll();	
		List<Integer> page = new ArrayList<>();
		//게시물 수에따라 페이지 리스트의 인덱스 증가
		for (int i = 0; i < list.size()/10 + 1; i++) {
			page.add(i+1);
		}
		
		model.addAttribute("page", 1);
		//게시글 리스트와 페이지 리스트는 세션에 세팅
		session.setAttribute("req_list", list);
		session.setAttribute("req_page", page);
	}
	
	@RequestMapping("kim/placeReq_page")
	public String page(@RequestParam("page") String page ,Model model) {
		model.addAttribute("page", page);
		return "kim/placeReq_list";
	}
	
	@RequestMapping("kim/placeReq_content")
	public void content(@RequestParam("no") String no, Model model) throws Exception{
		model.addAttribute("dto", dao.select(no));
	}
	
	@RequestMapping("kim/placeReq_accept")
	public String agree(@RequestParam("no") String no, Model model, AttractionsDTO attractionsDTO) throws Exception {
		dao2.insert(attractionsDTO);
		dao.delete(no);
		String img = attractionsDTO.getMainImg().substring(attractionsDTO.getMainImg().lastIndexOf("/")+1);
		
		File file = new File("C:/Users/user/git/SpringProject2/finalProject/src/main/webapp/resources/IMAGE/placeAdd/" + img);
		file.delete();
		
		return "redirect:placeReq_list";
	}
	
	@RequestMapping("kim/placeReq_reject")
	public String reject(@RequestParam("no") String no, @RequestParam("mainImg") String mainImg) throws Exception {
		dao.delete(no);
		
		String img = mainImg.substring(mainImg.lastIndexOf("/")+1);
		File file = new File("C:/Users/user/git/SpringProject2/finalProject/src/main/webapp/resources/IMAGE/placeAdd/" + img);
		file.delete();
		
		return "redirect:placeReq_list";
	}
}
