package com.stock.model;

public class MyProfile {
	private String username;
	private String company;
	private int percentChange;
	private boolean gain;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getPercentChange() {
		return percentChange;
	}
	public void setPercentChange(int percentChange) {
		this.percentChange = percentChange;
	}
	public boolean isGain() {
		return gain;
	}
	public void setGain(boolean gain) {
		this.gain = gain;
	}

}
