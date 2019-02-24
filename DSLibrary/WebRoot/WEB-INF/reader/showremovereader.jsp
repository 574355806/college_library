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
<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	  <script type="text/javascript" src="js/excel.js"></script>
	
  </head>
  
  <body id="bg">
  	<script>
		function del(form1){
		var falg=false;
			$.messager.confirm('删除', '确定删除?', function(r){
				if (r){
				form1.action='reader_removereader_result.action';
					form1.submit();
				}
				return falg;
			});
		}
		
		
	</script>
  <%session.setAttribute("flag", "removereader"); %>
 
 <!--  <iframe src="somefiles/searchreader.jsp" height=50px width=100% name="search" ></iframe>
   <iframe src="somefiles/searchreaderresult.jsp"  width=100% name="show" ></iframe>
  
    --><table>

<thead> 
<tr>
<th>读者编号</th>
<th>姓名</th>
<th>性别</th>
<th>班级</th>

<th>系别</th>
<th>年龄</th>

<th>操作</th>
</tr>
</thead> 
<tbody id="tab">
<s:iterator value="rlist">
<form action="" name="form1" method="post">
<tr>
 <td><input type="text" value="<s:property value='#root.rnumber'/>" name="rnumber"/>
 </td>
<td> <s:property value="#root.rname" />
</td>
<td>   <s:property value="#root.rsex" />
   </td>

<td>   <s:property value="#root.classnum" />
   </td>

<td> <s:property value="#root.dept" />
   </td>
<td> <s:property value="#root.rage" />
 </td>

<td><input type="button" value="删除"  onclick="del(this.form)"></td></tr>
</form>
 </s:iterator>
</tbody> 
</table>
<script type="text/javascript">
<!--
var Ptr=document.getElementById("tab").getElementsByTagName("tr");
function ll() {
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
</script>
  </body>
</html>
