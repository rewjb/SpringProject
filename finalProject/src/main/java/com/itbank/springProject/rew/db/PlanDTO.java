package com.itbank.springProject.rew.db;

public class PlanDTO {
	
	private String mid;
	private String ptitle;
	private String title;
	private String content;
	private String latitude;
	private String longitude;
	private String way;
	private String mainimg;
	private int num;
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getWay() {
		return way;
	}
	public void setWay(String way) {
		this.way = way;
	}
	public String getMainimg() {
		return mainimg;
	}
	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public PlanDTO(String mid, String ptitle, String title, String content, String latitude, String longitude,
			String way, String mainimg, int num) {
		super();
		this.mid = mid;
		this.ptitle = ptitle;
		this.title = title;
		this.content = content;
		this.latitude = latitude;
		this.longitude = longitude;
		this.way = way;
		this.mainimg = mainimg;
		this.num = num;
	}
	
	public PlanDTO() {
		// TODO Auto-generated constructor stub
	}

	

	
	
}
