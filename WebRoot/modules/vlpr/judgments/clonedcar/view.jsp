<!-- 
* @author : karl
* @creation : 2014-03-31 16:00:15
* @ModuleName : 车辆查询 
* @description : 
* 	车辆查询描述
*
-->

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>套牌车辆查询信息查看</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="scripts/Tree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="scripts/Tree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	<script src="scripts/Tree/jquery.ztree.core-3.5.js" type="text/javascript" ></script>
	<script src="scripts/Tree/jquery.ztree.excheck-3.5.js" type="text/javascript" ></script>
	
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	<script src="scripts/common.js" type="text/javascript"></script>
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>
	<script type="text/javascript" src="scripts/prompt/ymPrompt.js"></script>
	<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>
	
	<style>
		td img{
			width:500px;
		}
	</style>

  </head>
  
  <body>
  
  <!-- 返回 -->
	<div class="menu-path">
		<a href="${action}?">
		<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
		当前位置:&nbsp;车辆查询管理 &gt;套牌车辆查询信息查看
	</div>
	
	<div  style="width:800px;">
			<table  style="width:800px;">
				<tr style="width:800px;">
					<td style="width:50%;">
						<table id="table-data-inner" cellspacing="1" style="width:100px;">
							<tr id="tr-title">
								<td colspan="2"> 
									<span class=errorMessage style="margin-left:20px;" >${msg}</span>
								</td>
									
							</tr>
							<tr >
								<td colspan=2 class="field-title">
									<a href="/ftp/${car1.carImage}" target="_blank">
										<img src="/ftp/${car1.carImage}"  />
									</a>
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌:</td>
								<td >
									${car1.plate}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌类型:</td>
								<td >
									${car1.plateType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌颜色:</td>
								<td >
									${car1.plateColor}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色:</td>
								<td >
									${car1.carColor}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色深浅:</td>
								<td >
									${car1.carColorType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆类型:</td>
								<td >
									${car1.carType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车标:</td>
								<td >
									${car1.carLogo}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">抓拍绝对时间:</td>
								<td >
									<s:date name="car1.carTime" format="yyyy-MM-dd hh:mm:ss" />
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">设备位置全路径:</td>
								<td >
									${car1.devicePath}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">时间:</td>
								<td >
									${car1.lastUpdate }
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">状态:</td>
								<td >
									${car1.status}
									</td>
							</tr>
							
						</table>		
					</td>
					<td style="width:50%;">
						<table id="table-data-inner" cellspacing="1" style="width:300px;">
							<tr id="tr-title">
								<td colspan="2"> 
									<span class=errorMessage style="margin-left:20px;" >${msg}</span>
								</td>
									
							</tr>
							<tr >
								<td colspan=2 class="field-title">
									<a href="/ftp/${car2.carImage}" target="_blank">
										<img src="/ftp/${car2.carImage}"  />
									</a>
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌:</td>
								<td >
									${car2.plate}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌类型:</td>
								<td >
									${car2.plateType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌颜色:</td>
								<td >
									${car2.plateColor}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色:</td>
								<td >
									${car2.carColor}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色深浅:</td>
								<td >
									${car2.carColorType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆类型:</td>
								<td >
									${car2.carType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车标:</td>
								<td >
									${car2.carLogo}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">抓拍绝对时间:</td>
								<td >
									<s:date name="car2.carTime" format="yyyy-MM-dd hh:mm:ss" />
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">设备位置全路径:</td>
								<td >
									${car2.devicePath}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">时间:</td>
								<td >
									${car2.lastUpdate }
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">状态:</td>
								<td >
									${car2.status}
									</td>
							</tr>
							
						</table>		
					</td>
				</tr>
			</table>
		</div>
  
  
  </body>
</html>
