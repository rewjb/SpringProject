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
public class R_PlanListController {
	
	@Autowired
	@Qualifier("ShareProjectDAO")
	private ShareProjectDAO shareProjectDAO;
	
	@RequestMapping("rew/startPlanList")
	public void startPlanList(HttpSession session) {
		String favor =  (String) session.getAttribute("favor");
		List<ShareProjectDTO> list = new ArrayList<>();
		
//		<insert id="insertBatch2" parameterType="map">
//		INSERT INTO test_book_backup(bookID, bookName, originPrice, registDate)
//		VALUES
//		<foreach item="testBook" index="index" collection="list" open="" separator="," close="">
//			(#{testBook.bookID}, #{testBook.bookName}, #{testBook.originPrice}, NOW())
//		</foreach>		
//	</insert>
		
//		session.setAttribute("favor", favor);
		
		
		
	}
	
	

}
