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
    
    <title>My JSP 'searchbook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#FAF0E6">
  <%String flag=session.getAttribute("flag").toString(); %>
   <%if("book".equals(flag)) {%> <form action="book_search_searchresult.action" method="post" target="show">
  搜索<input type="text" name="key"/> 
  按<select name="type">
   <option>编号</option>
  <option>书名</option>
  <option>作者</option>
  <option>类型</option>
 
  </select>
  <button>查询</button>
  </form>
  <%} %>
  
  <%if("reader".equals(flag)) { %>
  <form action="reader_search_searchresult.action" method="post" target="show">
  搜索<input type="text" name="key"/> 
  按<select name="type">
   <option>学号</option>
  <option>班级</option>
  <option>系别</option>
  <option>姓名</option>
 
  </select>
  <button>查询</button>
  </form>
  <%} %>
  
  <%if("borrow".equals(flag)) { %>
  <form action="borrowrecord_search_searchresult.action" method="post" target="show">
  搜索<input type="text" name="key"/> 
  按<select name="type">
   <option>图书编号</option>
   <option>书名</option>
   <option>读者编号</option>
  <option>读者姓名</option>
 
  </select>
  <button>查询</button>
  </form>
  <%} %>
  </body>
</html>
