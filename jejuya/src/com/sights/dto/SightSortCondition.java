package com.sights.dto;

import java.io.Serializable;

public class SightSortCondition implements Serializable{
	private int category;
	private String theme;
	private String sortSel;
	
	public SightSortCondition() {}

	public SightSortCondition(int category, String theme, String sortSel) {
		super();
		this.category = category;
		this.theme = theme;
		this.sortSel = sortSel;
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

	public String getSortSel() {
		return sortSel;
	}

	public void setSortSel(String sortSel) {
		this.sortSel = sortSel;
	}

	@Override
	public String toString() {
		return "SightSortCondition [category=" + category + ", theme=" + theme + ", sortSel=" + sortSel + "]";
	}
	
	
}
