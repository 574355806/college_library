<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addreader.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<link rel="stylesheet" type="text/css" href="css/form.css">
<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	
	 </head>
  
  <body >
   
	
  

  
	<script>
	function checkform(form1){
	var f=form1;
	  var falg=true;
	 if(f.rnumber.value!=""&&f.rname.value!=""&&f.rsex.value!=""&&f.classnum.value!=""&&f.dept.value!=""&&f.rage.value!="")
		{
		
		if(!isNaN(form1.rage.value))
		{
		falg=true;
		f.action='reader_addreader_result.action';
		f.submit();
		 }
		
		else $.messager.alert('提示','数字填写错误'); 
		
		
		}
		 	 
		 	else { $.messager.alert('提醒','信息不完善!请填写完整信息');
		
		 falg=false;}
		 return falg;
	 }
		
	</script>
  
		
  <form name="form1"action="" method="post"    class="elegant-aero">
<h1>添加读者信息
<span>请输入相关信息</span>
</h1>
<label>
<span>读者编号</span>
<input id="rnumber" type="text" name="rnumber" placeholder="读者编号" />
</label>
<label>
<span>读者姓名</span>
<input id="rname" type="text" name="rname" placeholder="图书名称" />
</label>
<label>
<span>性别</span>&nbsp;
<label>
男<input type="radio" id="rsex"  name="rsex" value="男" />
女<input type="radio" id="rsex"  name="rsex" value="女" /></label>
</label>
<label>
<span>班级</span>
<input id="classnum" type="text" name="classnum" placeholder="班级" />
</label>
<label>
<span>系别</span>
<input id="dept" type="text" name="dept" />
</label>
<label>
<span>年龄</span>
<input id="rage" type="text" name="rage" placeholder="年龄"/>
</label>

<label>
<span>&nbsp;</span>
<input type="button" class="button" value="提交" onclick="checkform(this.form)"/>
<input type="reset" class="button" value="重置"  />

</label>
</form>
  </body>
</html>
