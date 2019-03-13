/*회원가입, 정보수정시 빈 칸은 기본값으로 세팅해주는 클래스
 * 필수항목 : mid, mpw, mname, mprofile - 값을  필수로 받아옴
 * 추가항목 : mtel, maddr1, maddr2, agegroup - " "값 세팅
 * 			gender - "OTHER"값 세팅
 * 			rdate - 최근 로그인 날자 세팅. 회원가입, 로그인 시 동작함
 * */ 

package com.itbank.springProject.won.controller;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Repository;

import com.itbank.springProject.db.MemberDTO;

@Repository("worker")
public class W_MemberWorker {
	public W_MemberWorker() {
	}//constructor
	
	//가입시 필수항목을 제외한 나머지 항목은 기본값으로 세팅해주는 메서드
	public MemberDTO settingBasicInfo(MemberDTO dto){
		settingName(dto);			//외부로그인의 이름은 구분자 넣어줌
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
	}//end settingBasicInfo():MemberDTO
	
	//가입시 구글 / 페이스북 계정의 이름에 구분자 넣어주는 메서드
	public void settingName(MemberDTO dto){
		String name="";
		if(dto.getMpw().equals("FBEXLOGIN")){
			name = dto.getMname()+"_F";
		}else if(dto.getMpw().equals("GGEXLOGIN")){
			name = dto.getMname()+"_G";
		}
		dto.setMname(name);
	}
	
	//페이스북 아이디 형식 확인해서 세션에는 문자 형태로 넣어주는 메서드
	public int checkFBMid(String mid){
		for(int i=0;i<mid.length();i++){
			char c = mid.charAt(i);
			if(c == '@'){
				//facebook아이디가 이메일 형식인 경우
				return 0;
			}
		}
		//facebook아이디가 이메일 형식이 아닌경우
		return 1;
	}//end checkFBMid()
		
}//end class
