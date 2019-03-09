package com.itbank.springProject.kim.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.itbank.springProject.db.AttractionsDAO;
import com.itbank.springProject.db.AttractionsDTO;

public class TestClass {

	public static void main(String[] args) {
		
		MongoTest mt = new MongoTest();
//		AttractionsDAO dao = new AttractionsDAO();
//		List<AttractionsDTO> list = dao.selectAll();
//		mt.mongoInsert("erkltj43rt", "wqer/werewt/tr.tr");
		mt.mongoSelectAll();
		mt.mongoSelect("mumumu@mama.com");
//		System.out.println(list.size());
	}

}
