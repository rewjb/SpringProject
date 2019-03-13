/*회원에 관련된 동작들이 담겨있는 컨트롤러
*--------------insert-----------------*
*회원가입 
*@insertMember -> insertMember():String
*
*--------------update-----------------*
*정보수정 
*@updateMember -> updateMember():String
*
*--------------delete-----------------*
*회원탈퇴
*@deleteMember -> deleteMember():String
*
*--------------select-----------------*
*id중복여부 체크
*@checkMid -> checkMid():String
*name중복여부 체크
*@checkMname -> checkMname():String
*마이페이지에 띄워줄 내 정보 가져오기
*@selectMember -> selectMember():String
*로그인
*@login -> selectIdPw():String
*
*----------------etc-------------------*
*로그아웃
*@logout -> logout():String
*
*/

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
import com.itbank.springProject.db.TagDAO;

@Controller
public class W_MemberController{
	
	@Autowired
	@Qualifier("MemberDAO")
	private MemberDAO memberDAO;
	
	@Autowired
	@Qualifier("worker")
	private W_MemberWorker worker;
	
	@Autowired
	@Qualifier("TagDAO")
	private TagDAO dao1;
	
	
//------------------------insert------------------------------------
	
	//회원가입
	@RequestMapping("won/insertMember")
	@ResponseBody
	public String insertMember(MemberDTO memberDTO){
		
		memberDTO = worker.settingBasicInfo(memberDTO);
 		
		try {
			//insert성공시 insertM으로
			memberDAO.insert(memberDTO);
			System.out.println("insertMember 성공");
			return "0";
		} catch (Exception e) {
			//insert실패시 다시 회원가입 화면으로
			System.out.println("insertMember 실패");
			e.printStackTrace();
			return "1";
		}
	}//end insertMember()
	
//------------------------update------------------------------------
	
	//정보수정 (0 : 성공 / 1 : 실패)
	@RequestMapping("won/updateMember")
	@ResponseBody
	public String updateMember(MemberDTO memberDTO,Model model){
		try {
			//정보수정 성공시 : 정보수정 성공한 데이터를 마이페이지에서 확인해줌
			memberDAO.update(memberDTO);
			MemberDTO mdto = memberDAO.select(memberDTO);
			//성공시 업데이트 성공한 dto를 모델에 담아서 마이페이지로 보내줌 
			model.addAttribute("memberDTO", mdto);
			System.out.println("updateMember 성공");
			return "0";
		} catch (Exception e) {
			//정보수정 실패시 : 정보수정 하기 전 데이터를 가지고 마이페이지로 돌아감
			e.printStackTrace();
			model.addAttribute("memberDTO", memberDTO);
			System.out.println("updateMember 실패");
			return "1";
		}
	}//end updateMember()
	
//------------------------delete------------------------------------
	
	//회원탈퇴
	@RequestMapping("won/deleteMember")
	@ResponseBody
	public String deleteMember(MemberDTO memberDTO,
			Model model,HttpSession session){
		try {
			//회원탈퇴 성공시 : 세션 삭제 후 탈퇴 성공 알림 띄워주고 메인페이지로 이동
			String mid = (String)session.getAttribute("mid");
			memberDTO.setMid(mid);
			memberDAO.delete(memberDTO);
			session.removeAttribute("mid");
			System.out.println("deleteMember 성공");
			return "0";
		} catch (Exception e) {
			//정보수정 실패시 : 정보수정 하기 전 데이터를 가지고 마이페이지로 돌아감
			e.printStackTrace();
			model.addAttribute("memberDTO", memberDTO);
			System.out.println("deleteMember 실패");
			return "1";
		}
	}//end deleteMember()
	
//------------------------select------------------------------------
	
