package com.org.action;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.ActionMessage;
import org.hibernate.Session;
import org.omg.CORBA.Request;

import sun.org.mozilla.javascript.internal.ContextAction;

import antlr.Lookahead;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import com.org.dao.loginerdao;
import com.org.model.user;


public class userAction  extends ActionSupport implements ModelDriven<user>{
	
	user login=new user();
	List ulist;
	String username;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public user getLogin() {
		return login;
	}
	public void setLogin(user login) {
		this.login = login;
	}

public List getUlist() {
		return ulist;
	}
	public void setUlist(List ulist) {
		this.ulist = ulist;
	}
public String loginer(){
	return "loginer";
}
	public String adduser(){
		String mes;
		
		loginerdao aLoginerdao=new loginerdao();
		if(aLoginerdao.insert(login)==true)
			mes="添加成功";

		else mes="已有该用户，添加失败";
		
		addActionMessage(mes);
	
		return "adduser";
		
	}
	
	public String removeuser(){	
		//获得httpservletrequest对象
		HttpServletRequest request=ServletActionContext.getRequest();
		//获得session对象
	//	HttpSession session=ServletActionContext.getRequest().getSession();
	
	loginerdao ld=new loginerdao();
	String mes;
	String u=request.getParameter("user");
	if(ld.del(u))
	
			mes="删除成功";

		else mes="删除失败";
		
		addActionMessage(mes);
		return "removeuser";
	 	
	}
	public String changeuser(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String userString=request.getParameter("user");
		String ps=request.getParameter("ps");
		System.out.print(userString+ps);
	loginerdao loginerdao=new loginerdao();
	if(loginerdao.updatelog(userString, ps,login.getAnswer()))
			addActionMessage("修改成功");
	else
		addActionMessage("修改失败");;
	return "changeuser";
	
	
	
}
	public String showchange(){
		loginerdao uLoginerdao=new loginerdao();
		 ulist=uLoginerdao.show();
				return "showchange";
	
	
}
	public String show(){
		loginerdao uLoginerdao=new loginerdao();
		 ulist=uLoginerdao.show();
				return "show";
		
	}
	public String showdel(){
		loginerdao uLoginerdao=new loginerdao();
		 ulist=uLoginerdao.show();
				return "showdel";
		
	}
	public String changeown(){
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		login=(user) session.getAttribute("user");
		return "changeown";
		
	}
	public String changeps(){
		String meString;
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		loginerdao loginerdao=new loginerdao();
		user user=loginerdao.getlog(login.getUsername());
		if(user.getPassword().equals(login.getPassword()))
		{
			loginerdao.updatelog(user.getUsername(),login.getUsername(),login.getAnswer());
			 meString="修改成功";
			 addActionMessage(meString);
			 return "changeps";
		}
		else meString="密码错误";
		addActionMessage(meString);
		 return "changeps";
		
	}
	public String result(){
		return "result";

}
@Override
public com.org.model.user getModel() {
	// TODO Auto-generated method stub
	if (login==null) { login=new user();
		
	}
	return login;
}
}