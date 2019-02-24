<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ss.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
  </head>
  
  <body>
  
  <table id="tt" title="Load Data" class="easyui-datagrid" style="width:550px;height:250px"
			url="data/datagrid_data.json"
			iconCls="icon-save" pagination="true">
		<thead>
			<tr>
				<th field="itemid" width="80">Item ID</th>
				<th field="productid" width="80">Product ID</th>
				<th field="listprice" width="80" align="right">List Price</th>
				<th field="unitcost" width="80" align="right">Unit Cost</th>
				<th field="attr1" width="100">Attribute</th>
				<th field="status" width="60" align="center">Stauts</th>
			</tr>
		</thead>
	</table>
  
  
   <table class="easyui-datagrid" title="DataGrid with Toolbar" style="width:900px;height:250px"
			data-options="rownumbers:true,singleSelect:true,url:'datagrid_data1.json',method:'get',toolbar:toolbar">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80">图书编号</th>
				<th data-options="field:'productid',width:100">图书名</th>
				<th data-options="field:'status',width:60,align:'center'">类型</th>
				
				<th data-options="field:'listprice',width:80,align:'right'">作者</th>
				<th data-options="field:'unitcost',width:80,align:'right'">出版社</th>
				<th data-options="field:'attr1',width:80">馆藏量</th>
				<th data-options="field:'status',width:60,align:'center'">已出借</th>
				<th data-options="field:'status',width:60,align:'center'">馆藏位置</th>
				</tr>
		</thead>
	</table>
	<script type="text/javascript">
		var toolbar = [{
			text:'Add',
			iconCls:'icon-add',
			handler:function(){alert('add')}
		},{
			text:'Cut',
			iconCls:'icon-cut',
			handler:function(){alert('cut')}
		},'-',{
			text:'Save',
			iconCls:'icon-save',
			handler:function(){alert('save')}
		}];
	</script>
  </body>
</html>
