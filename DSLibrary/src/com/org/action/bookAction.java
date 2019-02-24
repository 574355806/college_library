package com.org.action;
import java.text.Bidi;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.org.dao.bookdao;
import com.org.dao.loginerdao;
import com.org.model.*;

public class bookAction extends ActionSupport implements ModelDriven<book> {
book book;
List blist;
private Page page = new Page();
public bookAction() {
	super();
}

public bookAction(com.org.model.book book, List blist) {
	super();
	this.book = book;
	this.blist = blist;
}

public List getBlist() {
	return blist;
}

public void setBlist(List blist) {
	this.blist = blist;
}

public book getBook() {
	return book;
}

public void setBook(book book) {
	this.book = book;
}


	public String addbook(){
		String mes;
		HttpSession session=ServletActionContext.getRequest().getSession();

		bookdao abookdao=new bookdao();
		if(abookdao.insert(book)==true)
			mes="添加成功";

		else mes="添加失败";
		
		addActionMessage(mes);
	
		return "addbook";
		
	}
	
	public String removebook(){	
		//获得httpservletrequest对象
		HttpServletRequest request=ServletActionContext.getRequest();
		//获得session对象
	//	HttpSession session=ServletActionContext.getRequest().getSession();
	bookdao bd=new bookdao();
	 
	String mes;
	/*String u=request.getParameter("bid");
	System.out.print(u);
*/	if(bd.del(book.getBid()))
	
			mes="删除成功";

		else mes="删除失败";
		System.out.print(mes);
		addActionMessage(mes);
		return "removebook";
	 	
	}
	public String changebook(){
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String bid=request.getParameter("bid");
		String bname=request.getParameter("bname");
		String bplace=request.getParameter("bplace");
		String bpublisher=request.getParameter("bpublisher");
		String bwriter=request.getParameter("bwriter");
		String btype=request.getParameter("btype");
		
		double bprice;
		int bnumber;
		int bborrow;
		book book1 = null;
		try {
			bprice = Double.parseDouble(request.getParameter("bprice").toString());
			bnumber = Integer.parseInt(request.getParameter("bnumber").toString());
			bborrow = Integer.parseInt(request.getParameter("bborrow").toString());
		book1	=new book(bid, bname, bprice, bnumber, bwriter, bpublisher, bplace, bborrow, btype);
			
		} catch (NumberFormatException e) {
			addActionMessage("数字填写异常");
			addActionMessage("修改失败");
			return "changebook";
		}
		bookdao bd=new bookdao();
		if(bd.updatebook(book1))
			addActionMessage("修改成功");
	else
		addActionMessage("修改失败");
	return "changebook";
	
}
	public String showchangebook(){
		bookdao bd=new bookdao();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		session.setAttribute("pageId", request.getParameter("pageId"));
		
		 blist=bd.show();
				return "showchangebook";
	
	
}
	public String showaddbook(){
		
				return "showaddbook";
	
	
}
	public String show(){
		bookdao bd=new bookdao();
		 blist=bd.show();
				return "show";
		
	}
	public String searchoperator(){
		bookdao bd=new bookdao();
		 blist=bd.show();
				return "searchoperator";
		
	}
	/*public String addpage()
	{
		PageAction pageAction=new PageAction();
		blist=pageAction.add();
		return "addpage";
		
		
	}*/
 	public String showremovebook(){
		bookdao bd=new bookdao();
	//	PageAction pageAction=new PageAction();
		
		  blist=bd.show();
				return "showremovebook";	
	}
	public String search(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String type=request.getParameter("type");
		String key=request.getParameter("key");
	
		bookdao bd=new bookdao();
		
		 blist=bd.search(type, key);
		 if(blist==null) {
			 addActionMessage("查无此书");
			 
		 } 
				return "search";
	}
	public String result(){
				return "result";
		
	}
	 public String changepage()
	{
		return "changebook";
	}
	 public String operator()
		{
		 HttpServletRequest request=ServletActionContext.getRequest();
		 String actString=request.getParameter("submitname");
		 if("del".equals(actString))
		 { bookdao b=new bookdao();
		 b.del(book.getBid());
		 addActionMessage("删除成功");
		 }
		 else if("change".equals(actString))
		 { bookdao b=new bookdao();
		 b.updatebook(book);
		 addActionMessage("修改成功");
		 }
		 else addActionMessage("操作失败");
			return "operator";
		}
		 

@Override
public com.org.model.book getModel() {
	// TODO Auto-generated method stub
	if(book==null) book=new book();
	return book;
}

}
