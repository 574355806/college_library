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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->	<link rel="stylesheet" type="text/css" href="css/excel.css">
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	
	  <script type="text/javascript" src="js/excel.js"></script>
	

  </head>
  <body id="bg">
  	<script type="text/javascript" >
		function change(f){
	
			
		if(f.rnumber.value!=""&&f.rname.value!=""&&f.borrownum.value!=""&&f.classnum.value!=""&&f.bid.value!=""&&f.bname.value!=""&&f.borrowdate1.value!=""&&f.returndate1.value!="")
			{
			if(!isNaN(f.borrownum.value))	{
			$.messager.confirm('修改', '确定修改?', function(r){
				if (r){
			
				f.action='borrowrecord_changebr_result.action';
				f.submit();
					 }
				
			});
			}	else $.messager.alert('错误','数字填写异常');
			
			}
		else $.messager.alert('错误','信息不完善');
			}
			
			
	</script>
  <%session.setAttribute("flag", "changebook"); %>
 <!--  <iframe src="somefiles/searchbook.jsp" height=50px width=100% name="search" ></iframe>
   <iframe src="somefiles/searchbookresult.jsp"  width=100% name="show" ></iframe>
  --> <%--  <s:iterator value="blist">
     <form action="book_changebook_result.action" method="post">
     <input type="text" name="bid" value="<s:property value="#root.bid" />">
   <input type="text" name="bname" value="<s:property value="#root.bname" />">
   <input type="text" name="bwriter" value="<s:property value="#root.bwriter" />">
    <input type="text" name="btype" value="<s:property value="#root.btype" />">
   
   <input type="text" name="bpublisher" value="<s:property value="#root.bpublisher" />">
   <input type="text" name="bnumber" value="<s:property value="#root.bnumber" />">
   <input type="text" name="bborrow" value="<s:property value="#root.bborrow" />">
   <input type="text" name="bplace" value="<s:property value="#root.bplace" />">
   <input type="text" name="bprice" value="<s:property value="#root.bprice" />">
   <button>修改</button>
  </form>
   </s:iterator>
 
  --%>
   <table>
   
<thead> 
<tr >
<th >图书编号</th>
<th>书名</th>


<th>读者编号</th>
<th>姓名</th>
<th>借阅数量</th>
<th>班级</th>
<th>借阅日期</th>
<th>归还日期</th>
<th>操作</th>
</tr>
</thead> 
<tbody id="tab">
    <s:iterator value="brlist">
    <form name="f" action="" method="post">
    <tr>
    
     
    <td> <input type="text" name="bid" value="<s:property value="#root.bid" />"></td>
  <td> <input type="text" name="bname" value="<s:property value="#root.bname" />"></td>
  <td> <input type="text" name="rnumber" value="<s:property value="#root.rnumber" />"></td>
 <td>   <input type="text" name="rname" value="<s:property value="#root.rname" />"></td>
    <td>   <input type="text" name="borrownum" value="<s:property value="#root.borrownum" />"></td>
 
  <td> <input type="text" name="classnum" value="<s:property value="#root.classnum" />"></td>
  <td> <input type="text" name="borrowdate1" value="<s:property value="#root.borrowdate" />"></td>
  <td> <input type="text" name="returndate1" value="<s:property value="#root.returndate" />"></td>
   
   <td>  <input type="button"  value="修改" onclick="change(this.form)"/> 
   </td> 
   </tr></form>
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
//-->
</script>
   
   
   
 
 
 
  </body>
</html>
