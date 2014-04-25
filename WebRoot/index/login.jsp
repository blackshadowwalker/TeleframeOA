<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1";/><!-- IE的渲染模式 -->
    
    <title> <s:property value="#application.config.title" /> </title>
    
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="bootstrap/3/css/bootstrap.css" rel="stylesheet"/>
	<link href="index/css/justified-nav.css" rel="stylesheet">
	<link href="index/css/style.css" rel="stylesheet" >

	<script src="scripts/jquery/jquery-1.7.min.js"></script>
	<script src="bootstrap/3/js/bootstrap.min.js"></script>
	
	<script src="index/js/index.js" type="text/javascript"></script>
	
  </head>
  
  <body>
   
	<div class="" >
	
	       <div class="pagetop">
	       	 	<%@ include file="top.jsp" %>
	       </div>
	
	       <div class="nav container"  style="width:1000px;">
		       	 <%@ include file="nav.jsp" %>
	       </div>
			
		   <div class="container  " style="margin-top:50px;padding-left:0px;">
			   <div class="loginbody"  style="width:1000px;" >
			   <div class="panel panel-info">
			   	  <div class="panel-heading">
						<center>
								<span>
									登录
								</span>
							</center>
				</div>
				  <div class="panel-body">
			   		
			 		<div class="" style="width:300px;margin:0 auto;"   >
					 	
				      <form name="loginform" class="form-signin" action="UserLoginAction?method=login"  method="post">
				        <br/>
				        	
				        		<center>
									<div style="color:#FF0000;" ><s:property value="msg" /></div>
								</center>
				        	
								<div class="input-group">
								  	<span class="input-group-addon ">
										<span class="glyphicon glyphicon-user"></span> 
									</span>

						        	<input type="text" class="form-control"  placeholder="UserName" name="user.userCode"  value="${user.userCode}"  label="username" onKeyDown="javascript:if (event.keyCode==13) event.keyCode=9;" />
						       		<span id=i_usernameError >
										<s:property value="errors['user.username'][0]" />
									</span>
								</div>
								
								<br/>
								
								<div class="input-group">
								  	<span class="input-group-addon ">
										<span class="glyphicon glyphicon-lock"></span> 
									</span>
						        	<input type="password" class="form-control"  placeholder="Password" name="user.userPasswd" value="${user.userPasswd}" label="password" onKeyDown="javascript:if (event.keyCode==13) event.keyCode=9;" />
									<span id=i_passwordError class=errorMessage>
										<s:property value="errors['user.password'][0]" />
									</span>
								</div>
								
								<input type="hidden" name="RedirectUrl" value="IndexAction?" >
								
						<br/>
				        <center>
				        	<button class="btn btn-middle btn-primary" type="submit">登录</button>
				        	<span>&nbsp;&nbsp;</span>
							<input class="btn btn-middle btn-info"  type="reset" onclick="reset()"  value="重置" />
				        </center>
									
				      </form>
				      </div>
				        </div>
				  </div>
			 </div> <!-- /container -->
		   </div>
			       
     </div> 
     
     <script>
     	$(document).ready(function(){
			$("a[href='${action}']").parent().attr("class", "active");
			$("input[name='user.userCode']").focus();
    	});
     </script>

  </body>
</html>
