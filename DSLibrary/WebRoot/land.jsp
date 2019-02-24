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
    
    <title>登录页面</title>
     <link href="css/archenav.css" rel="stylesheet" />
      <link href="css/login.css" rel="stylesheet" />

     <link rel="stylesheet" type="text/css" href="css/form.css">
<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	     <link rel="stylesheet" type="text/css" href="css/lrtk.css" />
   

<script type="text/javascript" src="js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="css/loginDialog.css" />
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
   
<script type="text/javascript" src="js/js.js"></script>
	
    <script type="text/javascript" src="js/archenav.js"></script>



  <script type="text/javascript">
   
   function check(f){
 
	
	 if(f.username.value!=""&&f.password.value!="")
		{falg=true;
		f.action='enter.action';
		f.submit();
		}
		 	 
		 	else { $.messager.alert('提醒','用户名和密码不能为空');
		
		 }
		
	 }
   </script>
<style type="text/css">



</style>
  </head>
  
  
  <body >
  <!-- 代码开始 -->
   <div class="header">
        <div class="topNav" id="topNav">
            <div class="topNav2">
                <div class="navBox">
                    <div class="navIndexBg">
                        <div class="navIL"></div>
                        <div class="navIL navIR"></div>
                        <div class="navIM"></div>
                    </div>
                    <div class="navMain" id="navMain">
                        <!-- 主导航放这里 -->
                        <div class="navIndex" id="navIndex">
                            <ul>
                                <li class=""><a href="http://www.lanrentuku.com/" title="官网首页" class="nav4">官网首页</a></li>
                                <li class="  "><a href="http://www.lanrentuku.com/" title="学习资料">学习资料</a></li>
                                <li class="nav1"><a href="http://www.lanrentuku.com/" title="视觉盛宴">视觉盛宴</a></li>
                                <li class=""><a href="http://www.lanrentuku.com/" title="游戏下载">资料下载</a></li>
                                <li class=""><a href="http://www.lanrentuku.com/" title="新闻活动">新闻活动</a></li>
                                <li class=""><a href="http://www.lanrentuku.com/" title="玩家社区">管理社区</a></li>
                            </ul>
                        </div>
                        <div class="navSub" id="navSub">
                            <dl class="nav2">
                                <dt>学习资料</dt>
                                <dd><a href="http://www.lanrentuku.com/" title="">图书馆介绍</a></dd>
                                <dd><a href="http://www.lanrentuku.com/" title="" target="_blank">馆内内特色</a></dd>
                                <dd><a href="http://www.lanrentuku.com/" title="">系统介绍</a></dd>
                                    </dl>
                            <dl class="nav1">
                                <dt>视觉盛宴</dt>
                                <dd><a href="http://www.lanrentuku.com/" title="">学习视频</a></dd>
                                <dd><a href="http://www.lanrentuku.com/" title="">精彩活动</a></dd>
                                
                                  </dl>
                            <dl>
                                <dt>资料下载</dt>
                                <dd><a href="http://www.lanrentuku.com/" title="">资料下载</a></dd>
                                <dd><a href="http://www.lanrentuku.com/" title="">其他下载</a></dd>
                            </dl>
                            <dl>
                                <dt>新闻活动</dt>
                                <dd><a href="http://www.lanrentuku.com/" title="">新闻中心</a></dd>
                                <dd><a href="http://www.lanrentuku.com/" title="">活动专题</a></dd>
                            </dl>
                            <dl>
                                <dt>关于我们</dt>
                                <dd><a href="http://www.lanrentuku.com/" title="" target="_blank" onclick="pgvSendClick({hottag:'nav.sub.navE2'});">关于我们</a></dd>
                                <dd><a href="http://www.lanrentuku.com/" target="_blank" title="" onclick="pgvSendClick({hottag:'nav.sub.navE3'});">官方论坛</a></dd>
                            </dl>
                        </div>
                        <!-- 二级放这里 end -->
                    </div>
                    
                </div>
            </div>
        </div>
        <div class="logoBox">
            <h1 id="logo" class="logoPNG">图书管理</h1>
        </div>
    </div>
  
  
        <!--代码开始-->
