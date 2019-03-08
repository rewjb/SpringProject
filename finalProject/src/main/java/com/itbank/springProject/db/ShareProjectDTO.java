package com.itbank.springProject.db;

public class ShareProjectDTO {

	private String mid;
	private String ptitle;
	private String reg_date;
	private String img;
	
	private String star;
	//별점을 갖고오기 위한 변수 
	
	public String getStar() {
		return star;
	}
	public void setStar(String string) {
		this.star = string;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public ShareProjectDTO(String mid, String ptitle, String reg_date) {
		super();
		this.mid = mid;
		this.ptitle = ptitle;
		this.reg_date = reg_date;
	}
	
	public ShareProjectDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	

}
