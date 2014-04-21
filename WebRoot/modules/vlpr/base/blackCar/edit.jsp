<!-- 
* @author : karl
* @creation : 2014-03-31 15:35:38
* @ModuleName : 黑车 
* @description : 
* 	黑车管理描述
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
	<title>添加/修改黑车信息</title>
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
	
	<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>
	
	
	<style type="">
		.mini-tree-leaf
		{
		    background-image:url(images/device/2.png);
		}
	</style>

<script  >	
	function cancle(){
		location.href="<%= basePath%>/BlackCarAction?method=query";
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
			 当前位置:&nbsp;黑车管理 &gt; 黑车信息添加与修改
		</div>
		
		<form action="<%= basePath%>/BlackCarAction?method=save&id=${blackCar.id}"   method="post" >
			<table id="table-data-outter" style="width:500px;">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title">
								<td colspan="2">
									黑车信息  添加与修改
								<span style="margin-left:20px;color:#f00;">${msg}</span>
								</td>
							</tr>
							
							<tr >
								<td width="10%" class="field-title">车牌:</td>
								<td >
									<input type="text" name="blackCar.plate" value="${blackCar.plate}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌类型:</td>
								<td >
									<input type="text" name="blackCar.plateType" value="${blackCar.plateType}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌颜色:</td>
								<td >
									<input type="text" name="blackCar.plateColor" value="${blackCar.plateColor}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色:</td>
								<td >
									<input type="text" name="blackCar.carColor" value="${blackCar.carColor}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色深浅:</td>
								<td >
									<input type="text" name="blackCar.carColorType" value="${blackCar.carColorType}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆类型:</td>
								<td >
									<input type="text" name="blackCar.carType" value="${blackCar.carType}" />(大中小) 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车标:</td>
								<td >
									<input type="text" name="blackCar.carLogo" value="${blackCar.carLogo}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">外形:</td>
								<td >
									<input type="text" name="blackCar.carShape" value="${blackCar.carShape}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车架号:</td>
								<td >
									<input type="text" name="blackCar.carFrameNum" value="${blackCar.carFrameNum}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车主:</td>
								<td >
									<input type="text" name="blackCar.owner" value="${blackCar.owner}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车主电话:</td>
								<td >
									<input type="text" name="blackCar.ownerPhone" value="${blackCar.ownerPhone}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">发动机号:</td>
								<td >
									<input type="text" name="blackCar.engineNum" value="${blackCar.engineNum}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">嫌疑车辆特征:</td>
								<td >
									<input type="text" name="blackCar.carFeature" value="${blackCar.carFeature}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆照片:</td>
								<td >
									<input type="text" name="blackCar.carImage" value="${blackCar.carImage}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">处理单位:</td>
								<td >
									<input type="text" name="blackCar.carIdea" value="${blackCar.carIdea}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控原因:</td>
								<td >
									<input type="text" name="blackCar.monitorReason" value="${blackCar.monitorReason}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控类别:</td>
								<td >
									<input type="text" name="blackCar.monitorType" value="${blackCar.monitorType}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控性质:</td>
								<td >
									<input type="text" name="blackCar.monitorQuality" value="${blackCar.monitorQuality}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控级别:</td>
								<td >
									<input type="text" name="blackCar.monitorLevel" value="${blackCar.monitorLevel}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控区域:</td>
								<td >
									<input type="text" name="blackCar.monitorArea" value="${blackCar.monitorArea}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控单位:</td>
								<td >
									<input type="text" name="blackCar.monitorUnit" value="${blackCar.monitorUnit}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">民警:</td>
								<td >
									<input type="text" name="blackCar.monitorPolice" value="${blackCar.monitorPolice}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">民警电话:</td>
								<td >
									<input type="text" name="blackCar.policePhone" value="${blackCar.policePhone}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控开始时间:</td>
								<td >
											<input type="text" name="blackCar.monitorStartOn" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
										value="<s:date name="blackCar.monitorStartOn" format="yyyy-MM-dd HH:mm:ss" />" class="Wdate"  />
											</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">布控结束时间:</td>
								<td >
											<input type="text" name="blackCar.monitorEndOn" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
										value="<s:date name="blackCar.monitorEndOn" format="yyyy-MM-dd HH:mm:ss" />" class="Wdate"  />
											</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">预案代码:</td>
								<td >
									<input type="text" name="blackCar.caseNum" value="${blackCar.caseNum}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">案情说明:</td>
								<td >
									<input type="text" name="blackCar.caseDescription" value="${blackCar.caseDescription}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">时间:</td>
								<td >
									<input type="text" value="<s:date name="blackCar.lastUpdate" format="yyyy-MM-dd HH:mm:ss" />"  disabled />
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">创建时间:</td>
								<td >
									<input type="text" value="<s:date name="blackCar.createdOn" format="yyyy-MM-dd HH:mm:ss" />"  disabled />
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">状态:</td>
								<td >
											<select name="blackCar.status" >
											<option value="1" selected>启用</option>
											<option value="-1">禁用</option>
										</select>
										<script>
											$("select[name='blackCar.status']").val("${blackCar.status }");
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