<%@page import="com.org.model.user"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'work.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script>
 function iFrameHeight() { 
var ifm= document.getElementById("mainFrame"); 
var subWeb = document.frames ? document.frames["mainFrame"].document : ifm.con; 
if(ifm != null && subWeb != null) { 
ifm.height = subWeb.body.scrollHeight; 
} 
} 
function changebg(){

document.body.style.backgroundImage="url(images/star.gif)";

}

 </script>
 <style>
 #dd{
 margin-top:18px;
 float:left;
  width:150px ;
  margin-left:105px;

 }
 #aa{
 margin-top:18px;
   float:right;
   margin-right:100px;
 

 }
 
 </style>
 </head>
  
  
<body >
<%user u=(user)session.getAttribute("user");
String username=(String)session.getAttribute("username");
String password=(String)session.getAttribute("password");

%>
<div id=lanren style="float:left;width:128px;height:128px;BORDER: #FFF 3px solid;background-image:URL(images/greenstar.gif)" onclick="document.body.style.backgroundImage='url(images/greenstar.gif)'"></div>
<div id=lanren style="float:left;width:128px;height:128px;BORDER: #FFF 3px solid;background-image:URL(images/star.gif)" onclick="document.body.style.backgroundImage='url(images/star.gif)'"></div>
<div id=lanren style="float:left;width:128px;height:128px;BORDER: #FFF 3px solid;background-image:URL(images/heart.gif)" onclick="document.body.style.backgroundImage='url(images/heart.gif)'"></div>
<div id=lanren style="float:left;width:128px;height:128px;BORDER: #FFF 3px solid;background-image:URL(images/result.jpg)" onclick="document.body.style.backgroundImage='url(images/result.jpg)'"></div>
<div style="clear:both"></div>
  <form action="enter.action" method="post">
  <input type="hidden" name="username" value=<%=username%>>
  <input type="hidden" name="password" value=<%=password%>>
  <input type="submit" value="返回" style="width:55px;height:30px;background-color:#E0FFFF;color:blue; font-size:10px;font-family:"幼圆";">
  </form>
  <center>
  <div id="dd">
    <iframe  name="left" id= "left"src="somefiles/title.jsp" height=100%  frameborder="0" ></iframe>
</div>
<div id="aa"><iframe bgcolor=""  name="r" id="r" src="somefiles/opertaor.jsp" width=850px height=50% frameborder="0" onload=' this.style.height=Math.max(this.contentWindow.document.body.scrollHeight,this.contentWindow.document.documentElement.scrollHeight,200)+"px";  '>
   </iframe>
  
   </div>
  </center>
  </body>
</html>
