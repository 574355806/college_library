<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/form.css">
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
	<link rel="stylesheet" type="text/css" href="../css/icon.css">
	<link rel="stylesheet" type="text/css" href="../css/demo.css">
	
	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	
<!-- 	
	
/* function userclear()
{  var user=form1.user.value;
	if(user=="请输入用户名")
	 form1.user.value="";
	var a=form1.age;
	if(a.value=="请输入年龄")
	 form1.age.value="";
}
  function checkname(){
	  var name=form1.user.value;
	  if(name=="请输入用户名") 
	   {div1.innerHTML="用户名未填写";
	  form1.user.focus;
	  return false;}
	 if(name.length<6||name.length>12)
	  { div1.innerHTML="用户名非法,长度大于6小于12";
	  form1.user.focus;
	  return false;}
	  else div1.innerHTML="";
	   form1.user.focus;
	 
	   return true;
	  }
	  
  function passwordlength(){
	  var x=form1.password.value;
	  if(x.length<6)
	  { div2.innerHTML="密码长度小于六个字符长度";
	   form1.password.focus;
	    return false;}
	  div2.innerHTML="";
	  return true;
	   
	  }
	  function judgepassword(){
		  if(form1.password.value!=form1.password2.value)
		    { 
			 form1.password2.focus;
			 return false;}
			 else div3.innerHTML="";
			return true;
			} */ -->
	<script >
	 function checkform(form1){
		 
		if(form1.username.value==""||form1.password.value==""||form1.root.value=="")
		$.messager.alert('提醒','信息不完善!请填写完整信息');
		
			 
		else { 
		 if(form1.password.value!=form1.password1.value)
		 $.messager.alert('提醒','两次密码不一致');
		else{
		form1.action='user_adduser_result.action';
		form1.submit();}
		}
		 }
		
</script>
<!-- <style type="text/css">
 #mai{
	font-family: "华文行楷";
	color: #00C;
	text-align: center;
	font-size: 36px;
}
body,td,th {
	color: #306;
	text-align: center;
	font-weight: bold;
}
</style> -->
</head>

<body>

		
  <form name="form1" action="" method="post"   class="elegant-aero">
<h1>添加管理员信息
<span>请输入相关信息</span>
</h1>
<label>
<span>用户名</span>
<input id="username" type="text" name="username" placeholder="用户名" />
</label>
<label>
<span>密码</span>
<input id="password" type="password" name="password" placeholder="密码" />
</label>
<label>
<br>
<label>
<span>确定密码</span>
<input id="password1" type="password" name="password1"  />
</label>
<br>
<label>
<span>身份</span>
<label>
普通管理<input type="radio" id="root"  name="root" value="普通" />
高级管理<input type="radio" id="root"  name="root" value="高级" />
</label>
<br>
<label>
<span>&nbsp;</span>
<input type="button" class="button" value="提交" onclick="checkform(this.form)"  />

<input type="reset" class="button" value="重置"  />

</label>
</form>
</body>

</html>