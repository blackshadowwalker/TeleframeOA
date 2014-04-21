<%@ page language="java" import="java.util.*" import="com.bean.UserInfo" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>/">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>添加/修改设备</title>
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	<script src="scripts/common.js" type="text/javascript"></script>
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>
	
	<link rel="stylesheet" href="scripts/MiniTree/css/miniui/miniui.css" type="text/css" media="all"/>
	<script src="scripts/MiniTree/boot.js" type="text/javascript"></script>
	<script src="scripts/MiniTree/core.js" type="text/javascript"></script>
	<script src="scripts/MiniTree/miniui.js" type="text/javascript" ></script>  
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	
	<script src="scripts/MiniTree/CommonLibs/TreeSelectWindow.js" type="text/javascript"></script>
	<script src="scripts/main.js" type="text/javascript"></script>
	
	<script language="javascript" src="${gmapurl}/gmap/res/js/tf-gmap.js"></script>
	
	<style type="">
		.mini-tree-leaf
		{
		    background-image:url(images/device/2.png);
		}
	</style>

<script  >	
	function cancle(){
		location.href="<%= basePath%>/DeviceAction?method=query";
	}
</script>
</head>
<body>

	<script>
		$(document).ready(function(){
				init();
		});
		
		 function onButtonEdit(e) {
            var win = new TreeSelectWindow();
            win.set({
            	canSelectAll: true,
                url:  "<%= basePath%>/DeviceAction?method=listTreeSelect",    
                title: "选择树形",
                width: 350,
                height: 350
            });
            
            win.show();

           //初始化数据
            win.setData(null, function (action) {
                if (action == "ok") {
                    //获取数据
                    var data = win.getTreeDate();
                    console.log(data);
                    if (data && data.length>0) {
                    	var node = data[0];
                    	$("input[name='deviceInfo.pid']").val(node.id);
                    	var pnode = win.tree.getParentNode(node);
                    	console.log("pnode="+pnode);
                    	var text = "";
                    	if(pnode.text != undefined )
                    		text += pnode.text;
                    	text += node.text;
                    	$("input[for='deviceInfo.pid']").val(text);
                    	document.getElementById("i_checkbox").checked = false;
                    }
                }
            });
        }
        
        function setTopPid(obj){
        	 var test = document.getElementById("i_checkbox").checked;
        	if(test==true)
        	{
        		$("input[name='deviceInfo.pid']").val(0);
        		$("input[for='deviceInfo.pid']").val("");
        	}
        }
        
        function init(){
    	
			//初始化地图并设置中心点和level
			var zoom = 13;
			var temp = "${deviceInfo.mapScaling}";
			if($.trim(temp)!=""){
				zoom = parseInt(temp);
			}
			
			initMap(new Coordinates(28.2282090000,112.9388140000), zoom);            //改变地图中心点的函数
			var lng = "${deviceInfo.longitude }";
			var lat = "${deviceInfo.latitude }";
			console.log("("+lng+","+lat+")");
			if(lng>0 && lat>0)
				changeCenter(new Coordinates(lat, lng));
			//地图上添加标记获取经纬度的函数，其中回调函数为移动图标后位置的经纬度
			queryMarkerCoordinates(function(position,zoom){
			//	alert(position.lat()+","+position.lng()+", zoom="+zoom);
				$("input[name='deviceInfo.longitude']").val(position.lng());//经度
				$("input[name='deviceInfo.latitude']").val(position.lat());//纬度
				$("input[name='deviceInfo.mapScaling']").val(zoom);//缩放比例
				//清楚标记函数
				//clearQueryMarker();
			});
		}
		
	</script>

	<div>
		<!-- 返回 -->
		<div class="menu-path">
			<a href="${goBackUrl }">
			<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
			 当前位置:&nbsp;系统管理 &gt; 设备添加与修改
		</div>
		
		
		<form action="<%= basePath%>/DeviceAction?method=save"   method="post" >
			<table id="table-data-outter" style="width:400px;">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title">
								<td colspan="2">
									设备添加与修改  
								
								<span style="margin-left:20px;color:#f00;">${msg}</span>
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">卡点名称:</td>
								<td width="30%" class="field-content">
									<input type="hidden" name="deviceInfo.id" value="${deviceInfo.id }"   /> 	
									<input type="text" name="deviceInfo.name" value="${deviceInfo.name }"   /> 	
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">上级节点:</td>
								<td width="30%" class="field-content">
									<input type="hidden" name="deviceInfo.pid"  value="${deviceInfo.pid}" />
									<input type="text"  for="deviceInfo.pid" value="${deviceInfo.pname}" disabled/> 
									<input style="width:30px;" type="button" class="button" value="..." onclick="onButtonEdit();"/>
									设为顶级节点  
									<input type="checkbox" id="i_checkbox" title="设为顶级节点" onclick="setTopPid(this)"/>
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">IP:</td>
								<td width="30%" class="field-content">
									<input type="text" name="deviceInfo.ip" value="${deviceInfo.ip }"   /> 	
									<span class=errorMessage >
										<s:property value="errors['deviceInfo.ip'][0]" /> 
									</span>
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">经度:</td>
								<td width="30%" class="field-content">
									<input type="text" name="deviceInfo.longitude" value="${deviceInfo.longitude }"  readonly /> 	
									<span class=errorMessage >
										<s:property value="errors['deviceInfo.longitude'][0]" /> 
									</span>
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">纬度:</td>
								<td width="30%" class="field-content">
									<input type="text" name="deviceInfo.latitude" value="${deviceInfo.latitude }"  readonly /> 	
									<span class=errorMessage >
										<s:property value="errors['deviceInfo.latitude'][0]" /> 
									</span>
								</td>
							</tr> 
							<tr>
								<td width="10%" class="field-title">缩放比例:</td>
								<td width="30%" class="field-content">
									<input type="text" name="deviceInfo.mapScaling" value="${deviceInfo.mapScaling }"  readonly /> 	
									<span class=errorMessage >
										<s:property value="errors['deviceInfo.mapScaling'][0]" /> 
									</span>
								</td>
							</tr>
							
							<tr>
								<td width="10%" class="field-title">是否启用:</td>
								<td width="30%" class="field-content">
									<select name="deviceInfo.status" >
										<option value="1" selected>启用</option>
										<option value="-1">禁用</option>
									</select>
									<script>
										$("select[name='deviceInfo.status']").val("${deviceInfo.status }");
									</script>
								</td>
							</tr>
							<tr >
								<td>&nbsp;</td>
								<td colspan="1">
									<br/>
									<input id="button"  type=submit value="提交" class="button"  />
									<input id="button" type="button" value="取消" class="button" />
								</td>
							</tr>
							<tr >
								<td colspan="2">
									注：
								</td>
							</tr>
						</table>
						
					</td>
				</tr>
			</table>		
		</form>
				<div id="mapCanvas" style="margin-top:10px;margin-left:400px;" >
		
				</div>
						
		</div>
	</body>
</html>