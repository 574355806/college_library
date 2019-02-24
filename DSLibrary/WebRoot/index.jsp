<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mainmenu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/default.css">
<link type="text/css" rel="stylesheet" href="css/carousel.css">
<style type="text/css">
	.caroursel{margin:150px auto;}
</style>
</head>
<body>
<article class="zzsc">
	<div class = "caroursel poster-main" data-setting = '{
		"width":600,
		"height":270,
		"posterWidth":500,
		"posterHeight":200,
		"scale":0.8,
		"dealy":"2000",
		"algin":"middle"
	}'>
		<ul class = "poster-list">
			<li class = "poster-item"><img src="images/1.jpg" width = "100%" height="100%"></li>
			<li class = "poster-item"><img src="images/2.jpg" width = "100%" height="100%"></li>
			<li class = "poster-item"><img src="images/3.jpg" width = "100%" height="100%"></li>
			<li class = "poster-item"><img src="images/4.jpg" width = "100%" height="100%"></li>
			<li class = "poster-item"><img src="images/5.jpg" width = "100%" height="100%"></li>
			<li class = "poster-item"><img src="images/6.jpg"  width = "100%" height="100%"></li>
			<li class = "poster-item"><img src="images/1.jpg"  width = "100%" height="100%"></li>
		</ul>
		<div class = "poster-btn poster-prev-btn"></div>
		<div class = "poster-btn poster-next-btn"></div>
	</div>
</article>

<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery.carousel.js"></script>
<script>
	Caroursel.init($('.caroursel'));
</script>

  </body>
</html>
