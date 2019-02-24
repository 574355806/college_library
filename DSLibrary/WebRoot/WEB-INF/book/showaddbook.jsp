<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addbook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/form.css">
<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	

		
	
	
  </head>
  
  <body>
  
	<script>
	function checkform(form1){
	
	  var falg=true;
	 if(form1.bid.value==""||form1.bwriter.value==""||form1.bname.value==""||form1.bnumber.value==""||form1.bprice.value==""||form1.bplace.value==""||form1.bpublisher.value==""||form1.btype.value=="")
		$.messager.alert('提醒','信息不完善!请填写完整信息');
	 
	
	else if(!isNaN(form1.bnumber.value)&&!isNaN(form1.bprice.value))
		{
		form1.action='book_addbook_result.action';
		 form1.submit();
		 falg=false;
		 }
		
		else $.messager.alert('提示','数字填写错误'); 	
		 	 
	
	
	 }
		
	</script>
  
		
  <form name="form1"action="  " method="post"    class="elegant-aero">
<h1>添加图书信息
<span>请输入相关信息</span>
</h1>
<label>
<span>图书编号</span>
<input id="bid" type="text" name="bid" placeholder="图书编号" />
</label>
<label>
<span>图书名称</span>
<input id="bname" type="text" name="bname" placeholder="图书名称" />
</label>
<label>&nbsp;
<span>作者</span>&nbsp;
<input id="bwriter" type="text" name="bwriter" placeholder="作者" />
</label>
<label>
<span>出版社</span>&nbsp;
<input id="bpublisher" type="text" name="bpublisher" placeholder="出版社" />


</label>
<label>&nbsp;
<span>数量</span>&nbsp;
<input id="bnumber" type="text" name="bnumber" placeholder="数量" />
</label>
<label>&nbsp;
<span>已借出</span>
<input id="bborrow" type="text" name="bborrow" placeholder="借阅数量" value="0"/>
</label>
<label>&nbsp;
<span>类型</span>
<input id="btype" type="text" name=""btype"" placeholder="类型" />
</label>
<label>
<span>藏书地点</span>
<input id="bplace" type="text" name="bplace" placeholder="图书名称" />
</label>
<label>&nbsp;
<span>价格</span>
<input id="bprice" type="text" name="bprice" placeholder="价格" />
</label>

<label>
<span>&nbsp;</span>
<input type="button" class="button" value="提交" onclick="  checkform(this.form)"/>
<input type="reset" class="button" value="重置"  />

</label>
</form>

   </body>
</html>
