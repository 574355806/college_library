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
    
    <title>My JSP 'search.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
      <s:iterator value="blist">
     <s:property value="#root.bid" />
   <s:property value="#root.bname" />
  <s:property value="#root.bwriter" />
    <s:property value="#root.btype" />
   
   <s:property value="#root.bpublisher" />
   <s:property value="#root.bnumber" />
 <s:property value="#root.bborrow" />
  <s:property value="#root.bplace" />
   <s:property value="#root.bprice" />
   
   </s:iterator>
  </body>
</html>
