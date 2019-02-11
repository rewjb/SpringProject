package rew;

public class PlaceCartDTO {
	
	private String mid;
	private String pid;
	
	public String getMid() {
		return mid;
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
	
	public PlaceCartDTO(String mid, String pid) {
		super();
		this.mid = mid;
		this.pid = pid;
	}
	
	public PlaceCartDTO() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "[mid : "+mid+"] /"+" [pid : "+pid+"]";
	}

}
