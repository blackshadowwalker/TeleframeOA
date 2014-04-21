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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>GMAP</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>
	
	<script language="javascript" src="${gmapurl}/gmap/res/js/tf-gmap.js" ></script>
	<script language="javascript" src="scripts/main.js" ></script>
	
	<script>

		 function init(){
			//初始化地图并设置中心点和level
			initMap(new Coordinates(28.2282090000,112.9388140000),13);            //改变地图中心点的函数
			changeCenter(new Coordinates(28.2048856108,112.9296684265));
			//地图上添加标记获取经纬度的函数，其中回调函数为移动图标后位置的经纬度
			queryMarkerCoordinates(function(position){
			//	alert(position);
				//清楚标记函数
			//	clearQueryMarker();
			});
		}
		
		var locations = new Array();
		function Query(){
			clearQueryMarker();
			
			var resultCar = {};
			resultCar.plate = $("input[name='resultCar.plate']").val();
			resultCar.carTimeStart = $("input[name='resultCar.carTimeStart']").val();
			resultCar.carTimeEnd = $("input[name='resultCar.carTimeEnd']").val();
			
			if($.trim(resultCar.plate)==""){
				alert("请输入车牌");
				return ;
			}
		
			$.ajax({
				type:'post',
				data:{ 
						"resultCar.plate":  resultCar.plate , 
						"resultCar.carTimeStart": resultCar.carTimeStart,
						"resultCar.carTimeEnd" : resultCar.carTimeEnd
					},
				url: '${action}?method=list',
				dateType: 'json',
				success: function(data){
					var json = eval(data);
					console.log(json);
					locations.length = 0; 
					for(var i=0; i<json.length; i++){
						var html = "<div>";
						html += "<div style=\"width:200px;\">车牌:"+json[i].plate+"<br/>";
						html += "时间:"+formatJsonDateTime(json[i].carTime);
						html += "</div><br/><a target=_blank href=\"/ftp"+json[i].carImage+"\"> <img src=\"/ftp"+json[i].carImage+"\" style=\"width:300px;height:200px;\" /></a>";
						html += "</div>";
						var tip = new MarkerTip( json[i].latitude, json[i].longitude, 
								formatJsonDateTime(json[i].carTime), html );
						locations.push(tip);
					}
					drawPath(locations); //
				},
				error:function(XMLHttpRequest, textStatus, errorThrown){
					console.log(textStatus+" "+errorThrown);
					$("#msg").html(textStatus);
				}
			});// end of ajax
		};// end of Query;
		
	</script>
	
	
  </head>
  
  <body onload="init();">
   		<div style="margin-top:10px;">
   			<form  >
   				车牌:
   				<input name="resultCar.plate" required="required" placeholder="车牌" value="湘M22052"/>
   				
   				<span class=titlelabel>时间段:</span> 
					<input type="text" name="resultCar.carTimeStart" placeholder="开始时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" 
						   value="${resultCar.carTimeStart }" class="Wdate"  style="width:122px;" />
						--
					<input type="text" name="resultCar.carTimeEnd" placeholder="结束时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" 
						   value="${resultCar.carTimeEnd }" class="Wdate"  style="width:122px;"/>
				<span class="errorMsg">${msg}</span>
			
   				<input type="button" class="button" value="查询" onclick="Query();" /> 
   				
   			</form>
   		</div>
		<div id="mapCanvas" style="margin-top:50px;" >
		
		</div>

  </body>
</html>
