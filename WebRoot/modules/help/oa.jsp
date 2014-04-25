<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String uri =   request.getRequestURI();
String queryString = request.getQueryString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="">
    
    <title> 帮助手册 </title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1";/><!-- IE的渲染模式 -->
    
    <title> APP应用 </title>
    
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
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js"></script>
	<script src="bootstrap/3/js/bootstrap.min.js"></script>
	<link href="bootstrap/3/css/datepicker.css" rel="stylesheet"/>
	<script src="bootstrap/3/js/bootstrap-datepicker.js"></script>
	
	<script src="index/js/index.js" type="text/javascript"></script>
	
	<style>
		h1, h2 {
			padding-top:50px;
		}
	</style>

  </head>
  
  <body>
     
	<div class="pagetop" id="top">
		 	<%@ include file="../../index/top.jsp" %>
	</div>
	
	<div class="nav container"  style="width:1000px;">
	 	 <%@ include file="../../index/nav.jsp" %>
	</div>


	<div class="container" style="margin-top:10px;padding-left:0px;width:1000px;">
	      
	      	 <div class="panel panel-info">
			   	  <div class="panel-heading">
			   	  		<center> 使用说明 </center>
			   	  </div>
			   	   <div class="panel-body" >
		   	   			
							<div name="container">
     	
						     	<div class="row">
						     		
						     		<div class="col-md-9" style="line-height:30px;" >
						     			
						     			<!-- Intraduction -->
						     			<div >
						     				<h1 id="intraduction" style="padding-top:0px;" >简介</h1>
						     				<p>
						     					OA系统主要功能列表详解左侧菜单。
						     				</p>
						     				<p>
						     					<h3 id="intraduction-front">使用方法: </h3>
						     					
						     					<h3>1).前台界面  </h3>
						     						<p>
						     							前台页面主要是浏览信息，如浏览规章制度、文件下载等，
						     							地址: <a href="<%=basePath %>" target="_blank" ><%=basePath %></a> 。
						     						</p>
						     						<p>	主要功能:</p>
						     						<p>
						     							<ul>
						     							 	<li>首页</li>
						     								<li>新闻动态</li>
						     								<li>内部信息
						     									<ul>
						     										<li>行政规章制度</li>
						     										<li>财务规章制度</li>
						     										<li>技术文档</li>
						     										<li>APP应用</li>
						     									</ul>
						     								</li>
						     								<li>通知公告</li>
						     								<li>文件下载</li>
						     								<li>关于我们</li>
						     							</ul>
						     							
						     							前台主页:<br/>
						     							<img src="modules/help/images/1.png" style="width:500px;" />
						     						</p>
						     					
						     					<br />
						     					<h3 id="intraduction-admin" >2).后台管理</h3>
						     					<p>
						     						后台管理用户、部门、权限、规章制度等。<br/>
						     						后台登录:<br>
						     							<li>方式一：地址: <a href="<%=basePath %>/LoginAction?" target="_blank" ><%=basePath %>/LoginAction?</a> </li>
						     							<li>方式二：在前台界面的最下方点击 <a href="<%=basePath %>/LoginAction?flag=1">管理登录</a>
						     								<br/>
						     								<img src="modules/help/images/2.png"  />
						     							</li>
						     					</p>
						     					
						     				</p>
						     			
						     			</div><!-- end of Intraduction -->
						     			
						     			<!-- 系统管理 -->
						     			<div >
						     				<h1 id="zzgl" >一、组织管理 </h1>
						     				
						     				<!-- 人员管理 -->
						    				<div >
						     					<h2 id="user-manager">人员管理</h2>
						     					<ol>
													<li>登录后台</li> 
						     						<li>在左侧菜单点击【组织管理】->【人员管理】，如下图所示
						     							<br/>
														<img src="modules/help/images/3.png" />
													</li> 
													<li>在右侧页面中可进行 【增加】【修改】【删除】用户,如下图所示
														<br/>
														<img src="modules/help/images/4.png" style="width:500px;" />
														<br/>
															在修改用户信息时，如过不填密码，则默认不会修改密码。
														<br/>
													</li> 
						     					</ol> 
						   					</div><!-- end of 人员管理 -->
						   					
						   					<!-- 权限管理 -->
						   					<div>
						   						<h2 id="role-manager">角色权限管理</h2>
						     					<ol>
													<li>登录后台</li> 
						     						<li>在左侧菜单点击【组织管理】->【角色管理】，如下图所示
						     							<br/>
														<img src="modules/help/images/7.png" />
													</li> 
													<li>在右侧页面中可进行 【增加】【修改】【删除】角色,如下图所示
														<br/>
														<img src="modules/help/images/8.png" style="width:500px;" />
														<br/>
													</li> 
													<li>
														修改权限：
														<br/>
														<img src="modules/help/images/9.png" style="width:500px;" />
													</li>
						     					</ol> 
						   					</div><!-- end of 权限管理 -->
						     					 
						     				<!-- 规则制度管理 -->
						     				<div   >
						     					<h2 id="gzzd">二、规章制度管理</h2>
						     					<p>
						     						<h3>特点:</h3>
						     						<p>
						     							规章制度最好是以文章的形式发表，如需添加图片和附件，可在文章中直接添加和编辑。用户查看的时候可以只读取文章，也可以下载部分附件。
						     						</p>
						     					</p>
						     					<p>
						     						<h3>使用说明:</h3>
						     						<p>
						     						  <ol>
						     							<li>登录后台</li> 
							     						<li>在左侧菜单点击【行政管理】->【规章制度】，如下图所示
							     							<br/>
															<img src="modules/help/images/5.png" />
														</li> 
														<li>在右侧页面中可进行 【增加】【修改】【删除】文章,如下图所示
															<br/>
															<img src="modules/help/images/6.png" style="width:500px;" />
														</li> 
														<li>编辑文章
															<br/>
															<img src="modules/help/images/10.png" style="width:500px;" />
														</li>
														<strong>注:财务制度操作方式相同。</strong>
													  </ol>
						     						</p>
						     					</p>
						     				</div><!-- end of 规则制度管理 -->
						     				
						     				
						     				<div>
						     				
						     				</div>
						     				
						     				
						     			</div><!-- end of 系统管理 -->
						     			
						     			<!-- more -->
						     			<div  >
						     				<h1 id="more">附加信息</h1>
						     				<p>
						     					<ul>
						     						<li> 内网地址 <a href="http://10.168.1.252:8888/oa">http://10.168.1.252:8888/oa</a> </li>
						     						<li> 外网地址 <a href="http://teleframe.xicp.net/oa">http://teleframe.xicp.net/oa</a> </li>
						     						<li> 前台页面 <a href="<%=basePath %>" target="_blank" ><%=basePath %></a>  </li>
						     						<li> 前台页面管理<a href="<%=basePath %>/LoginAction?" target="_blank" ><%=basePath %>/LoginAction?</a>  </li>
						     						<li> 访客用户名:guest  &nbsp;&nbsp;&nbsp; 密码:123456</li>
						     					</ul>
						     				</p>
						     			</div>
						     			
						     		</div><!-- end of col-md-9 -->
						     		
						     		<div class="col-md-3" style="padding-top:18px;">
						     			<div id="navlist"   style="position: fixed;">
							     			<ul>
							     				<li><a href="#top">回顶部</a></li>
							     				<li>
							     					<a href="#intraduction">简介</a>
							     					<ul>
							     						<li><a href="#intraduction-front">前台界面</a></li>
							     						<li><a href="#intraduction-admin">后台管理</a></li>
							     					</ul>
							     				</li>
							     				<li>
							     					<a href="#zzgl">组织管理</a>
							     					<ul>
							     						<li><a href="#user-manager">人员管理</a></li>
							     						<li><a href="#role-manager">角色权限管理</a></li>
							     						<li><a href="#gzzd">规章制度管理</a></li>
							     					</ul>
							     				</li>
							     				<li>
							     					<a href="#more">附加信息</a>
							     				</li>
							     			</ul>
							     		</div>
						     		</div>
						     		
						     	</div>
						     	
						     </div>
		   	   			
			   	   </div>
			</div>
			
			
	     
	 </div>	
  	
<div class="booter container" style="width:1000px;">
	<%@ include file="../../index/booter.jsp" %>
 </div>   
     
     <script>
    	$(document).ready(function(){
    		 $( "#navlist" ).draggable();
    	});
     </script>


  </body>
</html>
