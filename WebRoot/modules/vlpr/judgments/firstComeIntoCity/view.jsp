<!-- 
* @author : karl
* @creation : 2014-03-31 16:00:15
* @ModuleName : 首次入城车辆查询 
* @description : 
* 	首次入城车辆查询描述
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
    
    <title>首次入城车辆查询信息查看</title>
    
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

  </head>
  
  <body>
  
  <!-- 返回 -->
	<div class="menu-path">
		<a href="${action}?">
		<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
		当前位置:&nbsp;车辆查询管理 &gt; 首次入城车辆信息查看
	</div>
	
	<div id="con" style="width:100%;">
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1" style="width:300px;">
							<tr id="tr-title">
								<td colspan="2"> 
									<span class=errorMessage style="margin-left:20px;" >${msg}</span>
								</td>
									
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌:</td>
								<td >
									${resultCar.plate}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">可信度:</td>
								<td >
									${resultCar.confidence}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌类型:</td>
								<td >
									${resultCar.plateType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌颜色:</td>
								<td >
									${resultCar.plateColor}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色:</td>
								<td >
									${resultCar.carColor}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色深浅:</td>
								<td >
									${resultCar.carColorType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆类型:</td>
								<td >
									${resultCar.carType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车标:</td>
								<td >
									${resultCar.carLogo}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">速度:</td>
								<td >
									${resultCar.speed}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">抓拍绝对时间:</td>
								<td >
									<s:date name="resultCar.carTime" format="yyyy-MM-dd hh:mm:ss" />
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">方向(上下左右):</td>
								<td >
									${resultCar.direction}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">是否违规:</td>
								<td >
									${resultCar.carIllegal}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">违规原因:</td>
								<td >
									${resultCar.illegalReason}
									</td>
							</tr>
						
							<tr >
								<td width="10%" class="field-title">image md5:</td>
								<td >
									${resultCar.md5}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">image sha1:</td>
								<td >
									${resultCar.sha1}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">设备id:</td>
								<td >
									${resultCar.deviceId}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">设备位置全路径:</td>
								<td >
									${resultCar.devicePath}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">上传警员id:</td>
								<td >
									${resultCar.userId}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">上传警员编号:</td>
								<td >
									${resultCar.userCode}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">上传警员姓名:</td>
								<td >
									${resultCar.userName}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">IP:</td>
								<td >
									${resultCar.ip}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">时间:</td>
								<td >
									${resultCar.lastUpdate }
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">状态:</td>
								<td >
									${resultCar.status}
									</td>
							</tr>
							
						</table>		
					</td>
					<td>
						<img src="/ftp${resultCar.carImage}"  style="height:600px;"/>
					</td>
				</tr>
			</table>
		</div>
  
  
  </body>
</html>
