<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <base target="main"/>
    <title>My JSP 'admin_bottom.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>


  </head>
  
  <body>
	<center>
		<div id="main" class="maindiv" style="display:none;  ">
		
			<div id="content"  class="nowrap-ellipsis"  style="display:inline-block;width:80%;" >
				...
			</div>
			
			<span>
				<a href="AlarmAction?method=query" > 更多 </a>
			</span>
		
			<span id="sound" style="display:none;">
			
			</span>
		</div>
	</center>    

  </body>
</html>


<script>
	function queryAlarm(){
		$.ajax({
			type: 'post',
			url: 'AlarmAction?m=list',
			dateType: 'json',
			success: function(data){
				var ret = eval("("+data+")");
				console.log(ret);
				var balarm = ret.bAlarm;
				var json = ret.list;
				if(json.length > 0 ){
					console.log("新告警");
					var html = "";
					for(var i=0; i<json.length; i++){
						html += "<a href=\"ResultCarAction?method=view&id="+json[i].id+"\">";
						html += json[i].plate+ "["+json[i].resultTypeName+"]"; 
						html += "</a> &nbsp;  |  &nbsp;";
					}
					$("#content").html(html);
				}
				if(balarm==true){
					var object="";
					if(document.all){
						object = "<embed id=player src=\"sound/alarm.mp3\"  ";
						object += "console=LonelyStreet controls=ControlPanel autostart=false ></embed> "; 
					}else{
						object = "<audio id=player controls=controls src=\"sound/alarm.mp3\" >";
						object += "<source /> </audio>";
					}
					$("#sound").html(object);
				}
				$("#main").css("display","block");
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				console.log(textStatus);
				$("#msg").html(textStatus);
			}
		});
	}	

	$(document).ready(function(){
	
	//	setInterval(queryAlarm, 5000);
		
		
	});
</script>

