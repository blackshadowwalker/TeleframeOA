<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String callback = request.getParameter("callback");
	if(callback==null)
		callback = "callback";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'uploadframe.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>

	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>

  </head>
  
  <body>
		
	<div id="main">
		
	</div>
	

	<div style="display:block;">
		<form action="UploadAction?callback=fileuploadcallback"  method="post" ENCTYPE="multipart/form-data" target="hidden_frame" >
			<input type=file name=file onchange="uploadPhoto(this);" />
			<input type="hidden" name="dir"  value="user/photos" /><br>
		</form>
		<iframe name="hidden_frame" style="display:none;" ></iframe>
	</div>
	<script>
  		
  		function chooserPhoto(){
  			$("input[name=file]").click();
  		}
  		
		function uploadPhoto(obj){
  			$(obj).parent().submit();
  		}
  		function InsertFile(filepath, filename){
  		//	parent.window.<%=callback%>(filepath,filename);
  			var html = "<a href='"+filepath+"' >"+filename+"</a>";
  			parent.window.<%=callback%>(html);
  		}
  		
  		function fileuploadcallback(json){
			if(json.error==0){
				if(json.data.length>=1)
				{
					var html = json.data[0].fileName+"&nbsp;<a href=\"javascript:InsertFile(\'"+json.data[0].path+"\', '"+json.data[0].fileName+"');  \">插入</a>";
					$("#main").append(html+"<br>");
				}
			}
		}
		
	</script>
	
  </body>
</html>
