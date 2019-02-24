package com.org.model;

public class user {
	private String username;
	private  String password;
	private String root;
private String answer;
public String getAnswer() {
	return answer;
}

public void setAnswer(String answer) {
	this.answer = answer;
}

public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

public user() {
	// TODO Auto-generated constructor stub
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

public user(String username, String password,String root,String anwer) {
	super();
	this.username = username;
	this.password = password;
	this.root=root;
	this.answer=anwer;
}
  

}
