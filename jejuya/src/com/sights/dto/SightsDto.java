package com.sights.dto;

import java.io.Serializable;

public class SightsDto implements Serializable {
	
		private static final long serialVersionUID = 1L;
		// 기본정보
		private String title;	// 관광지명
		
		private int seq;
		
		private int category;// 관광지종류
		private String theme; 	// 자연, 문화관광, 레저 등..
		private String filename;	// 대표이미지
		private String address;	// 주소	
	
		private String phone;
		private String homepage;	// 홈페이지 주소	
		private String content;	// 상세정보
		
		
		private int addSchedule;	// 일정담기 -> 랭킹
		private int del;
		private int readcount;
		
		public SightsDto() {
		}
		
		public SightsDto(String title, int seq, int category, String theme, String filename, String address,
				String phone, String homepage, String content, int addSchedule, int del, int readcount) {
			super();
			this.title = title;
			this.seq = seq;
			this.category = category;
			this.theme = theme;
			this.filename = filename;
			this.address = address;
			this.phone = phone;
			this.homepage = homepage;
			this.content = content;
			this.addSchedule = addSchedule;
			this.del = del;
			this.readcount = readcount;
		}
		
		

		public SightsDto(int category, String theme) {
			super();
			this.category = category;
			this.theme = theme;
		}

		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public int getSeq() {
			return seq;
		}
		public void setSeq(int seq) {
			this.seq = seq;
		}
		public int getCategory() {
			return category;
		}
		public void setCategory(int category) {
			this.category = category;
		}
		public String getTheme() {
			return theme;
		}
		public void setTheme(String theme) {
			this.theme = theme;
		}
		public String getFilename() {
			return filename;
		}
		public void setFilename(String filename) {
			this.filename = filename;
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
		@Override
		public String toString() {
			return "SightsDto [title=" + title + ", seq=" + seq + ", category=" + category + ", theme=" + theme
					+ ", filename=" + filename + ", address=" + address + ", phone=" + phone + ", homepage=" + homepage
					+ ", content=" + content + ", addSchedule=" + addSchedule + ", del=" + del + ", readcount="
					+ readcount + "]";
		}
		
		
		
		
		
		

}
