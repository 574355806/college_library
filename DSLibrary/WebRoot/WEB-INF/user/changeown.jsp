<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/form.css">
<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	

	<script >
	 function checkform(form1){
		 
		if(form1.username.value==""||form1.password.value==""||form1.password1.value==""||form1.answer.value=="")
		$.messager.alert('提醒','信息不完善!请填写完整信息');
		 
		else{
		form1.action='user_changeps_result.action';
		form1.submit();}
		}
		 
		
</script>
<style type="text/css">
 #mai{
	font-family: "华文行楷";
	color: #00C;
	text-align: center;
	font-size: 36px;
}
#body {
	background:url(images/star.gif);
	text-align: center;
	font-weight: bold;
}
</style>
</head>

<body id="body">
<br><br>
		
  <form name="form1" action="" method="post"   class="elegant-aero">
<h1>修改本人密码

</h1>
<label>
<span>用户名</span>
<input id="username"  value="<s:property value='login.username'/>" name="username" />
</label>
<br>
<label>
<span>问题答案</span>
<input id="answer"  value="<s:property value='login.answer'/>" type="answer" name="answer"  />
</label>
<br>
<label>
<span>旧密码</span>
<input id="password" type="password" name="password" placeholder="密码" />
</label>
<label>
<br>
<label>
<span>新密码</span>
<input id="password1" type="password" name="password1"  />
</label>
<br>

<label>
<span>&nbsp;</span>
<input type="button" class="button" value="提交" onclick="checkform(this.form)"  />


</label>
</form>
</body>

</html>