<div class="left">
<center>欢迎登录图书管理系统，请用鼠标指向图片查看注意事项</center></br>
<ul class="box">

	<li>
	
		<a href="land.jsp">
			<div class="toll_img"><img src="images/left1.jpg" /></div>
			<div class="toll_info"><p>书籍是人类进步的阶梯</p></div>
		</a>
	</li>
	<li>
		<a href="land.jsp">
			<div class="toll_img"><img src="images/left2.jpg" /></div>
			<div class="toll_info"><p>管理员应认真处理操作，减少工作失误</p></div>
		</a>
	</li>
	<li>
		<a href="land.jsp">
			<div class="toll_img"><img src="images/left3.jpg" /></div>
			<div class="toll_info"><p>有问题咨询电话：1234567</p></div>
		</a>
	</li>
</ul>

<!--代码结束-->
</div>

        
  <form name="form1" action="" method="post" class="form">
 <h1 >欢迎登录</h1>
 
 <img alt="" src="images/landlogo1.jpg">
  <s:if test="hasActionErrors()">
   <div class="errors"><s:actionerror/></div>
  </s:if>
  
  <table><tr><td>用户名：</td><td><input name="username" type="text" /></td>
  </tr><tr><td>   密&nbsp;码：</td><td><input name="password" type="password"/></td></tr></table>
      
      
 
    </br></br>
  <input type="button" onclick="check(this.form)" class="bn" value="登录" /> 
  
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="javascript:void(0);" id="forget">忘记密码？</a>
  
   </form>
    
	<div id="mmm">
    <div id="LoginBox">
    <s:if test="hasActionErrors()">
   <div class="errors"><s:actionerror/></div>
  </s:if>
    <form action="" method ="post">
        <div class="row1">
          回答问题登录<a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn">×</a>
        </div>
        <div class="row">
            用户名: <span class="inputBox">
                <input type="text" id="txtName" name="username" />
            </span><a href="javascript:void(0)" title="提示" class="warning" id="warn">*</a>
        </div>
        <div class="row">
          你最喜欢的书是:<br> 
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <span class="inputBox">
            <input type="text" id="txtPwd" name="answer" />
            </span><a href="javascript:void(0)" title="提示" class="warning" id="warn2">*</a>
        </div>
     
        <div class="row">
        <input type="button" value="登录" onclick="questionenter(this.form)" id="loginbtn">   
        
        
        </div>
    </div>
    </form>
</div>
<script>
 function questionenter(f){
 
	
	
		f.action='questionenter.action';
		f.submit();
		
		
	 }
</script>
	<script type="text/javascript">
	
		//弹出登录
		$("#forget").hover(function () {
			$(this).stop().animate({
				opacity: '1'
				
			}, 600);
		}, function () {
			$(this).stop().animate({
				opacity: '0.6'
			}, 1000);
		}).on('click', function () {
		
			$("body").append("<div id='mask'></div>");
			$("#mask").addClass("mask").fadeIn("slow");
			$("#LoginBox").fadeIn("slow");
		});
		//
		//按钮的透明度
		$("#loginbtn").hover(function () {
			$(this).stop().animate({
				opacity: '1'
			}, 600);
		}, function () {
			$(this).stop().animate({
				opacity: '0.8'
			}, 1000);
		});
		//文本框不允许为空---按钮触发
		$("#loginbtn").on('click', function () {
			var txtName = $("#txtName").val();
			var txtPwd = $("#txtPwd").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
					$(".warning").css({ display: 'block' });
				}
				else {
					$("#warn").css({ display: 'block' });
					$("#warn2").css({ display: 'none' });
				}
			}
			else {
				if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
					$("#warn").css({ display: 'none' });
					$(".warn2").css({ display: 'block' });
				}
				else {
					$(".warning").css({ display: 'none' });
				}
			}
		});
		//文本框不允许为空---单个文本触发
		$("#txtName").on('blur', function () {
			var txtName = $("#txtName").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				$("#warn").css({ display: 'block' });
			}
			else {
				$("#warn").css({ display: 'none' });
			}
		});
		$("#txtName").on('focus', function () {
			$("#warn").css({ display: 'none' });
		});
		//
		$("#txtPwd").on('blur', function () {
			var txtName = $("#txtPwd").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				$("#warn2").css({ display: 'block' });
			}
			else {
				$("#warn2").css({ display: 'none' });
			}
		});
		$("#txtPwd").on('focus', function () {
			$("#warn2").css({ display: 'none' });
		});
		//关闭
		$(".close_btn").hover(function () { $(this).css({ color: 'black' }) ;}, function () { $(this).css({ color: '#999' }); }).on('click', function () {
			$("#LoginBox").fadeOut("fast");
			$("#mask").css({ display: 'none' });
		});
	
	</script>	
   
 
  </body>
</html>
