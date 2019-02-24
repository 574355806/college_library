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
  
  <body>
 <%session.setAttribute("flag", "show"); %>
 <!--  <iframe src="somefiles/searchbook.jsp" height=50px width=100% name="search" ></iframe>
   <iframe src="somefiles/searchbookresult.jsp"  width=100% name="show" ></iframe>
  -->
<!--  全部信息 -->
 
 
  
   
   <table>

<thead> 
<tr>
<th>图书编号</th>
<th>书名</th>
<th>读者编号</th>
<th>读者姓名</th>
<th>借阅数量</th>
<th>班级</th>
<th>借阅日期</th>
<th>归还日期</th>

</tr>
</thead> 
<tbody id="tab">
<s:iterator value="list">
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
 


<td> <s:property value="#root.classnum" />
   </td>
<td> <s:property value="#root.borrowdate" />
 </td>
 <td> <s:property value="#root.returndate" />
 </td>
</tr>
 </s:iterator>
 
</tbody> 
<tfoot>
 
<tr>
<td colspan="8">
<div class="grayr"><span class="disabled"> < </span><span class="current"><s:if test="pageId>1">
   <a href="before.action?pageId=<s:property value="pageId"/>&flag=borrowrecord"> 上一页</a></s:if> 
   
     <s:property value="pageId"/>/<s:property value="#session.pageCount"/>
   
   <s:if test="pageId<#session.pageCount ">  <a href="add.action?pageId=<s:property value="pageId"/>&flag=borrowrecord"> 下一页 </a></s:if>
   <!--判断是否有下一页-->
 <s:if test="pageId>=#session.pageCount">
         
 </s:if>
   
   </span></div>
<!--
<div id="page">
<a href="">首　页</a><a href="">上一页</a><a href="">下一页</a><a href="">末　页</a></div>-->
</td>
</tr>
</tfoot>
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
