package rew;

public class PlaceCartDTO {

	private String mid;
	//회원 아이디;
	private String pid;
	//관광명소 아이디
	private String title;
	// 명소이름
	private String latitude;
	// 위도
	private String longitude;
	// 경도
	private String mainImg;
	// 메인이미지
	
	
	
	
	
	
	

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
