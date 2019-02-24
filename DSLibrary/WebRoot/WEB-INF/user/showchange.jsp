<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showchange.jsp' starting page</title>
    
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
	<script>
		
		function change(form1){
		if(form1.user.value==""||form1.ps==""||form1.root=="")
		$.messager.alert('提示','信息不完善');
		var falg=false;
			$.messager.confirm('修改', '确定修改?', function(r){
				if (r){
				form1.action='user_changeuser_result.action';
					form1.submit();
				}
				return falg;
			});
		}
		</script>
  </head>
  
  <body id="bg">
     
     
      <table>

<thead> 
<tr>
<th>管理员</th>
<th>密码</th>
<th>问题答案</th>
<th>权限</th>
<th>操作</th>

</tr>
</thead> 
<tbody id="tab">
 <s:iterator value="ulist">

    <form name="form1" action="" method="post"> 
    
<tr>
    
 
<td> <input type="text" name="user" value="<s:property value="#root.username" />">
  </td>
<td><input type="text" name="ps" value="<s:property value="#root.password" />">
</td>
<td><input type="text" name="answer" value="<s:property value="#root.answer"/>">
</td>
<td><input type="text" name="root" value="<s:property value="#root.root"/>">
</td>
<td>
<input type="button" onclick="change(this.form)" value="修改"/></td>
 
</tr>
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
  
   <%-- 
     
    <s:iterator value="ulist"><form action="" method="post">  
     <input type="text" name="user" value="<s:property value="#root.username" />">
        <input type="submit" value="修改"/></form>
   </s:iterator>
   --%>
  
  </body>
</html>
