package com.itbank.springProject.joe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.springProject.db.CommentDAO;
import com.itbank.springProject.db.CommentDTO;

@Controller
public class CommentController {

	@Autowired
	@Qualifier("CommentDAO")
	CommentDAO dao;

	@RequestMapping("joe/review")
	public String review(CommentDTO commentDTO, Model model) {
		System.out.println("1번");
		dao.insert(commentDTO);
		System.out.println("2번");
		List<CommentDTO> list = dao.selectAll();
		model.addAttribute("list", list);
		
		return "joe/comment";
	}

	@RequestMapping("joe/reviewAll")
	public String reviewAll(Model model) {

		List<CommentDTO> list = dao.selectAll();
		model.addAttribute("list", list);

		return "joe/comment";
	}

	@RequestMapping("joe/review2")
	public String reviewReview(@RequestParam("input") String bnum, CommentDTO commentDTO, Model model) {

		System.out.println("컨트롤러왔다");

		CommentDTO dto = dao.select(Integer.parseInt(bnum));

		commentDTO.setParents(dto.getParents());
		commentDTO.setDepth(dto.getDepth() + 1);
		commentDTO.setBorder(dao.borderSelect(dto));

		System.out.println("순서" + dao.borderSelect(dto));

		dao.insertInsert(commentDTO);

		List<CommentDTO> list = dao.selectAll();
		model.addAttribute("list", list);

		return "joe/comment";
	}

	@RequestMapping("joe/reviewUpdate")
	public String reviewUpdate(@RequestParam("input2") String bnum, @RequestParam("content") String content,
			Model model) {

		CommentDTO dto = new CommentDTO();
		System.out.println("번호 : " + bnum);
		System.out.println("내용 : " + content);
		dto.setBnum(Integer.parseInt(bnum));
		dto.setContent(content);

		dao.update(dto);

		List<CommentDTO> list = dao.selectAll();
		model.addAttribute("list", list);

		return "joe/comment";

	}

	@RequestMapping("joe/reviewDelete")
	public String reviewDelete(@RequestParam("bnum") String bnum, @RequestParam("parents") String parents,
			Model model) {

		System.out.println("번호"+bnum);
		System.out.println("엄마"+parents);
		CommentDTO dto = new CommentDTO();
		dto.setParents(parents);
		dto.setBnum(Integer.parseInt(bnum));

		if (dao.selectParents(parents).size() > 1) {
			dao.delete(dto);
		} else {
			dao.deleteOne(Integer.parseInt(bnum));
		}

		List<CommentDTO> list = dao.selectAll();
		model.addAttribute("list", list);

		return "joe/comment";
	}

}
