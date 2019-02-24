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
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	  <script type="text/javascript" src="js/excel.js"></script>
	
  </head>
  
  <body bgcolor="#F0FFF0">
  	<script>
		function del(form1){
		var falg=false;
			$.messager.confirm('删除', '确定删除?', function(r){
				if (r){
				form1.action='book_removebook_result.action';
					form1.submit();
				}
				return falg;
			});
		}
		
		function change(form1){
		var falg=false;
			$.messager.confirm('修改', '确定修改?', function(r){
				if (r){
				form1.action='book_changebook_result.action';
					form1.submit();
				}
				return falg;
			});
		}
		
		
		function delreader(form2){
		var falg=false;
			$.messager.confirm('删除', '确定删除?', function(r){
				if (r){
				form2.action='reader_removereader_result.action';
					form2.submit();
				}
				return falg;
			});
		}
		
		function changereader(form2){
		
			$.messager.confirm('修改', '确定修改?', function(r){
				if (r){
				form2.action='reader_changereader_result.action';
					form2.submit();
				}
			
			});
		}
		
		
		
		function delbr(form1){
		var falg=false;
			$.messager.confirm('删除', '确定删除?', function(r){
				if (r){
				form1.action='borrowrecord_removebr_result.action';
					form1.submit();
				}
				return falg;
			});
		}
		
		
		function changebr(f){
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
 <%
 String flag= (String)session.getAttribute("flag"); 

 %>
  
  
   <%if("book".equals(flag)){ %>
   <table>
   
<thead> 
<tr >
<th >图书编号</th>
<th>书名</th>
<th>类型</th>

<th>作者</th>
<th>出版社</th>
<th>馆藏量</th>
<th>已出借</th>
<th>馆藏位置</th>
<th>价格</th>
<th>操作</th>
</tr>
</thead> 
<tbody id="tab">
    <s:iterator value="blist">
    <tr> <form name="form1" action="" method="post">
    <td> <input type="text" name="bid" value="<s:property value="#root.bid" />"></td>
  <td> <input type="text" name="bname" value="<s:property value="#root.bname" />"></td>
  <td> <input type="text" name="bwriter" value="<s:property value="#root.bwriter" />"></td>
 <td>   <input type="text" name="btype" value="<s:property value="#root.btype" />"></td>
   
  <td> <input type="text" name="bpublisher" value="<s:property value="#root.bpublisher" />"></td>
  <td> <input type="text" name="bnumber" value="<s:property value="#root.bnumber" />"></td>
  <td> <input type="text" name="bborrow" value="<s:property value="#root.bborrow" />"></td>
   <td><input type="text" name="bplace" value="<s:property value="#root.bplace" />"></td>
  <td> <input type="text" name="bprice" value="<s:property value="#root.bprice" />"></td>
  
   <td> <input type="button" onclick="del(this.form)" value="删除"/> 
  </br> <input type="button" onclick="change(this.form)" value="修改"/> 
   </td> </form>
   </tr>
   </s:iterator>
   </tbody>
   </table>
  <%} %>
  
<!--   如果是搜索读者，显示搜索读者结果 -->
   <%if("reader".equals(flag)){ %>
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

<tr>

     <form name="form2" action="" method="post">
<td><input type="text" name="rnumber" value="<s:property value="#root.rnumber" />"/>  </td>

<td><input type="text" name="rname" value="<s:property value="#root.rname" />"/></td>
<td><input type="text" name="rsex" value="<s:property value="#root.rsex" />"/></td>

<td> <input type="text" name="classnum" value="<s:property value="#root.classnum" />"/> 
  </td>
<td> <input type="text" name="dept" value="<s:property value="#root.dept" />"/>  
</td>
<td><input type="text" name="rage" value="<s:property value="#root.rage" />"/>
</td>
<td> <input type="button" onclick="delreader(this.form)" value="删除"/> 
  </br> <input type="button" onclick="changereader(this.form)" value="修改"/> 
  </td>
</form>
</tr>

 </s:iterator>
 
</tbody> </table>
  
  <%} %>
  
  
     <%if("borrow".equals(flag)){ %>
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
    <tr>
    
     <form name="form1" action=""  method="post">
    <td> <input type="text" name="bid" value="<s:property value="#root.bid" />"></td>
  <td> <input type="text" name="bname" value="<s:property value="#root.bname" />"></td>
  <td> <input type="text" name="rnumber" value="<s:property value="#root.rnumber" />"></td>
 <td>   <input type="text" name="rname" value="<s:property value="#root.rname" />"></td>
   <td>   <input type="text" name="borrownum" value="<s:property value="#root.borrownum" />"></td>
  
  <td> <input type="text" name="classnum" value="<s:property value="#root.classnum" />"></td>
  <td> <input type="text" name="borrowdate1" value="<s:property value="#root.borrowdate" />"></td>
  <td> <input type="text" name="returndate1" value="<s:property value="#root.returndate" />"></td>
   
<td> <input type="button" onclick="delbr(this.form)" value="删除"/> 
  <br> <input type="button" onclick="changebr(this.form)" value="修改"/> 
  </td> </form>
   </tr>
   </s:iterator>
   </tbody>
  </table>

  
  <%} %>
  
  
  
<script type="text/javascript">

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
