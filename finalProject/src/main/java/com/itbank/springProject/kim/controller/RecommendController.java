package com.itbank.springProject.kim.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.db.AttractionsDAO;
import com.itbank.springProject.db.AttractionsDTO;
import com.itbank.springProject.db.TagDAO;

@Controller
public class RecommendController {

	@Autowired
	@Qualifier("TagDAO")
	TagDAO dao1;
	
	@Autowired
	@Qualifier("AttractionsDAO")
	AttractionsDAO dao2;
	
	@RequestMapping("kim/Tag_Select")
	public String move(HttpSession session, Model model){
		
		//전체 태그 리스트 불러오기
		HashMap<String, String> list = dao1.mongoSelectAll();		
		List<String> keyList = dao1.sortByValue(list);
		List<AttractionsDTO> allList = dao2.selectAll();
		
		//map을 DTO형태로 가
		List<AttractionsDTO> daoList = new ArrayList<>();
		for (int i = 0; i < keyList.size(); i++) {
			daoList.add(i, allList.get(i));
		}	
		
		//불러온 리스트 세션에 세팅
		session.setAttribute("place_map", list);
		session.setAttribute("place_list", daoList);
		
		Random ran = new Random();
		String[] ranImgs = new String[12];
		
		//제시되는 선택사진 랜덤으로 생성해줄 로직
		for (int i = 0; i < 12; i++) {
			String name = daoList.get(ran.nextInt(daoList.size())).getMainImg();
			System.out.println(name);
			boolean same = false;
			//선택된 이미지 중복여부 체크
			for (int j = 0; j < i; j++) {
				if(ranImgs[j].equals(name)){
					same = true;
				}
			}
			if(!same) { //중복이 아니면 이미지 대입
				ranImgs[i] = name;
			}else{ //중복이면 미대입 후 i-1 
				i -= 1;
			}
		}
		//완성된 선택사진리스트 모델객체로 전송
		model.addAttribute("ranImgs", ranImgs);
		return "won/signup";
	}
	
	@RequestMapping("kim/Tag_Select_Submit2")
	public String subm2(HttpSession session) {		
		session.setAttribute("favor",
				"Archaeologicalsite/Ruins/Historicsite/Tourism/Mayacivilization/Village/Grass/Tree/Vacation/House/Water/Aquarium/Sky/Fun/Leisure/Night/Sea/Vacation/World/Silhouette/City/Townsquare/Plaza/Publicspace/Town/Humansettlement/Building/Landmark/Basilica/Architecture");
		return "redirect:recommend";
	}
	
	@RequestMapping("kim/Tag_Select_Submit")
	public String subm(@RequestParam("tag1") String tag1, @RequestParam("tag2") String tag2, 
			@RequestParam("tag3") String tag3, @RequestParam("id") String id, HttpSession session) {
				
		//세션의 전체 태그리스트 가져옴
		HashMap<String, String> list = (HashMap<String, String>) session.getAttribute("place_map");
		List<AttractionsDTO> sortedList = (List<AttractionsDTO>) session.getAttribute("place_list");
		
		//사용자가 선택한 사진들의 파일명 변수에 대입
		tag1 = tag1.substring(tag1.lastIndexOf("/")+1);
		tag2 = tag2.substring(tag2.lastIndexOf("/")+1);
		tag3 = tag3.substring(tag3.lastIndexOf("/")+1);
		
		String tags = "";
		
		//전체 리스트에서 사용자가 선택한 이미지의 태그를 찾아 병합
		for (int i = 0; i < sortedList.size(); i++) {
			String val = sortedList.get(i).getMainImg();
			if(val.equals(tag1) || val.equals(tag2) || val.equals(tag3)){
				tags += list.get(val) + "/";
			}			
		}

		tags = tags.substring(0, tags.length()-1);
		System.out.println("결과 : " + tags);
		id =  id.replace('.', '/');
		dao1.mongoInsert(id, tags);
		
		//테스트용 유저선호도 세션등록
		session.setAttribute("favor", tags);
		
		return "redirect:recommend";
	}
	
	@RequestMapping("kim/recommend")
	public String recommend(HttpSession session, Model model){
		
		//세션에서 사용자 선호태그 불러와서 배열형태로 변환
		String ssFavor = (String) session.getAttribute("favor");
		String[] favor = ssFavor.split("/");
		
		//세션의 전체 태그리스트 가져옴
		HashMap<String, String> list = (HashMap<String, String>) session.getAttribute("place_map");
		List<AttractionsDTO> sortedList = (List<AttractionsDTO>) session.getAttribute("place_list");
		
		//추천 결과의 인덱스를 저장할 배열 선언
		int[] result = new int[sortedList.size()];
		
		//일치도 점수 기록 반복문
		for (int i = 0; i < sortedList.size(); i++) {
			
			//전체 여행지 리스트를 하나씩 Tag변수에 대입하여 사용자의 선호 태그와 비교
			String Tag = list.get(sortedList.get(i).getMainImg());
			String[] placeTags = Tag.split("/");
			int point = 0;
			
			//현재 비교중인 여행지의 태그와 사용자의 선호태그가 일치할 때마다 point 1점씩 증가
			for (int j = 0; j < favor.length; j++) {
				for (int j2 = 0; j2 < placeTags.length; j2++) {
					if(favor[j].equals(placeTags[j2])){
						point++;
					}
				}
			}
			//모든 태그를 비교 완료하면 점수를 result리스트에 대입. 모든 여행지와의 비교가 끝날 때까지 반복
			result[i] = point;
		}
		
//		//정렬 전의 값 확인
//		for (int i = 0; i < result.length; i++) {
//			System.out.println(sortedList.get(i).getMainImg() + " : " + result[i]);
//		}
				
		//정렬을 위한 인덱스 temp와 장소명 sTemp를 선언
		int temp = 0;
		AttractionsDTO sTemp = new AttractionsDTO();
		
		//버블정렬을 이용해 높은 점수가 앞으로 오도록 정렬
		for (int i = 0; i < result.length; i++) {
			for (int j = 0; j < result.length-i-1; j++) {				
				if(result[j] < result[j+1]){
					//작은 값 temp 변수에 담기
					temp = result[j];
					sTemp = sortedList.get(j);
					//뒤쪽 값을 앞쪽 인덱스에 대입시키기
					result[j] = result[j+1];
					sortedList.set(j, sortedList.get(j+1));
					//기존 뒤쪽 값에 temp변수의 값 대입
					result[j+1] = temp;
					sortedList.set(j+1, sTemp);
				}
			}
		}
		
//		System.out.println("==========정럴 후=========");
//		//정렬 후의 값 확인
//		for (int i = 0; i < result.length; i++) {
//			System.out.println(sortedList.get(i).getMainImg() + " : " + result[i]);
//		}
		
		//결과를 모델객체로 반환
		session.setAttribute("recommend", sortedList);
		return "redirect:../main.jsp";
	}
	
	@RequestMapping("kim/atList")
	public String atList() {		
		return "kim/recommend";
	}
}
