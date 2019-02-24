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
	<link rel="stylesheet" type="text/css" href="css/excel.css">
	  <script type="text/javascript" src="js/excel.js"></script>

  </head>
  
  <body id="bg">
 
   
   <table>

<thead> 
<tr>
<th>图书编号</th>
<th>书名</th>
<th>读者编号</th>
<th>读者姓名</th>
<th>借阅数量(本)</th>
<th>距离归还时间(天)</th>


</tr>
</thead> 
<tbody id="tab">
<s:iterator value="brlist">
<form action="" name="form1" method="post">
<tr>
<td>  <s:property value="#root.bid" />
</td>
<td>  <s:property value="#root.bname"/>
   </td>
<td><s:property value='#root.rnumber'/>
 </td>
<td>   <s:property value="#root.rname" />
   </td>
 
<td>   <s:property value="#root.borrownum" />
   </td>
 
<td>   <s:property value="#root.day" />
   </td>

</tr>
 </s:iterator>
 
</tbody> 
<tfoot>

</table>
<script type="text/javascript">
<!--
var Ptr=document.getElementById("tab").getElementsByTagName("tr");
function $() {
    for (i=1;i<Ptr.length+1;i++) { 
    Ptr[i-1].className = (i%2>0)?"t1":"t2"; 
    }
}
window.onload=$;
for(var i=0;i<Ptr.length;i++) {
    Ptr[i].onmouseover=function(){
    this.tmpClass=this.className;
    this.className = "t3";
    
    };
    Ptr[i].onmouseout=function(){
    this.className=this.tmpClass;
    };
}
//-->
</script>
   
   
   
   
  </body>
</html>
