package com.itbank.springProject.db;

public class Mongo_ShareProjectDTO {
	
	private  String pMid;
	private  String mid;
	private String ptitle;
	private String content;
	private int starValue;
	private int beforeStar;
	private String reg_date;
	private String distinction;
	private int level;
	
	
	public int getBeforeStar() {
		return beforeStar;
	}
	public void setBeforeStar(int beforeStar) {
		this.beforeStar = beforeStar;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getDistinction() {
		return distinction;
	}
	public void setDistinction(String distinction) {
		this.distinction = distinction;
	}
	public String getpMid() {
		return pMid;
	}
	public void setpMid(String pMid) {
		this.pMid = pMid;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStarValue() {
		return starValue;
	}
	public void setStarValue(int starValue) {
		this.starValue = starValue;
	}
	
	@Override
	public String toString() {
		StringBuffer outPut = new StringBuffer();
		outPut.append("[");
		outPut.append("pMid="+pMid);
		outPut.append("/ mid="+mid);
		outPut.append("/ ptitle="+ptitle);
		outPut.append("/ content="+content);
		outPut.append("/ starValue="+starValue);
		outPut.append("/ reg_date="+reg_date);
		outPut.append("/ distinction="+distinction);
		outPut.append("/ level="+level);
		outPut.append("/ beforeStar="+beforeStar);
		outPut.append("]");
		return outPut.toString();
	}
	
	
	
	
	
	
	

}
