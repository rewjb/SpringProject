package com.itbank.springProject.db;

import org.springframework.data.mongodb.core.MongoClientFactoryBean;

import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;

public class PlanDTO {
	
	private String pid;
	private String mid;
	private String ptitle;
	private String title;
	private String content;
	private String latitude;
	private String longitude;
	private String way;
	private String mainImg;
	private String detail;
	private String num;
	private String distance;
	
	
	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
	
	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
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

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public PlanDTO(String mid, String ptitle, String title, String content, String latitude, String longitude,
			String way, String mainImg, String num) {
		super();
		this.mid = mid;
		this.ptitle = ptitle;
		this.title = title;
		this.content = content;
		this.latitude = latitude;
		this.longitude = longitude;
		this.way = way;
		this.mainImg = mainImg;
		this.num = num;
	}
	
	public PlanDTO() {
		// TODO Auto-generated constructor stub
	}

     @Override
    public String toString() {
    	 
    	 StringBuffer tostring = new StringBuffer();
    	 tostring.append("[");
    	 tostring.append("   mid=   "+mid);
    	 tostring.append("   ptitle=   "+ptitle);
    	 tostring.append("   title=   "+title);
    	 tostring.append("   content=   "+content);
    	 tostring.append("   latitude=   "+latitude);
    	 tostring.append("   longitude=   "+longitude);
    	 tostring.append("   way=   "+way);
    	 tostring.append("   mainImg=   "+mainImg);
    	 tostring.append("   num=   "+num);
    	 tostring.append("]");
    	 
    	return tostring.toString();
    }	

	
	
}
