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
    
    <title>My JSP 'show.jsp' starting page</title>
    
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
 <%
 String flag= (String)session.getAttribute("flag"); 

 %>
  <s:if test="hasActionMessages()">
  <s:actionmessage/>
  </s:if>
  <%-- <%if(flag.equals("removebook"))  %>
    <s:iterator value="blist">
     <form action="book_removebook_result.action" method="post">
     <s:property value="#root.bid" />
   <s:property value="#root.bname" />
    <s:property value="#root.bwriter" />
   <s:property value="#root.btype" />
   
   <s:property value="#root.bpublisher" />
   <s:property value="#root.bnumber" />
  <s:property value="#root.bborrow" />
   <s:property value="#root.bplace" />
  <s:property value="#root.bprice" />
  dd<input type="submit" value="删除"/>
  </form>
   </s:iterator>
  <%  %> --%>
   <%
//当flag为show，表示为展示书籍页面
   if(flag.equals("show")) {%> 
   
     <s:iterator value="rlist">
     <s:property value="#root.rnumber" />
   <s:property value="#root.rname" />
  <s:property value="#root.rclass" />
   <s:property value="#root.dept" />
   
   <s:property value="#root.rage" />
   
   </s:iterator>
   
   <%} %>
   
  <%  //当flag为removebook，表示为展示书籍页面
   if(flag.equals("removereader")) {%>
    
    
     <s:iterator value="rlist">
     <form action="reader_removereader_result.action" method="post">
     <s:iterator value="rlist">
   
    <input type="text" name="bid" value="<s:property value="rnumber" />"/>
      
   <s:property value="#root.rname" />
  <s:property value="#root.rclass" />
   <s:property value="#root.dept" />
   
   <s:property value="#root.rage" />
   
   </s:iterator>
  <button>删除</button>
  
  </form>
   </s:iterator>
   
   <%} %>
   
   
   
   <%if(flag.equals("changereader")) {%>
     <s:iterator value="rlist">
     <form action="reader_removereader_result.action" method="post">
     <input type="text" name="rnumber" value="<s:property value="#root.rnumber" />">
   <input type="text" name="rname" value="<s:property value="#root.rname" />">
   <input type="text" name="rclass" value="<s:property value="#root.rclass" />">
    <input type="text" name="dept" value="<s:property value="#root.dept" />">
   
   <input type="text" name="rage" value="<s:property value="#root.rage" />">
    <button>修改</button>
  </form>
   </s:iterator>
   <%} %>
  
  </body>
</html>
