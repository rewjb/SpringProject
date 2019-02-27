package com.itbank.springProject.won.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.springProject.db.MemberDAO;
import com.itbank.springProject.db.MemberDTO;

@Controller
public class W_MemberController{
	
	@Autowired
	@Qualifier("MemberDAO")
	private MemberDAO memberDAO;
	
	//회원가입
	@RequestMapping("won/insertMember")
	public String insertMember(MemberDTO memberDTO){
		try {
			//insert성공시 insertM으로
			memberDAO.insert(memberDTO);
			System.out.println("insertMember 성공");
			return "won/insertM";
		} catch (Exception e) {
			//insert실패시 다시 회원가입 화면으로
			System.out.println("insertMember 실패");
			e.printStackTrace();
			return "redirect:signup.jsp";
		}
	}//end insertMember()
	
	//정보수정
	@RequestMapping("won/updateMember")
	public String updateMember(MemberDTO memberDTO){
		try {
			//정보수정 성공시 : 정보수정 성공한 데이터를 마이페이지에서 확인해줌
			memberDAO.update(memberDTO);
			System.out.println("updateMember 성공");
			return "won/updateM";
		} catch (Exception e) {
			//정보수정 실패시 : 정보수정 하기 전 데이터가 있는 마이페이지로 돌아감
			e.printStackTrace();
			System.out.println("updateMember 실패");
			return "redirect:mypage.jsp";
		}
	}//end updateMember()
	
	//회원탈퇴
	@RequestMapping("won/deleteMember")
	public String deleteMember(@RequestParam("mid") String mid,
			MemberDTO dto){
		try {
			//삭제 진행
			dto.setMid(mid);
			memberDAO.delete(dto);
			return "won/deleteM";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteMember 실패");
			return "redirect:mypage.jsp";
		}
	}//end deleteMember()
	
	//회원가입시 아이디 중복확인
	@RequestMapping("won/checkMid")
	@ResponseBody
	public String checkId(@RequestParam("mid") String mid, MemberDTO dto){
		System.out.println("아이디 중복확인 mid:"+ mid);
		System.out.println("아이디 중복확인 dto:"+ dto.getMid());
		try {
			dto.setMid(mid);
			MemberDTO mdto = memberDAO.select(dto);
			if(mdto == null || mdto.getMid().equals("")){
				System.out.println("존재하지 않는 아이디! 가입 가능합니다!");
			}else{
				System.out.println("존재하는 아이디! 가입 불가능!");
			}
			//로그인 성공시 id를 세션에 넣어줌
			
		} catch (Exception e) {
			//실패시 회원가입 페이지로 돌아감
			e.printStackTrace();
			System.out.println("select실패");
		}
		
		return mid; 
		
	}
	
	//로그인을 위한 확인
	@RequestMapping("won/login")
	public String selectIdPw(MemberDTO dto,	HttpSession session,
			@RequestParam("mid") String mid,
			@RequestParam("mpw") String mpw){
		try {
			MemberDTO mdto = memberDAO.select(dto);
			//pw springProject - 외부로그인, 그외 : 비밀번호 확인
			if(mpw.equals("springProject")){
				System.out.println("외부로그인 성공");
			}else if(mpw.equals(mdto.getMpw())){
				System.out.println("로그인 성공");
			}
			//로그인 성공시 id를 세션에 넣어줌
			session.setAttribute("mid", mdto.getMid());
			return "won/login";
			
		} catch (Exception e) {
			//실패시 로그인 페이지로 돌아감
			e.printStackTrace();
			System.out.println("select실패");
			return "redirect:login.jsp";
		}
	}//end selectIdPw
	
	//마이페이지에 정보수정 페이지에 필요한 개인정보 검색
	@RequestMapping("won/selectMember")
	public String selectMember(Model model, MemberDTO dto,
			@RequestParam("mid") String mid){
		try {
			dto.setMid(mid);
			MemberDTO mdto = memberDAO.select(dto);
			model.addAttribute("memberDTO", mdto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("select실패");
			return "won/home";
		}
		return "won/selectM";
	}//end selectMember();
	
}
