package com.sights.dto;

import java.io.Serializable;

public class SightsDto implements Serializable {
	
		// 기본정보
		private int seq;
				
		private String title;	// 관광지명
		private String category;// 관광지종류
		private String theme; 	// 자연, 문화관광, 레저 등..
		private String address;	// 주소	
		private String phone;
		private String homepage;	// 홈페이지 주소	
		private String content;	// 상세정보
		private String imageName;	// 대표이미지
		
		private int addSchedule;	// 일정담기 -> 랭킹
		private int del;
		private int readcount;
		
		
		public SightsDto() { }
		
		public SightsDto(int seq, String title, String address, String homepage) {
			super();
			this.seq = seq;
			this.title = title;
			this.address = address;
			this.homepage = homepage;
		}
		
		public SightsDto(int seq, String title, String category, String theme, String address, String homepage) {
			super();
			this.seq = seq;
			this.title = title;
			this.category = category;
			this.theme = theme;
			this.address = address;
			this.homepage = homepage;
		}
		
		public int getSeq() {
			return seq;
		}
		public void setSeq(int seq) {
			this.seq = seq;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getTheme() {
			return theme;
		}
		public void setTheme(String theme) {
			this.theme = theme;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getHomepage() {
			return homepage;
		}
		public void setHomepage(String homepage) {
			this.homepage = homepage;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getImageName() {
			return imageName;
		}
		public void setImageName(String imageName) {
			this.imageName = imageName;
		}
		public int getAddSchedule() {
			return addSchedule;
		}
		public void setAddSchedule(int addSchedule) {
			this.addSchedule = addSchedule;
		}
		public int getDel() {
			return del;
		}
		public void setDel(int del) {
			this.del = del;
		}
		public int getReadcount() {
			return readcount;
		}
		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}
		
		
		public String getCategory() {
			return category;
		}

		
		public void setCategory(String category) {
			this.category = category;
		}
		public SightsDto(int seq, String title, String category, String theme, String address, String phone,
				String homepage, String content, String imageName, int addSchedule, int del, int readcount) {
			super();
			this.seq = seq;
			this.title = title;
			this.category = category;
			this.theme = theme;
			this.address = address;
			this.phone = phone;
			this.homepage = homepage;
			this.content = content;
			this.imageName = imageName;
			this.addSchedule = addSchedule;
			this.del = del;
			this.readcount = readcount;
		}
		@Override
		public String toString() {
			return "SightsDto [seq=" + seq + ", title=" + title + ", category=" + category + ", theme=" + theme
					+ ", address=" + address + ", phone=" + phone + ", homepage=" + homepage + ", content=" + content
					+ ", imageName=" + imageName + ", addSchedule=" + addSchedule + ", del=" + del + ", readcount="
					+ readcount + "]";
		}	
		
		

}
