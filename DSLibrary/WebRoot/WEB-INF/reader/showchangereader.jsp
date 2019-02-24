<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changebook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
		
		
		function change(form1){
		var falg=false;
			$.messager.confirm('修改', '确定修改?', function(r){
				if (r){
				form1.action='reader_changereader_result.action';
				form1.submit();
				}
				return falg;
			});
		}
	</script>
    <table>

<thead> 
<tr>
<th>读者id</th>
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
   <form name="form1" action="" method="post">
<tr>
<td><input type="text" name="rnumber" value="<s:property value="#root.rnumber" />">  </td>

<td><input type="text" name="rname" value="<s:property value="#root.rname" />"></td>
<td><input type="text" name="rsex" value="<s:property value="#root.rsex" />"></td>

<td> <input type="text" name="classnum" value="<s:property value="#root.classnum" />"> 
  </td>
<td> <input type="text" name="dept" value="<s:property value="#root.dept" />">  
</td>
<td><input type="text" name="rage" value="<s:property value="#root.rage" />">
</td>
<td><input type="button" onclick="change(this.form)" value="修改"/> </td>
</tr>
</form>
 </s:iterator>
 
</tbody> </table>
 
  </body>
</html>
