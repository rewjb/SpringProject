package com.itbank.springProject.db;

public class PlaceCartDTO {

	private String mid;
	//회원 아이디;
	private String pid;
	//관광명소 아이디
	
	
	// 아래는 관광명소 테이블과의 조합을 통한 삽입
	private String title;
	// 명소이름
	private String content;
	// 명소의 간략한 설명
	private String latitude;
	// 위도
	private String longitude;
	// 경도
	private String mainImg;
	// 메인이미지
	
	
	public String getMid() {
		return mid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public PlaceCartDTO(String mid, String pid, String title, String latitude, String longitude, String mainImg , String content) {
		super();
		this.mid = mid;
		this.pid = pid;
		this.title = title;
		this.latitude = latitude;
		this.longitude = longitude;
		this.mainImg = mainImg;
		this.content = content;
	}
	
	public PlaceCartDTO() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "[mid : " + mid + "]" + "\n"+
	           "[pid : " + pid + "]" + "\n"+
	           "[title : " + title + "]" + "\n"+
	           "[latitude : " + latitude + "]" + "\n"+
	           "[longitude : " + longitude + "]" + "\n"+
	           "[mainImg : " + mainImg + "]" + "\n";
	}

}
