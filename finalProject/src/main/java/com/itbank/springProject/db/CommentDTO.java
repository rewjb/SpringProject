package com.itbank.springProject.db;

public class CommentDTO {

	private String pid;//관관명소 아이디
	private int bnum;//댓글넘버
	private String id;//작성자 아이디
	private String content;//작성내용
	private String bdate;//작성시간
	private String parents;//부모
	private int depth;//깊이
	private int border;//순서
	public CommentDTO(String pid, int bnum, String id, String content, String bdate, String parents, int depth,
			int border) {
		super();
		this.pid = pid;
		this.bnum = bnum;
		this.id = id;
		this.content = content;
		this.bdate = bdate;
		this.parents = parents;
		this.depth = depth;
		this.border = border;
	}
	public CommentDTO() {
		super();
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	
	
	
	
}
