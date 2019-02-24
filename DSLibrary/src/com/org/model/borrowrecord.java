package com.org.model;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.sun.corba.se.impl.protocol.giopmsgheaders.Message;



public class borrowrecord implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String bid;
	String rnumber;
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
	String bname;
	String rname;
	String classnum;
	Date borrowdate;
	Date returndate ;
	int borrownum;
	int day;
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	static String messString;
	public int getBorrownum() {
		return borrownum;
	}
	public void setBorrownum(int borrownum) {
		
		this.borrownum=borrownum;
	}
	@Override
	public int hashCode() {
		 int result = 17;  
	        result = result * 31 + bid.hashCode();  
	        result = result * 31 + rnumber.hashCode();  
	             
	        return result;  
		
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(this==obj) return true;
		if(obj==null) return false;
		if(obj instanceof borrowrecord){
			
		borrowrecord br=(borrowrecord) obj;
		if(br.bid.equals(this.bid)&&br.rnumber.equals(this.rnumber)&&br.borrowdate.equals(this.borrowdate)&&br.returndate.equals(this.returndate))
			return true;
		}
		
		return false;
		
		
	}
	
	
	public borrowrecord() {
		
	}
	public borrowrecord(String bid,String rnumber, String bname, String rname,
			int b,String classnum, Date borrowdate, Date returndate) {
		super();
		this.bid=bid;
		this.rnumber=rnumber;
		this.bname = bname;
		this.rname = rname;
		this.borrownum=b;
		this.classnum = classnum;
		this.borrowdate = borrowdate;
		this.returndate = returndate;
	}
	
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getClassnum() {
		return classnum;
	}
	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}
	public Date getBorrowdate() {
		
		return borrowdate;
	}
	public void setBorrowdate(Date borrowdate) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String s=sdf.format(borrowdate);Date a = null;
		try {
			a=sdf.parse(s);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.borrowdate = a;
	}
	public Date getReturndate() {
		return returndate;
	}
	public void setReturndate(Date returndate) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String s=sdf.format(returndate);Date a = new Date();
		try {
			a=sdf.parse(s);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		this.returndate= a;
	}
	

}
