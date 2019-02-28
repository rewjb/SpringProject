package com.itbank.springProject.kim.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.itbank.springProject.db.TagDAO;

public class Vision {

	public static void main(String[] args) throws Exception {
		VisionMethod m = new VisionMethod();
		TagDAO mongo = new TagDAO();
		
		HashMap<String, String> list = m.imgTag();
		
		Iterator<String> iter = m.sortByValue(list).iterator();
		mongo.mongoInsert(list, iter);	
		mongo.mongoSelect("2014062317");
		
//		HashMap<String, String> list = mongo.mongoSelectAll();
//		
//		Iterator<String> iter = m.sortByValue(list).iterator();
//		
//		while(iter.hasNext()){
//			String val = iter.next();
//			System.out.print(val + " - ");
//			System.out.println(list.get(val));
//		}


	}

}
