<!-- 
* @author : karl
* @creation : 2014-03-31 14:47:16
* @ModuleName : 告警配置 
* @description : 
* 	告警配置管理描述
*
-->

<%@ page language="java" import="java.util.*"   pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 	<base href="<%=basePath%>/" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>告警配置信息</title>
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	
	<link rel="stylesheet" href="scripts/jquery/jquery-ui/css/drop-down-list/jquery-ui.css" type="text/css" media="all"/>
	
	<link rel="stylesheet" href="scripts/MiniTree/css/miniui/miniui.css" type="text/css" media="all"/>
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	
	<script src="scripts/MiniTree/core.js" type="text/javascript"></script>
	<script src="scripts/MiniTree/miniui.js" type="text/javascript" ></script>  
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>

	<style type="">
		a.operate{
			text-decoration:none;
		}
		a.operate img{
			margin-left:10px;
		}
		td. title-header {
			cursor:pointer;
		}
		.mini-tree-leaf
		{
		    background-image:url(images/device/2.png);
		}
	</style>

	<script language="javascript">

	var msg="${msg}";
	if(msg!="null" && msg!="")
		alert(msg);

	</script>
	
</head>
<body>
		
			
		<div id="list_div">
			<table id="table-view" cellpadding="0" cellspacing="1" style="width:1100px;">
				<tr class="row-header">
					<td width="20" style="display:none;">ID</td>
					
					<td ondblclick="return sortQuery('resultCar.plate')" class="title-header" style="width:80px;" > 车牌 </td>  
					<td ondblclick="return sortQuery('resultCar.confidence')" class="title-header" style="width:40px;" > 可信度 </td>  
					<td ondblclick="return sortQuery('resultCar.plateType')" class="title-header" style="width:120px;" > 车牌类型 </td>  
					<td ondblclick="return sortQuery('resultCar.plateColor')" class="title-header" style="width:120px;" > 车牌颜色 </td>  
					<td ondblclick="return sortQuery('resultCar.carColor')" class="title-header" style="width:120px;" > 车辆颜色 </td>  
					<td ondblclick="return sortQuery('resultCar.carLogo')" class="title-header" style="width:80px;" > 车标 </td>  
					<td ondblclick="return sortQuery('resultCar.carTime')" class="title-header" style="width:50px;" > 抓拍时间 </td>  
					<td ondblclick="return sortQuery('resultCar.deviceId')" class="title-header" style="width:120px;" > 设备 </td>  
					<td ondblclick="return sortQuery('resultCar.userName')" class="title-header" style="width:100px;" > 上传警员姓名 </td>  
					<td ondblclick="return sortQuery('resultCar.status')" class="title-header" style="width:40px;" > 状态 </td>  

                    <td colspan="1" align="center" style="width:120px;" >操作</td> 
                </tr>
				<s:iterator id="l" value="list" status="index">
					<s:if test='#index.odd == true'>
						<s:set name="var_class" value="'row-odd'" />
					</s:if>
					<s:else>
						<s:set name="var_class" value="'row-even'" />
					</s:else>

					<tr class="<s:property value='var_class' />"
						onmouseover="this.className='row-over'"
						onmouseout="this.className='<s:property value='var_class' />'">
						<td align="center" style="display:none;">
							<s:property value="#l.id" />
						</td>
							<td align="center">
							<s:property value="#l.plate" />
						</td>
								<td align="center">
							<s:property value="#l.confidence" />
						</td>
								<td align="center">
							<s:property value="#l.plateType" />
						</td>
								<td align="center">
							<s:property value="#l.plateColor" />
						</td>
								<td align="center">
							<s:property value="#l.carColor" />
						</td>
								<td align="center">
							<s:property value="#l.carLogo" />
						</td>
						<td align="center" >
							<span class="nowrap-ellipsis" style="width:120px;" >
								<s:date name="#l.carTime" format="yyyy-MM-dd HH:mm:ss" />
							</span>
						</td>
						<td align="center"  >
							<span class="nowrap-ellipsis" style="width:120px;" title="<s:property value="#l.deviceId" />" >
								<s:property value="#l.deviceId" />
							</span>
						</td>
						<td align="center">
							<s:property value="#l.userName" />
						</td>
						</td>
								<td align="center">
							<s:property value="#l.resultTypeName" />
						</td>
							
						<td align="center" style="width:120px;">
							
								<s:if test="#request.v>=0">
									<a class=operate href="${action}?method=view&id=<s:property value='#l.id' />">
										<img src="images/button/doc.gif" title="详情" style="cursor:pointer "></img>
									</a>
								</s:if>
								
						</td>
					</tr>
				</s:iterator>

			</table>
		</div> <!-- end of #list_div -->

		

<!-- booter script -->
	<script>
	
		$(document).ready(function(){
			
			setTimeout(function(){

			}, 200);
			
			
		});
		
	
	</script>
	
	</body>

</html>