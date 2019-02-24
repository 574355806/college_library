package com.org.model;


public class reader {
private String rnumber;
private String rname;
private String rsex;
private String classnum;
private String dept;
private int rage;
public reader() {
	super();
	
}
public int getRage() {
	return rage;
}
public void setRage(int rage) {
	this.rage = rage;
}

public String getRnumber() {
	return rnumber;
}
public void setRnumber(String rnumber) {
	this.rnumber = rnumber;
}
public String getRname() {
	return rname;
}
public void setRname(String rname) {
	this.rname = rname;
}
public String getRsex() {
	return rsex;
}
public void setRsex(String rsex) {
	this.rsex = rsex;
}
public String getClassnum() {
	return classnum;
}
public void setClassnum(String classnum) {
	this.classnum = classnum;
}
public String getDept() {
	return dept;
}
public void setDept(String dept) {
	this.dept = dept;
}

public reader(String rnumber, String rname, String rsex, String classnum,
		String dept ,int rage) {
	super();
	this.rnumber = rnumber;
	this.rname = rname;
	this.rsex = rsex;
	this.classnum = classnum;
	this.dept = dept;
	this.rage=rage;
}




}
