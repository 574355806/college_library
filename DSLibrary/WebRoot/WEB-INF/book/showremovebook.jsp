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
	
	<link rel="stylesheet" type="text/css" href="css/excel.css">
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	  <script type="text/javascript" src="js/excel.js"></script>
	
	
    <%-- <script type="text/javascript">
  function del(){
  flag=true;
  if(flag==true)
			$.messager.alert('My Title','Here is a message!');
				
		}
		
		function firm(){
			$.messager.alert('My Title','Here is a message!');
			/* if(confirm("确定删除？"))
			{ alert("取消");
			} */
				
		}
  
  </script> --%>
  
  </head>
  
  <body id="bg">
  		
	<script>
		function del(form1){
		var falg=false;
			$.messager.confirm('提示', '确定删除?', function(r){
				if (r){
				
				form1.action='book_removebook_result.action';
				form1.submit();
					
				}
				return falg;
			});
		}
		
	
	</script>
	

  <%session.setAttribute("flag", "removebook"); %>
 
  
   <table>

<thead> 
<tr>
<th>图书编号</th>
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
<form name="form1" action=""  method="post">

  
<tr>   
<td><input name="bid" value="<s:property value='#root.bid'/>"/> 
  </td>
<td> <s:property value="#root.bname" />
</td>
<td>  <s:property value="#root.btype" />
   </td>
<td><s:property value="#root.bwriter" />
   </td>
<td> <s:property value="#root.bpublisher" />
 </td>
<td> <s:property value="#root.bnumber" />
</td>
<td> <s:property value="#root.bborrow" />
  </td>
<td> <s:property value="#root.bplace" />
</td>
<td>   <s:property value="#root.bprice" />
  
</td>
<td>
<input type="button" value="删除"  onclick="del(this.form)"></td>

</tr>

</form>
 

 </s:iterator>
 
</tbody> 

</table>
<script type="text/javascript">

var Ptr=document.getElementById("tab").getElementsByTagName("tr");
function ll() {
    for (i=1;i<Ptr.length+1;i++) { 
    Ptr[i-1].className = (i%2>0)?"t1":"t2"; 
    }
}
window.onload=$;
for(var i=0;i<Ptr.length;i++) {
    Ptr[i].onmouseover=function jj(){
    this.tmpClass=this.className;
    this.className = "t3";
    
    };
    Ptr[i].onmouseout=function kk(){
    this.className=this.tmpClass;
    };
}
</script>
  
  </body>
</html>
