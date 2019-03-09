package com.itbank.springProject.joe.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.db.AttractionsDAO;
import com.itbank.springProject.db.AttractionsDTO;
import com.itbank.springProject.db.CommentDAO;
import com.itbank.springProject.db.CommentDTO;

@Controller
public class CommentController {

	//댓글 DAO 
	@Autowired
	@Qualifier("CommentDAO")
	CommentDAO dao;
	
	@Autowired
	@Qualifier("AttractionsDAO")
	private AttractionsDAO attractionsDAO;

	@RequestMapping("joe/review")
	public String review(CommentDTO commentDTO, Model model ,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
//		System.out.println("1번");
		AttractionsDTO dto = new AttractionsDTO();
//		System.out.println("dto 출력");
//		System.out.println(commentDTO.getMid());
//		System.out.println(commentDTO.getPid());
//		System.out.println(commentDTO.getStar());
	
		
		dao.insert(commentDTO);
		
		dto.setPid(commentDTO.getPid());
		dto.setStar(dao.starAvgSelect(commentDTO.getPid()) );
		
//		System.out.println("과연 몇나오나"+dao.starAvgSelect(commentDTO.getPid()));
		
		attractionsDAO.starUpdate(dto);
		
//		System.out.println("2번");
		List<CommentDTO> list = dao.selectPid(commentDTO.getPid());
		model.addAttribute("list", list);
		
		return "joe/comment";
	}

	@RequestMapping("joe/reviewAll")
	public String reviewAll(Model model , @RequestParam("pid") String pid ,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
//		System.out.println("pid" + pid);
		List<CommentDTO> list = dao.selectPid(pid);
		model.addAttribute("list", list);
		return "joe/comment";
	}

	@RequestMapping("joe/review2")
	public String reviewReview( CommentDTO commentDTO, Model model ,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");

		System.out.println(commentDTO.getBnum());
//		System.out.println("pid뭐가 넘어옴?" + commentDTO.getPid());
		CommentDTO dto = dao.select(commentDTO);

		commentDTO.setParents(dto.getParents());
		commentDTO.setDepth(dto.getDepth() + 1);
		commentDTO.setBorder(dao.borderSelect(dto));

//		System.out.println("순서" + dao.borderSelect(dto));

		dao.insertInsert(commentDTO);

		List<CommentDTO> list = dao.selectPid(commentDTO.getPid());
		model.addAttribute("list", list);

		return "joe/comment";
	}

	@RequestMapping("joe/reviewUpdate")
	public String reviewUpdate(@RequestParam("input2") String bnum, @RequestParam("content") String content, @RequestParam("pid") String pid,
			Model model ,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
		
//		System.out.println("pid"+pid);
//		System.out.println("bnum"+bnum);
//		System.out.println("content"+content);
		
		CommentDTO dto = new CommentDTO();
//		System.out.println("번호 : " + bnum);
//		System.out.println("내용 : " + content);
		dto.setPid(pid);
		dto.setBnum(Integer.parseInt(bnum));
		dto.setContent(content);

		dao.update(dto);

		List<CommentDTO> list = dao.selectPid(pid);
		model.addAttribute("list", list);

		return "joe/comment";

	}

	@RequestMapping("joe/reviewDelete")
	public String reviewDelete(@RequestParam("bnum") String bnum, @RequestParam("parents") String parents,@RequestParam("pid") String pid,
			@RequestParam("mid") String mid,
			Model model ,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");

//		System.out.println("번호"+bnum);
//		System.out.println("엄마"+parents);
		CommentDTO dto = new CommentDTO();
		dto.setParents(parents);
		dto.setBnum(Integer.parseInt(bnum));
		dto.setMid(mid);
		dto.setPid(pid);
		if (dao.selectParents(dto).size() > 1) {
			dao.delete(dto);
		} else {
			dao.deleteOne(dto);
		}

		List<CommentDTO> list = dao.selectPid(pid);
		model.addAttribute("list", list);

		return "joe/comment";
	}

}
