package com.itbank.springProject.rew.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.springProject.db.Mongo_ShareProjectDAO;
import com.itbank.springProject.db.PlaceCartDAO;
import com.itbank.springProject.db.PlaceCartDTO;
import com.itbank.springProject.db.PlanDAO;
import com.itbank.springProject.db.PlanDTO;
import com.itbank.springProject.db.ShareProjectDAO;
import com.itbank.springProject.db.ShareProjectDTO;
import com.itbank.springProject.db.TagPoolDTO;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.sun.org.glassfish.external.statistics.impl.StatsImpl;

@Controller
public class R_PlanListController {

	@Autowired
	@Qualifier("ShareProjectDAO")
	private ShareProjectDAO shareProjectDAO;

	@Autowired
	@Qualifier("Mongo_ShareProjectDAO")
	Mongo_ShareProjectDAO mongoShareDAO;

	@RequestMapping("rew/planList")
	public void startPlanList(HttpSession session, Model model , @RequestParam("page") int page) {
		
		int showCount = 6;
		//보여주고자 하는 수량
		
		String favor = (String) session.getAttribute("favor");
		
		List<ShareProjectDTO> favorProjectList = shareProjectDAO.selectAllShareProjectByManyId(mongoShareDAO.returnShareProjectRank(favor, mongoShareDAO.createProjectTagMap()));

		List<ShareProjectDTO> allSearchTextList = mongoShareDAO.sortByDateStar();
		
		List<ShareProjectDTO> allProjectList =  new ArrayList<ShareProjectDTO>();
		
		int startIndex = showCount*(page-1);
		//첫번째 인덱스
		double tempLastPage = (double)allSearchTextList.size()/showCount;
		int lastPage =  (int)Math.ceil(tempLastPage);
		
		//마지막 페이지
		
		for (int i = startIndex; i < startIndex+showCount; i++) {
			if (i == allSearchTextList.size()) {
				break;
			}
			allProjectList.add(shareProjectDAO.selectAllShareProjectByManyIdStar(allSearchTextList.get(i)));
		}
		
		
		model.addAttribute("favorProjectList", favorProjectList);
		model.addAttribute("allProjectList", allProjectList);
		model.addAttribute("page", page);
		model.addAttribute("lastPage", lastPage);
		

	}

}
