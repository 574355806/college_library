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
    
    <title>enter</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<!-- 
<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css"> -->
	   
 
 <link href="css/lrtk.css" rel="stylesheet" type="text/css" />
  <link href="css/archenav.css" rel="stylesheet" />
   <link rel="stylesheet"  type="text/css" href="css/styles.css" />
   <link href="css/style.css" rel="stylesheet" type="text/css" />
   
   <script type="text/javascript" src="js/jquery.js"></script>
    
<script src="js/js.js"></script>
 <script type="text/javascript" src="js/interface.js"></script>
	
<script type="text/javascript" src="js/archenav.js"></script>

<%-- <script type="text/javascript" src="js/jquery.easyui.min.js"></script>	
  --%>    
<script src="js/lrtk.js"></script>


<style type="text/css">

#container{ width:100%; margin:0 auto; background:url(images/header.jpg)}
#header1 { height:180px;
font-size:16px;
font-family:楷体;
color:blue;
margin-bottom:8px;
background:url(images/daohang.jpg);

}
#manger { margin:0px auto;float:left;font-size:20px;
 width=250px;height=250px ; 
 background:}
#imgbox{
margin:0px auto;float:top;

margin-left:700px;
margin-top:-70px;
}


/*main*/
#container1{ width:100%; margin:0 auto}



</style>
<script>
function close1()
{
window.close();
//window.close();
}
</script>
  </head>
  
  <body>
  
  <%-- 
  <div id="header1"><!-- style=" width=100%; height=100px;background:url(images/header.jpg) ;font-size:10px; " > --> <br>
 
  <nav>
            <ul class="fancyNav">
                <li id="home"><a href="#home" class="homeIcon">Home</a></li>
                <li id="news"><a href="somefiles/work.jsp">开始管理</a></li>
                <li id="about"><a href="land.jsp">退出登录</a></li>
                <li id="services"><a href="javascript:void(0)" onclick="close1();">关闭系统</a></li>              
            </ul>
        </nav>
        
<div id="imgbox">
 <img src="images/2.jpg"  id="tp" width="250" height="150"/>
 </div>
  <div id="manger">
   管理员：<s:property value="#root.username"/>
<a href="user_changeown.action" target="r">  <button>修改密码</button></a>
  

    
  </div> --%>
  
    <!-- <iframe name="left" id= "left"src="somefiles/title.jsp"  width=20% height=100% ></iframe>
   <iframe name="r" id="r"src="somefiles/opertaor.jsp"  width=68% height=100%> </iframe>
   --> 
   <br>
   <!--top dock -->
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

<!--bottom dock -->
<div class="dock" id="dock2">
  <div class="dock-container2">
	  <a class="dock-item2" href="#"><span>Home</span><img src="images/home.png" alt="home" /></a> 
	  <a class="dock-item2" href="#"><span>Contact</span><img src="images/email.png" alt="contact" /></a> 
	  <a class="dock-item2" href="#"><span>Portfolio</span><img src="images/portfolio.png" alt="portfolio" /></a> 
	  <a class="dock-item2" href="#"><span>Music</span><img src="images/music.png" alt="music" /></a> 
	  <a class="dock-item2" href="#"><span>Video</span><img src="images/video.png" alt="video" /></a> 
	  <a class="dock-item2" href="#"><span>History</span><img src="images/history.png" alt="history" /></a> 
	  <a class="dock-item2" href="#"><span>Calendar</span><img src="images/calendar.png" alt="calendar" /></a> 
	  <a class="dock-item2" href="#"><span>Links</span><img src="images/link.png" alt="links" /></a> 
	  <a class="dock-item2" href="#"><span>RSS</span><img src="images/rss.png" alt="rss" /></a> 
	  <a class="dock-item2" href="#"><span>RSS2</span><img src="images/rss2.png" alt="rss" /></a> 
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
   
  </body>
</html>
