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
	
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/default.css">
<link type="text/css" rel="stylesheet" href="css/carousel.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/interface.js"></script>

<link href="css/style.css" rel="stylesheet" type="text/css" />

<link href="css/public.css" rel="stylesheet" type="text/css" />

<style type="text/css">
	.caroursel{margin:150px auto;}
</style>
</head>
<body>
<div id="container">
<div id="header">



<div class="dock" id="dock">
  <div class="dock-container">
	  <a class="dock-item" href="#"><img src="images/menus/home.png" alt="home" /><span>Home</span></a> 
	  <a class="dock-item" href="#"><img src="images/menus/email.png" alt="contact" /><span>Contact</span></a> 
	  <a class="dock-item" href="#"><img src="images/menus/portfolio.png" alt="portfolio" /><span>Portfolio</span></a> 
	  <a class="dock-item" href="#"><img src="images/menus/music.png" alt="music" /><span>Music</span></a> 
	  <a class="dock-item" href="#"><img src="images/menus/video.png" alt="video" /><span>Video</span></a> 
	  <a class="dock-item" href="#"><img src="images/menus/history.png" alt="history" /><span>History</span></a> 
	  <a class="dock-item" href="#"><img src="images/menus/calendar.png" alt="calendar" /><span>Calendar</span></a> 
	  <a class="dock-item" href="#"><img src="images/menus/rss.png" alt="rss" /><span>RSS</span></a>
	  <a class="dock-item" href="#"><img src="images/menus/rss.png" alt="rss" /><span>RSS</span></a> 
	  <a class="dock-item" href="#"><img src="images/menus/rss2.png" alt="rss" /><span>RSS2</span></a>
  </div> 
</div>
 

<p>
  <!--dock menu JS options -->
  <script type="text/javascript">
	
	$(document).ready(
		function()
		{
			$('#dock').Fisheye(
				{
					maxWidth: 50,
					items: 'a',
					itemsText: 'span',
					container: '.dock-container',
					itemWidth: 40,
					proximity: 90,
					halign : 'center'
				}
			)
			$('#dock2').Fisheye(
				{
					maxWidth: 60,
					items: 'a',
					itemsText: 'span',
					container: '.dock-container2',
					itemWidth: 40,
					proximity: 80,
					alignment : 'left',
					valign: 'bottom',
					halign : 'center'
				}
			)
		}
	);

</script>
</p>





</div>
<div id="maincontent">

滚动的图片
<article class="zzsc">
	<div class = "caroursel poster-main" data-setting = '{
		"width":600,
		"height":200,
		"posterWidth":500,
		"posterHeight":200,
		"scale":0.8,
		"dealy":"1400",
		"algin":"middle"
	}'>
		<ul class = "poster-list">
			<li class = "poster-item"><img src="images/1.jpg" width = "100%" height="100%"></li>
			<li class = "poster-item"><img src="images/2.jpg" width = "100%" height="100%"></li>
			<li class = "poster-item"><img src="images/3.jpg" width = "100%" height="100%"></li>
			<li class = "poster-item"><img src="images/4.jpg" width = "100%" height="100%"></li>
			<li class = "poster-item"><img src="images/5.jpg" width = "100%" height="100%"></li>
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


</div>
</div>




<!-- 

 -->

  </body>
</html>
