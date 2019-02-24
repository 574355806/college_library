
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

  
   <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="JS代码,菜单导航,JS广告代码,JS特效代码" />
<meta name="description" content="此代码内容为jQuery的垂直可折叠菜单特效，属于站长常用代码，更多菜单导航代码请访问懒人图库JS代码频道。" />
<title>标题</title>
<link rel=stylesheet type=text/css href="../css/lrtk.css">
<script type=text/javascript src="../js/jquery.js"></script>
</head>
<body>
<!-- 代码 开始 -->
 <div id="firstpane" class="menu_list">
    <p class="menu_head current">图书管理</p>
    <div style="display:block" class=menu_body >
      <a href="pageshow.action?flag=book" target="r">查看图书</a>
       <a href="book_searchoperator.action" target="r">查询操作</a>
   <a href="book_showaddbook.action" target="r">添加图书</a>
   <a href="book_showremovebook.action" target="r">删除图书</a>
  <a href="book_showchangebook.action" target="r">修改图书</a>
    </div>
    <p class="menu_head">读者管理</p>
    <div style="display:none" class=menu_body >
      <a href="pageshow.action?flag=reader" target="r">查看读者</a>
      <a href="reader_searchoperator.action" target="r">查询操作</a>
 
    <a href="reader_addreader.action" target="r">添加读者</a>
 <a href="reader_showremovereader.action" target="r">删除读者</a>
    <a href="reader_showchangereader.action" target="r">修改信息</a>
    </div>
    
    <p class="menu_head">借阅管理</p>
    <div style="display:none" class=menu_body >
      <a href="pageshow.action?flag=borrowrecord" target="r">查看借阅记录</a>
       <a href="borrowrecord_search.action" target="r">查询操作</a>     
    <a href="borrowrecord_showaddbr.action" target="r">添加借阅记录</a>
 <a href="borrowrecord_showremovebr.action" target="r">删除借阅记录</a>
    <a href="borrowrecord_showchangebr.action" target="r">修改借阅信息</a>
     <a href="borrowrecord_nearreturndate.action" target="r">查看将到期</a>
    </div>
    <%String root=session.getAttribute("root").toString();
    if("高级".equals(root)){ %>
    <p class="menu_head">管理管理员</p>
    <div style="display:none" class=menu_body >
       <a href="user_show.action" target="r">查看管理员</a>
      <a href="user_loginer.action" target="r">添加管理员</a>
     <a href="user_showdel.action" target="r">删除管理员</a>
      <a href="user_showchange.action" target="r">修改密码</a>
    </div>
   <%} %>
</div>
<script type=text/javascript>
$(document).ready(function(){
	$("#firstpane .menu_body:eq(0)").show();
	$("#firstpane p.menu_head").click(function(){
		$(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
		$(this).siblings().removeClass("current");
	});
	$("#secondpane .menu_body:eq(0)").show();
	$("#secondpane p.menu_head").mouseover(function(){
		$(this).addClass("current").next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
		$(this).siblings().removeClass("current");
	});
	
});
</script>

<!-- 代码 结束 -->
   
   
  </body>
</html>
