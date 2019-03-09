package com.itbank.springProject.db;

public class CommentDTO {

	private String pid;//관관명소 아이디
	private int bnum;//댓글넘버
	private String mid;//작성자 아이디
	private String content;//작성내용
	private String bdate;//작성시간
	private String parents;//부모
	private int depth;//깊이
	private int border;//순서
	private int star;//별점
	
	public CommentDTO() {//기본생성자
		super();
	}

	public CommentDTO(String pid, int bnum, String mid, String content, String bdate, String parents, int depth,
			int border, int star) {//매개변수가 존재하는 생성자
		super();
		this.pid = pid;
		this.bnum = bnum;
		this.mid = mid;
		this.content = content;
		this.bdate = bdate;
		this.parents = parents;
		this.depth = depth;
		this.border = border;
		this.star = star;
	}


	public String getPid() {
		return pid;
	}


	public void setPid(String pid) {
		this.pid = pid;
	}


	public int getBnum() {
		return bnum;
	}


	public void setBnum(int bnum) {
		this.bnum = bnum;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getBdate() {
		return bdate;
	}


	public void setBdate(String bdate) {
		this.bdate = bdate;
	}


	public String getParents() {
		return parents;
	}


	public void setParents(String parents) {
		this.parents = parents;
	}


	public int getDepth() {
		return depth;
	}


	public void setDepth(int depth) {
		this.depth = depth;
	}


	public int getBorder() {
		return border;
	}


	public void setBorder(int border) {
		this.border = border;
	}


	public int getStar() {
		return star;
	}


	public void setStar(int star) {
		this.star = star;
	}
	
}//CommentDTO 끝
