package com.itbank.springProject.rew.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;

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

	@Autowired
	@Qualifier("Mongo_ShareProjectDAO")
	Mongo_ShareProjectDAO mongo_ShareProjectDAO;

	@RequestMapping("rew/insertShareProject")
	@ResponseBody
	public String insertShareProject(@RequestParam("ptitle") String ptitle, HttpSession session) {

		HashMap<String, String> map = new HashMap<>();
		MongoClient mongoClient = new MongoClient("34.73.189.101", 27017);
		DB db = mongoClient.getDB("tag");
		// 컬렉션 가져오기
		DBCollection coll = db.getCollection("place");
		DBCursor cursor = coll.find();
		while (cursor.hasNext()) {
			// 커서의 이름중에 _id인 컬럼 값만 출력
			String val = cursor.next().toString().replaceAll("\"", "").replaceAll("}", "");
			String val2 = val.substring(val.indexOf(",") + 1).replaceAll(" ", "");
			String[] valRs = val2.split(":");
			map.put(valRs[0] + ".jpg", valRs[1]);
		}

		String check = "good";

		ShareProjectDTO shareProjectDTO = new ShareProjectDTO();
		shareProjectDTO.setMid((String)session.getAttribute("mid"));
		shareProjectDTO.setPtitle(ptitle);

		List<PlanDTO> list = planDAO.selectAllPid(shareProjectDTO);

		String insertTag = "";
		String insertTotaImg = "";

		for (int i = 0; i < list.size(); i++) {
			if (map.containsKey(list.get(i).getMainImg())) {
				insertTotaImg += list.get(i).getMainImg() + "/";
				insertTag += map.get(list.get(i).getMainImg());
			}
		}

		shareProjectDTO.setImg(insertTotaImg);

		if (shareProjectDAO.insertShareProject(shareProjectDTO) != 1) {
			// 공유 실패
			check = "bad";
		} else {
			// 공유 성공
			mongo_ShareProjectDAO.createProjectInMongo(shareProjectDTO, insertTag);
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
	public String cartSelectAll(Model model, HttpSession session) {
		
		if (session.getAttribute("mid") !=null) {
			List<ShareProjectDTO> allSearchTextList = mongo_ShareProjectDAO.getProjectByStar();
			
			List<ShareProjectDTO> allProjectList = new ArrayList<ShareProjectDTO>();
			
			for (int i = 0; i < allSearchTextList.size(); i++) {
				allProjectList.add(shareProjectDAO.selectAllShareProjectByManyIdStar(allSearchTextList.get(i)));
			}
			
			String mid = (String) session.getAttribute("mid");
			model.addAttribute("project_list", placeCartDAO.selectPlanNameAll(mid));
			model.addAttribute("cart_list", placeCartDAO.selectCartAll(mid));
			model.addAttribute("projectShare_list", shareProjectDAO.selectAllShareProjectById(mid));
			model.addAttribute("allProjectListBystar" , allProjectList);
			
			return "rew/TravelPlan";
		}else {
			
			return "won/signup";
		}
		
		

		
	}

	@RequestMapping("rew/projcetDataSave")
	@ResponseBody
	public String projcetDataSave(@RequestBody List<PlanDTO> planList, @RequestParam("ptitle") String ptitle ,HttpSession session) {

		String check = "good";
		
		PlanDTO delPlanDTO = new PlanDTO();
		delPlanDTO.setPtitle(ptitle);
		delPlanDTO.setMid((String)session.getAttribute("mid"));
		
		planDAO.deleteProjectData(delPlanDTO);
		
		try {

			if (planList.size() > 0) {
				for (int i = 0; i < planList.size(); i++) {
					planList.get(i).setMid((String)session.getAttribute("mid"));
					planList.get(i).setPtitle(ptitle);
				}
				planDAO.insertProjectData(planList);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			check = "no";
		}

		return check;
	}

	@RequestMapping("rew/setDeleteProjcet")
	@ResponseBody
	public String setDeleteProjcet(@RequestParam("ptitle") String ptitle , HttpSession session) {
		String mid = (String)session.getAttribute("mid");
		PlanDTO planDTO = new PlanDTO();
		planDTO.setMid(mid);
		planDTO.setPtitle(ptitle);
		planDAO.deleteProjectData(planDTO);
		shareProjectDAO.deleteOneShareProject(planDTO);
		mongo_ShareProjectDAO.deleteProject(planDTO);
		return "";
	}

	@RequestMapping("rew/setDeleteCart")
	@ResponseBody
	public String setDeleteCart(@RequestParam("pid") String pid , HttpSession session) {
		String mid = (String)session.getAttribute("mid");
		PlaceCartDTO placeCartDTO = new PlaceCartDTO();
		placeCartDTO.setMid(mid);
		placeCartDTO.setPid(pid);

		if (placeCartDAO.delete(placeCartDTO) == 1) {
			return "success";
		} else {
			return null;
		}
	}

}
