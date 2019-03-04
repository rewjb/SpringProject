package com.itbank.springProject.db;

public class MemberDTO {
	private String mid;			//1.email 		: primary notnull
	private String mpw;			//2.			:  notnull
	private String mname;		//3.user's name : unique notnull
	private String mprofile;	//4.profile picture
	private String mtel;		//5.tel
	private String maddr1;		//6.by api	
	private String maddr2;		//7.by user
	private String gender;		//8.Male,Female,Others
	private String agegroup;	//9.age group	
	private String rdate;		//10.Recent sign-in
	
	
	
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(String mid, String mpw, String mname, String mprofile, String mtel, String maddr1, String maddr2,
			String gender, String agegroup, String rdate) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mprofile = mprofile;
		this.mtel = mtel;
		this.maddr1 = maddr1;
		this.maddr2 = maddr2;
		this.gender = gender;
		this.agegroup = agegroup;
		this.rdate = rdate;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMprofile() {
		return mprofile;
	}

	public void setMprofile(String mprofile) {
		this.mprofile = mprofile;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getMaddr1() {
		return maddr1;
	}

	public void setMaddr1(String maddr1) {
		this.maddr1 = maddr1;
	}

	public String getMaddr2() {
		return maddr2;
	}

	public void setMaddr2(String maddr2) {
		this.maddr2 = maddr2;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAgegroup() {
		return agegroup;
	}

	public void setAgegroup(String agegroup) {
		this.agegroup = agegroup;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	
	}
