package com.itbank.springProject.db;

public class TagDTO {
	
	private String name;
	private String tag;
	private String path;
	
	public TagDTO() {
		// TODO Auto-generated constructor stub
	}

	public TagDTO(String name, String tag, String path) {
		super();
		this.name = name;
		this.tag = tag;
		this.path = path;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	

}
