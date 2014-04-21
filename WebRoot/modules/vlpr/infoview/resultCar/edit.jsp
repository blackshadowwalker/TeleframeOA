<!-- 
* @author : karl
* @creation : 2014-03-31 16:00:15
* @ModuleName : 车辆查询 
* @description : 
* 	车辆查询描述
*
-->

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
	<title>添加/修改车辆查询信息</title>
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
	
	<style type="">
		.mini-tree-leaf
		{
		    background-image:url(images/device/2.png);
		}
	</style>

<script  >	
	function cancle(){
		location.href="<%= basePath%>/ResultCarAction?method=query";
	}
</script>
</head>
<body>

	<script>
		$(document).ready(function(){
		
		
		});
		
		 function onButtonEdit(e) {
            var buttonEdit = e.sender;
            
            var win = new TreeSelectWindow();
            win.set({
     //           multiSelect: true,
    //            showFolderCheckBox: true,
   //             checkRecursive: true,                
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
                    var data = win.getData();
                    if (data) {
                        buttonEdit.setValue(data.id);
                        buttonEdit.setText(data.text);

                    }
                }
            });
        }
	</script>

	<div>
		<!-- 返回 -->
		<div class="menu-path">
			<a href="${action}?">
			<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
			 当前位置:&nbsp;车辆查询管理 &gt; 车辆查询信息添加与修改
		</div>
		
		<form action="<%= basePath%>/ResultCarAction?method=save&id=${resultCar.id}"   method="post" >
			<table id="table-data-outter" style="width:500px;">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title">
								<td colspan="2">
									车辆查询信息  添加与修改
								<span style="margin-left:20px;color:#f00;">${msg}</span>
								</td>
							</tr>
							
							<tr >
								<td width="10%" class="field-title">车牌:</td>
								<td >
									<input type="text" name="resultCar.plate" value="${resultCar.plate}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">可信度:</td>
								<td >
									<input type="text" name="resultCar.confidence" value="${resultCar.confidence}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌类型:</td>
								<td >
									<input type="text" name="resultCar.plateType" value="${resultCar.plateType}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌颜色:</td>
								<td >
									<input type="text" name="resultCar.plateColor" value="${resultCar.plateColor}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色:</td>
								<td >
									<input type="text" name="resultCar.carColor" value="${resultCar.carColor}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色深浅:</td>
								<td >
									<input type="text" name="resultCar.carColorType" value="${resultCar.carColorType}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆类型:</td>
								<td >
									<input type="text" name="resultCar.carType" value="${resultCar.carType}" />(大中小) 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车标:</td>
								<td >
									<input type="text" name="resultCar.carLogo" value="${resultCar.carLogo}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">速度:</td>
								<td >
									<input type="text" name="resultCar.speed" value="${resultCar.speed}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">抓拍绝对时间:</td>
								<td >
											<input type="text" name="resultCar.carTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
										value="<s:date name="resultCar.carTime" format="yyyy-MM-dd HH:mm:ss" />" class="Wdate"  />
											</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">方向(上下左右):</td>
								<td >
									<input type="text" name="resultCar.direction" value="${resultCar.direction}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">是否违规:</td>
								<td >
									<input type="text" name="resultCar.carIllegal" value="${resultCar.carIllegal}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">违规原因:</td>
								<td >
									<input type="text" name="resultCar.illegalReason" value="${resultCar.illegalReason}" />((闯红灯等)) 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">抓拍图片:</td>
								<td >
									<input type="text" name="resultCar.carImage" value="${resultCar.carImage}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">MD5:</td>
								<td >
									<input type="text" name="resultCar.md5" value="${resultCar.md5}" readonly/> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">SHA1:</td>
								<td >
									<input type="text" name="resultCar.sha1" value="${resultCar.sha1}" readonly/> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">设备id:</td>
								<td >
									<input type="text" name="resultCar.deviceId" value="${resultCar.deviceId}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">设备位置全路径:</td>
								<td >
									<input type="text" name="resultCar.devicePath" value="${resultCar.devicePath}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">上传警员id:</td>
								<td >
									<input type="text" name="resultCar.userId" value="${resultCar.userId}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">上传警员编号:</td>
								<td >
									<input type="text" name="resultCar.userCode" value="${resultCar.userCode}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">上传警员姓名:</td>
								<td >
									<input type="text" name="resultCar.userName" value="${resultCar.userName}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">IP:</td>
								<td >
									<input type="text" name="resultCar.ip" value="${resultCar.ip}" readonly/> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">时间:</td>
								<td >
											<s:date name="resultCar.lastUpdate" format="yyyy-MM-dd HH:mm:ss" />
											</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">状态:</td>
								<td >
											<select name="resultCar.status" >
											<option value="1" selected>启用</option>
											<option value="-1">禁用</option>
										</select>
										<script>
											$("select[name='resultCar.status']").val("${resultCar.status }");
										</script>
									</td>
							</tr>

							<tr >
								<td>&nbsp;</td>
								<td colspan="1">
									<input id="button"  type=submit value="保存" class="button"  />
									<input id="button" type="button" value="取消" class="button" />
								</td>
							</tr>
						</table>
						
					</td>
				</tr>
			</table>		
		</form>
		</div>
	</body>
</html>