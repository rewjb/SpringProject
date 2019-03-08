package com.itbank.springProject.won.controller;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Repository;

import com.itbank.springProject.db.MemberDTO;

@Repository("worker")
public class W_MemberWorker {
	public W_MemberWorker() {
	}
	
	public MemberDTO settingBasicInfo(MemberDTO dto){
		if(dto.getMtel()==null){
			dto.setMtel(" ");		//연락처 기본값 세팅
		} 
		if(dto.getMaddr1()==null){
			dto.setMaddr1(" ");		//주소 기본값 세팅
			dto.setMaddr2(" ");		//주소 기본값 세팅2
		} 
		if(dto.getGender()==null){
			dto.setGender("OTHER");	//성별 기본값 세팅
		} 
		if(dto.getAgegroup()==null){
			dto.setAgegroup(" ");	//연령대 기본값 세팅
		} 
		//최근 접속일 세팅
		SimpleDateFormat f = new SimpleDateFormat ( "yyyy-MM-dd");
		String f_time = f.format (System.currentTimeMillis());
		dto.setRdate(f_time);	//최근 활동한 날자 세팅
		return dto;
	}
}
