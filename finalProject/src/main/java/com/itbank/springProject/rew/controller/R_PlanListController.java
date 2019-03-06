package com.itbank.springProject.rew.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

@Controller
public class R_PlanListController {

	@Autowired
	@Qualifier("ShareProjectDAO")
	private ShareProjectDAO shareProjectDAO;

	@Autowired
	@Qualifier("Mongo_ShareProjectDAO")
	Mongo_ShareProjectDAO mongoShareDAO;

	@RequestMapping("rew/planList")
	public void startPlanList(HttpSession session, Model model) {
		String temp = "Chinesearchitecture/Japanesearchitecture/Holyplaces/Placeofworship";
		session.setAttribute("favor", temp);
		//위에는 가정

		String favor = (String) session.getAttribute("favor");
		List<ShareProjectDTO> favorProjectList = shareProjectDAO.selectAllShareProjectByManyId(mongoShareDAO.returnShareProjectRank(favor, mongoShareDAO.createProjectTagMap()));

		List<ShareProjectDTO> allSearchTextList = mongoShareDAO.sortByDateStar();
		
		List<ShareProjectDTO> allProjectList =  new ArrayList<ShareProjectDTO>();
		
		
		for (int i = 0; i < allSearchTextList.size(); i++) {
			allProjectList.add(shareProjectDAO.selectAllShareProjectByManyIdStar(allSearchTextList.get(i)));
		}
		
		for (int i = 0; i < allProjectList.size(); i++) {
			System.out.println(allProjectList.get(i).getPtitle());
		}
		

		model.addAttribute("favorProjectList", favorProjectList);
		model.addAttribute("allProjectList", allProjectList);

	}

}
