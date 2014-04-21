<!-- 
* @author : karl
* @creation : 2014-03-31 15:35:38
* @ModuleName : 黑车 
* @description : 
* 	黑车管理描述
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
    
    <title>黑车信息查看</title>
    
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
		当前位置:&nbsp;黑车管理 &gt; 黑车信息查看
	</div>
	
	<div id="con" style="width:80%;">
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title"><td colspan="2"> 
								<span class=errorMessage style="margin-left:20px;" >${msg}</span>
								</td>
							</tr>
								
							<tr >
								<td width="10%" class="field-title">车牌:</td>
								<td >
									${blackCar.plate}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌类型:</td>
								<td >
									${blackCar.plateType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌颜色:</td>
								<td >
									${blackCar.plateColor}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色:</td>
								<td >
									${blackCar.carColor}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色深浅:</td>
								<td >
									${blackCar.carColorType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆类型:</td>
								<td >
									${blackCar.carType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车标:</td>
								<td >
									${blackCar.carLogo}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">外形:</td>
								<td >
									${blackCar.carShape}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车架号:</td>
								<td >
									${blackCar.carFrameNum}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车主:</td>
								<td >
									${blackCar.owner}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车主电话:</td>
								<td >
									${blackCar.ownerPhone}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">发动机号:</td>
								<td >
									${blackCar.engineNum}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">嫌疑车辆特征:</td>
								<td >
									${blackCar.carFeature}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆照片:</td>
								<td >
									${blackCar.carImage}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">处理单位:</td>
								<td >
									${blackCar.carIdea}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控原因:</td>
								<td >
									${blackCar.monitorReason}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控类别:</td>
								<td >
									${blackCar.monitorType}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控性质:</td>
								<td >
									${blackCar.monitorQuality}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控级别:</td>
								<td >
									${blackCar.monitorLevel}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控区域:</td>
								<td >
									${blackCar.monitorArea}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控单位:</td>
								<td >
									${blackCar.monitorUnit}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">民警:</td>
								<td >
									${blackCar.monitorPolice}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">民警电话:</td>
								<td >
									${blackCar.policePhone}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控开始时间:</td>
								<td >
									${blackCar.monitorStartOn}
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控结束时间:</td>
								<td >
									${blackCar.monitorEndOn }
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">预案代码:</td>
								<td >
									${blackCar.caseNum}
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">案情说明:</td>
								<td >
									${blackCar.caseDescription}
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">时间:</td>
								<td >
									${blackCar.lastUpdate }
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">创建时间:</td>
								<td >
									${blackCar.createdOn }
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">状态:</td>
								<td >
									${blackCar.status}
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