	//회원가입시 아이디 중복확인
	@RequestMapping("won/checkMid")
	@ResponseBody
	public String checkMid(@RequestParam("mid") String mid, MemberDTO dto){
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
			
		} catch (Exception e) {
			//실패시 회원가입 페이지로 돌아감
			e.printStackTrace();
			System.out.println("select실패");
		}
		return mid; 
	}
	
	//회원가입시 이름 중복확인
	@RequestMapping("won/checkMname")
	@ResponseBody
	public String checkMname(@RequestParam("mname") String mname, MemberDTO dto){
		System.out.println("이름 중복확인 mname:"+ mname);
		System.out.println("이름 중복확인 dto:"+ dto.getMname());
		try {
			dto.setMname(mname);
			MemberDTO mdto = memberDAO.selectName(dto);
			if(mdto == null || mdto.getMname().equals("")){
				System.out.println("존재하지 않는 이름! 사용 가능합니다!");
			}else{
				System.out.println("존재하는 이름! 사용 가능!");
			}
			
		} catch (Exception e) {
			//실패시 회원가입 페이지로 돌아감
			e.printStackTrace();
			System.out.println("select실패");
		}
		return mname; 
	}
	
	//마이페이지에 정보수정 페이지에 필요한 개인정보 검색
	@RequestMapping("won/selectMember")
	public String selectMember(Model model, MemberDTO dto,
			HttpSession session){
		MemberDTO mdto = null;
		try {
			//세션에서 mid 가져와서 dto에 세팅
			String mid = (String)session.getAttribute("mid");
			System.out.println("mid에 있는 값 : "+mid);
			String s = mid.split("@")[1];
			System.out.println("@ : "+s);
			//페이스북 아이디를 이용해서 만든 임시 아이디일경우
			if(s.equals("facebook.com")){
				//세션의 mid중 @이전 값만 떼서 name에 넣어주기
				String name = mid.split("@")[0];
				//name값으로 dto에 세팅후 검색
				dto.setMname(name);
				mdto = memberDAO.selectName(dto);
			}else{
				//id값을 dto에 세팅후 검색
				dto.setMid(mid);
				mdto = memberDAO.select(dto);
			}
			//mdto의 값 확인 후 모델에 dto 넣어주기
			System.out.println(mdto.getMid());
			System.out.println(mdto.getMpw());
			System.out.println(mdto.getMname());
			System.out.println(mdto.getMprofile());
			System.out.println(mdto.getMtel());
			System.out.println(mdto.getMaddr1());
			System.out.println(mdto.getMaddr2());
			System.out.println(mdto.getGender());
			System.out.println(mdto.getAgegroup());
			System.out.println(mdto.getRdate());
			model.addAttribute("memberDTO", mdto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("select실패");
			return "redirect:/main.jsp";
		}
		return "won/mypage";
	}//end selectMember();
	
	// 로그인 확인 (-1 : db관련 실패 / 0 : 성공 / 1 : 아이디가 없음 / 2 : 비밀번호가 없음)
	@RequestMapping("won/login")
	@ResponseBody
	public String selectIdPw(MemberDTO memberDTO, HttpSession session) {
		System.out.println("login!! 잘 찾아왔어!!!");
		try {
			MemberDTO mdto = memberDAO.select(memberDTO);
			// 로그인 실패시
			if (mdto == null) {
				// 아이디가 존재하지 않는경우
				System.out.println("1 : 아이디가 존재하지 않습니다.");
				return "1";
			} else {
				// 아이디가 존재하는 경우
				// 입력받은 비밀번호와 아이디로 검색한 비밀번호가 일치하는지 확인
				if (mdto.getMpw() == memberDTO.getMpw() || mdto.getMpw().equals(memberDTO.getMpw())) {
					// 일치하는 경우 - 세션에 아이디를 넣어줌!
					System.out.println("controller - 로그인 성공 : " + memberDTO.getMid());
					String mid = memberDTO.getMid();
					if(memberDTO.getMpw().equals("FBEXLOGIN")){
						int rs = worker.checkFBMid(mid);
						if(rs==1){
							//facebook id가 이메일 형식이 아닌경우 이름+이메일형식으로 만들어줌
							mid = memberDTO.getMname()+"@facebook.com";
						}
					}
					session.setAttribute("mid", mid);
					// 최근 접속일자 수정해줌
					mdto = worker.settingBasicInfo(mdto); // 최근접속일 세팅
					memberDAO.updateDate(mdto); // 최근접속일 수정
					System.out.println(session.getAttribute("mid"));
					
					String tag = dao1.mongoSelect(memberDTO.getMid());
					System.out.println(tag);
					if(tag != null) {						
						session.setAttribute("favor", tag);
					}
					
					System.out.println("0 : 로그인 처리 성공");
					return "0#"+mid;
				} else {
					// 일치하지 않는 경우
					System.out.println("2 : 비밀번호가 일치하지 않습니다");
					return "2";
				}
			}
		} catch (Exception e) {
			// 실패시 로그인 페이지로 돌아감
			e.printStackTrace();
			System.out.println("-1 : select실패");
			return "-1";
		} // end try~catch
	}// end selectIdPw

//------------------------etc------------------------------------
	
	// 로그아웃하는 컨트롤러
	@RequestMapping("won/logout")
	public String logout(HttpSession session) {
		// 삭제할 mid확인
		System.out.println(session.getAttribute("mid"));
		session.removeAttribute("mid");
		session.removeAttribute("favor");
		// 삭제되었는지 확인
		System.out.println(session.getAttribute("mid"));
		return "redirect:/won/logout.jsp";
	}//end logout
	
}//end class
