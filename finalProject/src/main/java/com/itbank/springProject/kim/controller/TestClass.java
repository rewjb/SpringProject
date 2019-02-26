package com.itbank.springProject.kim.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.itbank.springProject.db.AttractionsDAO;
import com.itbank.springProject.db.AttractionsDTO;

public class TestClass {

	public static void main(String[] args) {
		
		AttractionsDAO dao = new AttractionsDAO();
		List<AttractionsDTO> list = dao.selectAll();
		System.out.println(list.size());
	}

}
