<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String baseServer = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
	String basePath = baseServer + path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
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
	<script src="bootstrap/3/js/bootstrap.min.js"></script>
	<link href="bootstrap/3/css/datepicker.css" rel="stylesheet"/>
	<script src="bootstrap/3/js/bootstrap-datepicker.js"></script>
	
	<script src="index/js/index.js" type="text/javascript"></script>
	
	<style>
	</style>
	
  </head>
  
  <body>
   	
   	  <input type="hidden" name="action" value="index/about.jsp"> 
   
      <div class="pagetop">
      	 	<%@ include file="../../index/top.jsp" %>
      </div>

      <div class="nav container"  style="width:1000px;">
       	 <%@ include file="../../index/nav.jsp" %>
      </div>
      
      <div class="container" style="margin-top:10px;padding-left:0px;width:1000px;">
	   	 <div class="panel panel-info">
		   	  <div class="panel-heading">
		   	  		<center> APP应用 </center>
		   	  </div>
		   	   <div class="panel-body">
	   	   			 <div class="row" id="download-apks">
				     		<div id="download-Loading">
						      	<center>
						      		<image src="images/loading/loading_007.gif"><h3>玩命加载中......</h3></image>
						      	</center>
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
				getApps();
	    	});
	    	
	    	function getApps(){
	    			var appUploadFiledHtml="";
					var url = "/update?update=getapps&logdb=false";
					$.get(url, function(apps){
						console.log(apps);
						for(var i=0; i<apps.length; i++)
						{
							var app = apps[i];
							var form = $("#"+app.app_name+"Form");
							if(app.name!=undefined)
							{
								var html="";
								html += "	<div class=\"col-xs-4\">";
							    html += "      <h2>"+app.name+"</h2>";
							    html += "      ";
							    html += "      <p id=its_spsDownload>";
							    html += "      	<img src=\"qrservlet?text=<%=baseServer%>/update/FileServlet/download?appname="+app.app_name+" \" ";
							    html += "      		class=\"img-thumbnail\" style=\"width:240px;height:240px;\" >";
							    html += "      	<br /> <br />";
							    html += "      	<a name=Download href=\" "+app.url+" \" class=\"btn btn-info btn-large\" > 下载 </a>";
							    html += "       <a class=btn href=#>详情 &raquo;</a></p>";
							    html += "    </div>";
				        		$("#download-apks").append(html);
				        		$("#download-Loading").css("display","none");
							}
						}
						
				}, "json");
			}
	    
	    
	    </script>
		

  </body>
</html>


