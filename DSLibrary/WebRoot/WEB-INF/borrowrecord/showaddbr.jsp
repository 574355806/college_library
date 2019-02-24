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
	var f=form1;
	  var falg=true;
	  if(!isNaN(form1.borrownum.value)&&form1.borrownum.value>0){
	 if(f.rnumber.value!=""&&f.bid.value!=""&&f.borrowdate1.value!=""&&f.borrownum.value!="")
		{form1.action='borrowrecord_addborrow_result.action';
		form1.submit();
		}
		 	 
		 	else { $.messager.alert('提醒','信息不完善!请填写完整信息');
		
		 falg=false;}
		 return falg;
		 }
		 else $.messager.alert('错误','数字填写异常');
	 }
		 


	</script>
  
	
  <form name="form1"action="" method="post"    class="elegant-aero">
<h1>添加借阅信息
<span>请输入相关信息</span>
</h1>

<label>
<span>图书编号</span>
<input id="bid" type="text" name="bid" placeholder="图书编号" />
</label>
<!-- <label>
<span>图书名</span>
<input id="bname" type="text" name="bname" placeholder="图书名称" />
</label> -->

<label>
<span>读者编号</span>
<input id="rnumber" type="text" name="rnumber" placeholder="读者编号" />
</label>
<!-- <label>
<span>读者姓名</span>
<input id="rname" type="text" name="rname" placeholder="图书名称" />
</label> -->
<label>
<span>借阅数量</span>
<input id="borrownum" type="text" name="borrownum" placeholder="借阅数量" />
</label>
<!-- <label>
<span>班级</span>
<input id="classnum" type="text" name="classnum" placeholder="班级" />
</label> -->

<label>
<span>借阅日期</span>

<input name="borrowdate1" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"></input>

<!-- <input  type="text" name="borrowdate1" /> -->
</label><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
<!-- <label><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

<span>归还日期</span>
<input name="returndate1" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"></input>
 -->

<script type="text/javascript">
function myformatter(date){
var y = date.getFullYear();
var m = date.getMonth()+1;
var d = date.getDate();
return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
}
function myparser(s){
if (!s) return new Date();
var ss = (s.split('-'));
var y = parseInt(ss[0],10);
var m = parseInt(ss[1],10);
var d = parseInt(ss[2],10);
if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
return new Date(y,m-1,d);
}else{
return new Date();
}
}
</script>			
<!-- <input  type="text" name="returndate1" placeholder="年/月/日"/>
 --></label>
</br></br></br></br></br></br>
<label>

<span>&nbsp;&nbsp;&nbsp;</span>
<input type="button" onclick="checkform(this.form)" class="button" value="提交" />
<input type="reset" class="button" value="重置"  />

</label>

</form>


  </body>
</html>
