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
				form1.action='borrowrecord_removebr_result.action';
					form1.submit();
				}
				return falg;
			});
		}
		
		function change(){
		var falg=false;
			$.messager.confirm('修改', '确定修改?', function(r){
				if (r){
				document.forms[0].action='book_changebook_result.action';
					document.forms[0].submit();
				}
				return falg;
			});
		}
	</script>
  <%session.setAttribute("flag", "removereader"); %>
 
 
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
<th>操作</th>
</tr>
</thead> 
<tbody id="tab">
<s:iterator value="brlist">
<form action="" name="form1" method="post">
<tr>
<td> <input type="text" name="bid" value="<s:property value="#root.bid" />"/>
</td>
<td>  <s:property value="#root.bname"/>
   </td>
<td><input type="text" value="<s:property value='#root.rnumber'/>" name="rnumber"/>
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
