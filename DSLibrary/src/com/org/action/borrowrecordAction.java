package com.org.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.ActionMessage;
import org.objectweb.asm.tree.IntInsnNode;

import sun.org.mozilla.javascript.internal.ContextAction;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.org.dao.bookdao;
import com.org.dao.borrowredao;
import com.org.dao.readerdao;
import com.org.model.book;
import com.org.model.borrowrecord;
import com.org.model.reader;
import com.sun.org.apache.commons.collections.StaticBucketMap;

public class borrowrecordAction extends ActionSupport implements ModelDriven<borrowrecord> {
	List<borrowrecord> brlist;
	borrowrecord br;
public List getBrlist() {
		return brlist;
	}

	public void setBrlist(List brlist) {
		this.brlist = brlist;
	}

	public borrowrecord getBr() {
		return br;
	}

	public void setBr(borrowrecord br) {
		this.br = br;
	}

	public String addborrow(){
		bookdao bdao=new bookdao();
		readerdao rdao=new readerdao();
		
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		SimpleDateFormat formatter  = new SimpleDateFormat ("yyyy-MM-dd");
		String mes ;
		String bdateString=request.getParameter("borrowdate1");
		
		//String rdateString=request.getParameter("returndate1");
		String bString=request.getParameter("borrownum");
		int borrownum=Integer.parseInt(bString);
		String bidString=request.getParameter("bid");
		String rnumberString=request.getParameter("rnumber");
		
		book book1=bdao.getbook(bidString);
		reader reader1=rdao.getreader(rnumberString);
		System.err.println(br.getBid()+br.getRnumber());
	if(book1==null||reader1==null)
	{	
		
		mes="无此书编号或读者编号";	
		session.setAttribute("mes", mes);
		addActionMessage(mes);	System.err.println(mes);
		return "addborrow";
	}
	if(book1.getBnumber()<(book1.getBborrow()+borrownum))
	{
		mes="此书已库存不足，无法出借";session.setAttribute("mes", mes);
		addActionMessage(mes);
		return "addborrow";
	}
	br.setBname(book1.getBname());
	br.setRname(reader1.getRname());
	br.setClassnum(reader1.getClassnum());
	
	
	 book1.setBborrow(book1.getBborrow()+borrownum);
		bdao.updatebook(book1);
     Date borrowDate,returndate;
 	

     try {
		borrowDate = formatter.parse(bdateString);
	//	returndate=formatter.parse(rdateString);
		Calendar calendar=new GregorianCalendar();
		calendar.setTime(borrowDate);
		calendar.add(calendar.MONTH, 2);
	 Date a=calendar.getTime();
		br.setBorrowdate(borrowDate);
		br.setReturndate(calendar.getTime());
		br.setBorrownum(borrownum);
		System.out.print(borrowDate);
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		mes="日期错误";System.err.println(mes);
		addActionMessage(mes);return "addborrow";
	}
     System.err.println(br.getBorrowdate());
		borrowredao brdao=new borrowredao();
		if(brdao.insert(br)==true)
			mes="借书成功";
		else mes="借书重复，借书失败";
		session.setAttribute("mes", mes);
		addActionMessage(mes);	
		return "addborrow";
		
	}
	
