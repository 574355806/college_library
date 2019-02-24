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

<!-- <link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	    -->
 
 <link href="css/lrtk.css" rel="stylesheet" type="text/css" />
  <link href="css/archenav.css" rel="stylesheet" />
   <link rel="stylesheet" href="css/styles.css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
   
   <script type="text/javascript" src="js/jquery.js"></script>
   <script type="text/javascript" src="js/interface.js"></script>
<script src="js/js.js"></script>
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
#color{
background-color:#D3D3D3;
}
#nav { 

margin-left:800px;
}
 #whole{width:100%;margin:0  auto;background:url(../images/%E6%98%9F%E6%98%9F%E8%83%8C%E6%99%AF/%E6%98%9F%E6%98%9F%E8%83%8C%E6%99%AF_018.gif)}

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
  
  <body id="color">
  
  
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
  
 <%-- <%session.setAttribute("root", u1.getRoot());
		session.setAttribute("password", u1.getPassword());
		session.setAttribute("username", u1.getUsername()); %> --%>
    
  </div>
  
    <!-- <iframe name="left" id= "left"src="somefiles/title.jsp"  width=20% height=100% ></iframe>
   <iframe name="r" id="r"src="somefiles/opertaor.jsp"  width=68% height=100%> </iframe>
   --> 
   <br><br><br>
 
   <div class="dock" id="dock">
  <div class="dock-container">
	  <a class="dock-item" href="javascript:void(0)" onclick="history.go(0)"><img src="images/menus/home.png" alt="home" /><span>首页</span></a> 
	  <a class="dock-item" href="#"><img src="images/menus/email.png" alt="contact" /><span>Contact</span></a> 
	  <a class="dock-item" href="#"><img src="images/menus/portfolio.png" alt="portfolio" /><span>Portfolio</span></a> 
	  <a class="dock-item" href="#"><img src="images/menus/music.png" alt="music" /><span>Music</span></a> 
	  <a class="dock-item" href="somefiles/vidio/index.html" target="blank"><img src="images/menus/video.png" alt="video" /><span>视频</span></a> 
	  <a class="dock-item" href="user_changeown.action" target="blank"><img src="images/menus/history.png" alt="history" /><span>修改密码</span></a> 
	  <a class="dock-item" href="somefiles/calender.jsp" target="bo"><img src="images/menus/calendar.png" alt="calendar" /><span>日历</span></a> 
	   </div> 
</div><br><br>
<iframe name="bo" scr="somefiles/bo.jsp" width="650px",height=100% scrolling="no" frameborder="0" onload=' this.style.height=Math.max(this.contentWindow.document.body.scrollHeight,this.contentWindow.document.documentElement.scrollHeight,200)+"px";  '></iframe>

  <img alt="" src="images/sakula.jpg" >
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
