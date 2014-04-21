<!-- 
* @author : karl
* @creation : 2014-03-31 15:00:15
* @ModuleName : 本省车辆 
* @description : 
* 	车辆管理描述
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
    
    <title>本省车辆信息查看</title>
    
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
		当前位置:&nbsp;本省车辆管理 &gt; 本省车辆信息查看
	</div>
	
	<div id="con" style="width:600px;">
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title">
								<td colspan="2"> 
									<span class=errorMessage style="margin-left:20px;" >${msg}</span>
								</td>
							</tr>
								
							<tr >
								<td width="200px" class="field-title">车牌:</td>
								<td >
									${carLocal.plate}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">属性:</td>
								<td >
									${carLocal.property}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌类型:</td>
								<td >
									${carLocal.plateType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌颜色:</td>
								<td >
									${carLocal.plateColor}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色:</td>
								<td >
									${carLocal.carColor}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色深浅:</td>
								<td >
									${carLocal.carColorType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆类型 大中小:</td>
								<td >
									${carLocal.carType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车标:</td>
								<td >
									${carLocal.carLogo}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">外形:</td>
								<td >
									${carLocal.carShape}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车架号:</td>
								<td >
									${carLocal.carFrameNum}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车主:</td>
								<td >
									${carLocal.owner}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车主电话:</td>
								<td >
									${carLocal.ownerPhone}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">发动机号:</td>
								<td >
									${carLocal.engineNum}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">维护警员编号:</td>
								<td >
									${carLocal.userCode}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">维护警员姓名:</td>
								<td >
									${carLocal.userName}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">IP:</td>
								<td >
									${carLocal.ip}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">时间:</td>
								<td >
									${carLocal.lastUpdate}
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">创建时间:</td>
								<td >
									${carLocal.createdOn }
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">状态</td>
								<td >
									${carLocal.status}
									</td>
							</tr>
							
							<tr>
								<td colspan="2" >
								</td>
							</tr>
						</table>		
					</td>
				</tr>
			</table>
		</div>
  
  
  </body>
</html>
