package com.org.model;

public class book {
	String bid;
	String bname;
	double bprice;
	int bnumber;
	String btype;
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	String bwriter;
	String bpublisher;
	String bplace;
	int bborrow;
	
	public book() {
		
	}
	public book(String bid, String bname, double bprice, int bnumber,
			String bwriter, String bpublisher, String bsplace, int bborrow,String btype) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.bprice = bprice;
		this.bnumber = bnumber;
		this.bwriter = bwriter;
		this.bpublisher = bpublisher;
		this.bplace = bsplace;
		this.bborrow = bborrow;
		this.btype=btype;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public double getBprice() {
		return bprice;
	}
	public void setBprice(double bprice) {
		this.bprice = bprice;
	}
	public int getBnumber() {
		return bnumber;
	}
	public void setBnumber(int bnumber) {
		this.bnumber = bnumber;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBpublisher() {
		return bpublisher;
	}
	public void setBpublisher(String bpublisher) {
		this.bpublisher = bpublisher;
	}
	public String getBplace() {
		return bplace;
	}
	public void setBplace(String bsplace) {
		this.bplace = bsplace;
	}
	public int getBborrow() {
		return bborrow;
	}
	public void setBborrow(int bborrow) {
		this.bborrow = bborrow;
	}
	
	
}
