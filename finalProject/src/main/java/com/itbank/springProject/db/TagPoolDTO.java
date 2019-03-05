package com.itbank.springProject.db;

public class TagPoolDTO {

		private String ProjectInfo;
		private int count;
		private String mid;
		private String subject;
		
		public String getMid() {
			return mid;
		}
		public void setMid(String mid) {
			this.mid = mid;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getProjectInfo() {
			return ProjectInfo;
		}
		public void setProjectInfo(String projectInfo) {
			ProjectInfo = projectInfo;
		}
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
}
