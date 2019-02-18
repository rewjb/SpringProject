package com.itbank.springProject.won.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.db.MemberDTO;

@Controller
public class W_PageTurnController {
	
	//이메일 회원가입
	@RequestMapping("won/takeInsertPage")
	public String takeInsertPage(){
		return "won/insertMember";
	}
	
	//구글회원가입1 - 요소 하나하나 넘겨주기
	@RequestMapping("takeGGInsertPage")
	public String takeGoogleInsertPage(
			@RequestParam("mid") String mid,
			@RequestParam("mname") String mname,
			@RequestParam("mprofile") String mprofile,
			Model model){
		model.addAttribute("mid", mid);
		model.addAttribute("mname", mname);
		model.addAttribute("mprofile", mprofile);
		
		return "won/insertMember";
	}
	
	//구글 회원가입2 - DTO에 담아서 넘겨주기(확인중)
	@RequestMapping("won/takeGGInsertPage2")
	public String takeGoogleInsertPage(MemberDTO dto){
		return "won/insertMember";
	}
	
	//깃 회원가입 - 요소 하나하나 넘겨주기(확인중)
	@RequestMapping("won/takeGHInsertPage")
	public String takeGithubInsertPage(
			@RequestParam("mid") String mid,
			@RequestParam("mname") String mname,
			Model model){
		model.addAttribute("mid", mid);
		model.addAttribute("mname", mname);
		return "won/insertMember";
	}
	
	//깃 회원가입2 - DTO에 담아서 넘겨주기(확인중)
	@RequestMapping("won/takeGHInsertPage2")
	public String takeGithubInsertPage(MemberDTO dto){
		return "won/insertMember";
	}
	
}
