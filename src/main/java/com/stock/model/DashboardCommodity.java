package com.stock.model;

public class DashboardCommodity {
	private String commodity;
	private int price;
	private int percentChange;

	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPercentChange() {
		return percentChange;
	}
	public void setPercentChange(int percentChange) {
		this.percentChange = percentChange;
	}
	public String getCommodity() {
		return commodity;
	}
	public void setCommodity(String commodity) {
		this.commodity = commodity;
	}

}
