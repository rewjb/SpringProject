package com.itbank.springProject.kim.controller;

import java.io.File;
import java.util.Arrays;

public class TestClass {

	public static void main(String[] args) {
		
		File file = new File("src/main/webapp/resources/IMAGE/placeAdd/");
		System.out.println(file.isDirectory());
	}

}
