package com.org.model;

public class bookkey {
	String bid;
	String rnumber;
	public bookkey() {
		// TODO Auto-generated constructor stub
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getRnumber() {
		return rnumber;
	}
	public void setRnumber(String rnumber) {
		this.rnumber = rnumber;
	}
	public bookkey(String bid, String rnumber) {
		super();
		this.bid = bid;
		this.rnumber = rnumber;
	}
	

}
