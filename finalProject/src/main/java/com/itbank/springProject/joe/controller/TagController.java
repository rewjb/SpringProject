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
public class TagController {

	@Autowired
	@Qualifier("AttractionsDAO")
	private AttractionsDAO attractionsDAO;

	@RequestMapping("joe/tagCon")
	public String tagCon(@RequestParam("tag") String continent, Model model ,HttpServletResponse response) {
		
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");

		model.addAttribute("tagList", attractionsDAO.selectTag(continent));

		return "joe/tag";
	}

//	@RequestMapping("joe/attractionsLIst")
//	public void startAttractionsLIstPage() {
//
//	}

	@RequestMapping("joe/tagCity")
	public String tagCity(@RequestParam("tag") String city, Model model ,HttpServletResponse response) {
		
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");

		model.addAttribute("cityList", attractionsDAO.selectCity(city));

		return "joe/tagCity";
	}

	@RequestMapping("joe/pageList")
	public String pageList(AttractionsDTO attractionsDTO, HttpSession session, @RequestParam("page") String page,
			Model model ,HttpServletResponse response) {
		
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");

//		System.out.println("카테" + attractionsDTO.getCategory());
//		System.out.println("도시" + attractionsDTO.getCity());
//		System.out.println("대륙" + attractionsDTO.getContinent());

		if (attractionsDTO.getContinent() != null && attractionsDTO.getCity() != null
				&& attractionsDTO.getCategory() != null) {
//			System.out.println("3가지 page ");
			model.addAttribute("page", page);
			model.addAttribute("list", attractionsDAO.selectThree(attractionsDTO));
		} else if (attractionsDTO.getContinent() != null && attractionsDTO.getCity() != null
				&& attractionsDTO.getCategory() == null) {
			model.addAttribute("page", page);
			model.addAttribute("list", attractionsDAO.selectSecond(attractionsDTO));
		} else if (attractionsDTO.getContinent() != null && attractionsDTO.getCity() == null
				&& attractionsDTO.getCategory() == null) {
			model.addAttribute("page", page);
			model.addAttribute("list", attractionsDAO.selectFirst(attractionsDTO));
		}

		return "joe/attList";
	}

	@RequestMapping("joe/attList")
	public String attList(AttractionsDTO attractionsDTO, Model model, HttpSession session ,HttpServletResponse response) {
		
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");

		session.removeAttribute("continent");
		session.removeAttribute("city");
		session.removeAttribute("tag");
		session.removeAttribute("text");

		if (attractionsDTO.getContinent() != "" && attractionsDTO.getCity() != ""
				&& attractionsDTO.getCategory() != "") {
//			System.out.println("3가지 ");
			session.removeAttribute("continent");
			session.removeAttribute("city");
			session.removeAttribute("tag");
			session.setAttribute("continent", attractionsDTO.getContinent());
			session.setAttribute("city", attractionsDTO.getCity());
			session.setAttribute("tag", attractionsDTO.getCategory());
			model.addAttribute("list", attractionsDAO.selectThree(attractionsDTO));
		} else if (attractionsDTO.getContinent() != "" && attractionsDTO.getCity() != ""
				&& attractionsDTO.getCategory() == "") {
			session.removeAttribute("continent");
			session.removeAttribute("city");
			session.removeAttribute("tag");
			session.setAttribute("continent", attractionsDTO.getContinent());
			session.setAttribute("city", attractionsDTO.getCity());
			model.addAttribute("list", attractionsDAO.selectSecond(attractionsDTO));
		} else if (attractionsDTO.getContinent() != "" && attractionsDTO.getCity() == ""
				&& attractionsDTO.getCategory() == "") {
			session.removeAttribute("continent");
			session.removeAttribute("city");
			session.removeAttribute("tag");
			session.setAttribute("continent", attractionsDTO.getContinent());
			model.addAttribute("list", attractionsDAO.selectFirst(attractionsDTO));
		}

//		System.out.println("태그" + attractionsDTO.getCategory());
//		System.out.println("도시" + attractionsDTO.getCity());
//		System.out.println("대륙" + attractionsDTO.getContinent());
		return "joe/attList";
	}

	@RequestMapping("joe/allList")
	public String allList(Model model, @RequestParam("page") String page, HttpSession session ,HttpServletResponse response) {
		
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
		
		session.removeAttribute("continent");
		session.removeAttribute("city");
		session.removeAttribute("tag");
		session.removeAttribute("text");
//		System.out.println("넘어왔니?????");
//		System.out.println(page);
		model.addAttribute("page", page);
		model.addAttribute("list", attractionsDAO.selectAll());
		return "joe/attList";
	}

	@RequestMapping("joe/reset")
	@ResponseBody
	public void reset(HttpSession session ,HttpServletResponse response) {
		
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");

		session.removeAttribute("continent");
		session.removeAttribute("city");
		session.removeAttribute("tag");
		session.removeAttribute("text");
	}

}