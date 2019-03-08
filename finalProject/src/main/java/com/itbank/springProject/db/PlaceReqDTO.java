package com.itbank.springProject.db;

public class PlaceReqDTO {

	private int no;
	private String continent;
	private String city;
	private String title;
	private String address;
	private String content;
	private String contentElements;
	private String mainImg;
	private String time;
	private String userId;
	
	public PlaceReqDTO() {
		// TODO Auto-generated constructor stub
	}

	public PlaceReqDTO(String continent, String city, String title, String address, String content,
			String contentElements, String mainImg) {
		super();
		this.continent = continent;
		this.city = city;
		this.title = title;
		this.address = address;
		this.content = content;
		this.contentElements = contentElements;
		this.mainImg = mainImg;
	}
		
	public PlaceReqDTO(int no, String continent, String city, String title, String address, String content,
			String contentElements, String mainImg, String time) {
		super();
		this.no = no;
		this.continent = continent;
		this.city = city;
		this.title = title;
		this.address = address;
		this.content = content;
		this.contentElements = contentElements;
		this.mainImg = mainImg;
		this.time = time;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContentElements() {
		return contentElements;
	}

	public void setContentElements(String contentElements) {
		this.contentElements = contentElements;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "PlaceReqDTO [no=" + no + ", continent=" + continent + ", city=" + city + ", title=" + title
				+ ", address=" + address + ", content=" + content + ", contentElements=" + contentElements
				+ ", mainImg=" + mainImg + ", time=" + time + ", userId=" + userId + "]";
	}
	
	
	
}
