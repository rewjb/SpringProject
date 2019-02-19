package com.itbank.springProject.db;

public class PlanDTO {
	
	private String mid;
	private String ptitle;
	private String title;
	private String content;
	private double latitude;
	private double longitude;
	private String way;
	private String mainImg;
	private String detail;
	private int num;
	private int distance;
	
	
	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
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

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public PlanDTO(String mid, String ptitle, String title, String content, double latitude, double longitude,
			String way, String mainImg, int num) {
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
