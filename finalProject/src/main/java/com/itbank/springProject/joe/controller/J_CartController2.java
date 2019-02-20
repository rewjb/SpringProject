package com.itbank.springProject.joe.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.imageio.ImageIO;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.springProject.db.AttractionsDAO;
import com.itbank.springProject.db.AttractionsDTO;
import com.itbank.springProject.db.PlaceCartDAO;
import com.itbank.springProject.db.PlaceCartDTO;


@Controller
public class J_CartController2 {
	
	public static void main(String[] args) throws IOException {
		//File outputFile = new File("temp.txt");
		File outputFile = new File("src\\main\\webapp\\resources\\IMAGE\\attractionsImg\\");
		
		System.out.println(outputFile.getPath());
		System.out.println(outputFile.getCanonicalPath());
		System.out.println(outputFile.getAbsolutePath());
	}
	
}
