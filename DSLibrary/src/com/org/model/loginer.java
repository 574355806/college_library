package com.org.model;

public class loginer {
	private String username;
	private  String password;
	private String root;

public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

public loginer() {
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

public loginer(String username, String password,String root) {
	super();
	this.username = username;
	this.password = password;
	this.root=root;
}
  

}
