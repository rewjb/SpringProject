package com.itbank.springProject.db;

public class AttractionsDTO {
	
	private String continent;// 대륙
	private String city;// 도시
	private String pid;// 고유아이디
	private String mainImg;// 메인이미지
	private String title;// 명소이름
	private String content;// 내용
	private String contentElements;// 상세내용
	private String findWay;// 길찾기
	private String longitude;// 경도
	private String latitude;// 위도
	private String category;// 태그
	private double star;//별점
	
	
	public AttractionsDTO() {//기본 생성자
		super();
	}


	public AttractionsDTO(String continent, String city, String pid, String mainImg, String title, String content,
			String contentElements, String findWay, String longitude, String latitude, String category, double star) {//매개변수가 있는 생성자 
		super();
		this.continent = continent;
		this.city = city;
		this.pid = pid;
		this.mainImg = mainImg;
		this.title = title;
		this.content = content;
		this.contentElements = contentElements;
		this.findWay = findWay;
		this.longitude = longitude;
		this.latitude = latitude;
		this.category = category;
		this.star = star;
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


	public String getPid() {
		return pid;
	}


	public void setPid(String pid) {
		this.pid = pid;
	}


	public String getMainImg() {
		return mainImg;
	}


	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
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


	public String getContentElements() {
		return contentElements;
	}


	public void setContentElements(String contentElements) {
		this.contentElements = contentElements;
	}


	public String getFindWay() {
		return findWay;
	}


	public void setFindWay(String findWay) {
		this.findWay = findWay;
	}


	public String getLongitude() {
		return longitude;
	}


	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}


	public String getLatitude() {
		return latitude;
	}


	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public double getStar() {
		return star;
	}


	public void setStar(double star) {
		this.star = star;
	}


	@Override
	public String toString() {
		return "AttractionsDTO [continent=" + continent + ", city=" + city + ", pid=" + pid + ", mainImg=" + mainImg
				+ ", title=" + title + ", content=" + content + ", contentElements=" + contentElements + ", findWay="
				+ findWay + ", longitude=" + longitude + ", latitude=" + latitude + ", category=" + category + ", star="
				+ star + "]";
	}
	
	
	
}//attractionDTO클래스 끝
