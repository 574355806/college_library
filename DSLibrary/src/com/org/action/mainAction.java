package com.org.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.org.dao.loginerdao;
import com.org.model.user;

import org.apache.struts2.ServletActionContext;
import org.hibernate.cfg.*;
import org.omg.CORBA.Request;

public class mainAction extends ActionSupport {
	 
	 String username;
	 String password;
	 String answer;
	
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String enter(){
		loginerdao uLoginerdao=new loginerdao();
		
		if(username==""||password=="")
		{ 
			addActionError("请完善登录信息");
			 return "landerror";
	  }

		user u1=new user();
		u1=uLoginerdao.getlog(username);
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
	
		session.setAttribute("root", u1.getRoot());
		session.setAttribute("password", u1.getPassword());
		session.setAttribute("username", u1.getUsername());
		session.setAttribute("user", u1);
		 if(u1==null) 
		{ 
			addActionError("无此用户");
		   return "landerror";
	  }
	  if(u1.getPassword().equals(getPassword()))
		 {  return "enter";}
		addActionError("密码错误");
		return "landerror";
	}
	
	
	
	public String questionenter(){
		loginerdao uLoginerdao=new loginerdao();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		username=request.getParameter("username");
		password=request.getParameter("password");

		user u1=new user();
		u1=uLoginerdao.getlog(username);
		
		session.setAttribute("root", u1.getRoot());
		session.setAttribute("password", u1.getPassword());
		session.setAttribute("username", u1.getUsername());
		
		session.setAttribute("user", u1);
		
		 if(u1==null) 
		{ 
			addActionError("用户名错误");
		   return "landerror";
	  }
		 session.setAttribute("root", u1.getRoot());
	  if(u1.getAnswer().equals(answer))
		 {  return "enter";}
	addActionError("答案错误，不是本人吧");
		return "landerror";
	}
	
}