	public String removebr(){	
		bookdao bdao=new bookdao();
		readerdao rdao=new readerdao();
		
		//获得httpservletrequest对象
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		//获得session对象
	//	HttpSession session=ServletActionContext.getRequest().getSession();
		
	borrowredao brdao=new borrowredao();
	
	//还书后，书籍被借数量自动减一
	
	String mes;
	
	if(brdao.del(br))
			{
		mes="删除成功";
		book book1=bdao.getbook(br.getBid());
		 book1.setBborrow(book1.getBborrow()-br.getBorrownum());
		 bdao.updatebook(book1);
			}
		else mes="删除失败";
		System.out.print(mes);session.setAttribute("mes", mes);
		System.out.print(br.getReturndate());session.setAttribute("mes", mes);
		addActionMessage(mes);
		return "removebr";
	 	
	}
	public String changebr(){
		//格式化数字，日期类型
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session =request.getSession();
		SimpleDateFormat formatter  = new SimpleDateFormat ("yyyy-MM-dd");
		String mes = null;
		borrowredao brdao=new borrowredao();
		String bid=request.getParameter("bid");
		String rname=request.getParameter("rname");
		String rnumber=request.getParameter("rnumber");
		String bname=request.getParameter("bname");
		String classnum=request.getParameter("classnum");
	
		
		bookdao bdao=new bookdao();
		readerdao rdao=new readerdao();
		
		String bdateString="20"+request.getParameter("borrowdate1");
		String rdateString="20"+request.getParameter("returndate1");
		String dString=request.getParameter("borrownum");
		int bnum=Integer.parseInt(dString);
		book book1=bdao.getbook(bid);
		//检查是否有书编号与读者编号，不能修改读者与图书标号
		borrowrecord b=brdao.getborrowre(br);
		if(book1==null||rdao.getreader(rnumber)==null)
		{
			mes="无此书编号或读者编号";
			addActionMessage(mes);
			return "changebr";
		}
		//图书数量不足时，无法出借，返回失败
		if(book1.getBnumber()+b.getBorrownum()-book1.getBborrow()<bnum)
			{
				mes="该图书库存不足，无法修改借阅数量";
				addActionMessage(mes);session.setAttribute("mes", mes);
				return "changebr";	
			}
	
     Date borrowDate = null,returndate = null;
     try {
		borrowDate = formatter.parse(bdateString);
		returndate=formatter.parse(rdateString);
		br.setBorrownum(bnum);
		br.setBorrowdate(borrowDate);
		br.setReturndate(returndate);
		
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		mes="日期错误";
	}
		borrowrecord oldBorrowrecord=brdao.getborrowre(br);
	
	borrowrecord borrowrecord1=new borrowrecord(bid, rnumber, bname, rname, bnum,classnum, borrowDate, returndate);
	
		
		if(brdao.updatebr(borrowrecord1))
			{mes="修改成功";
			
			  book1.setBborrow(book1.getBborrow()-oldBorrowrecord.getBorrownum()+bnum);
			bdao.updatebook(book1);}
	else
		mes="修改失败";session.setAttribute("mes", mes);
	addActionMessage(mes);
	return "changebr";
	
}
	public String showchangebr(){
		borrowredao bd=new borrowredao();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		 brlist=bd.show();
				return "showchangebr";
	
	
}
	public String showaddbr(){
		
				return "showaddbr";
	
}
	public String show(){
		borrowredao br=new borrowredao();
		 brlist=br.show();
				return "show";
		
	}
	public String searchoperator(){
		borrowredao bd=new borrowredao();
		 brlist=bd.show();
				return "searchoperator";
		
	}
	
 	public String showremovebr(){
		borrowredao br=new borrowredao();
	//	PageAction pageAction=new PageAction();
		
		  brlist=br.show();
				return "showremovebr";	
	}
	public String search(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String type=request.getParameter("type");
		String key=request.getParameter("key");
	
		borrowredao br=new borrowredao();
		
		 brlist=br.search(type, key);
		 if(brlist==null) {
			 addActionMessage("查无此书");
			 
		 } 
				return "search";
	}
	
	

	 @SuppressWarnings("unchecked")
	public String nearreturndate(){
		 borrowredao br=new borrowredao();
		List< borrowrecord>b1=br.show();
		ArrayList<borrowrecord> b2 =new ArrayList<borrowrecord>();
		Date today=new Date();
		Iterator< borrowrecord> it=b1.iterator();
		while (it.hasNext()) {
			borrowrecord b=(borrowrecord)it.next();
			
			Date rDate=b.getReturndate();
			long diff=(rDate.getTime()-today.getTime())/(1000*60*60*24);
			if(diff<=7){
				int a=(int)diff;
				//判断天数是否为非整体数，若是直接赋值到day中，否则加1天；
				if(a%1!=0)
				 b.setDay(a+1);
				else b.setDay(a+1);
				b2.add(b);
			}
			
			
		}
		brlist=b2;
		
		 return "nearreturndate";
	 }
	@Override
	public borrowrecord getModel() {
		// TODO Auto-generated method stub
		if(br==null) br=new borrowrecord();
		return br;
	}
		 
	
	
	

}
