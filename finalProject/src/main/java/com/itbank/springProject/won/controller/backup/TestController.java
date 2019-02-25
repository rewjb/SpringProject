package com.itbank.springProject.won.controller.backup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*@Controller*/
public class TestController {
	
	/*@Autowired
	@Qualifier("test.hn")*/
	private TestController test;
	

	/*@RequestMapping("won/TravelPlan")*/
	public void imtest() {
		System.out.println("i'm test");
	}
}
