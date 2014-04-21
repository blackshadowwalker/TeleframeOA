<!-- 
* @author : karl
* @creation : 2014-03-31 15:30:07
* @ModuleName : 外省车辆 
* @description : 
* 	外省车辆管理描述
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
	<title>添加/修改外省车辆信息</title>
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
		location.href="<%= basePath%>/CarExtAction?method=query";
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
			 当前位置:&nbsp;外省车辆管理 &gt; 外省车辆信息添加与修改
		</div>
		
		<form action="<%= basePath%>/CarExtAction?method=save&id=${carExt.id}"   method="post" >
			<table id="table-data-outter" style="width:500px;">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title">
								<td colspan="2">
									外省车辆信息  添加与修改
								<span style="margin-left:20px;color:#f00;">${msg}</span>
								</td>
							</tr>
							
							<tr >
								<td width="10%" class="field-title">车牌:</td>
								<td >
									<input type="text" name="carExt.plate" value="${carExt.plate}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌类型:</td>
								<td >
									<input type="text" name="carExt.plateType" value="${carExt.plateType}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车牌颜色:</td>
								<td >
									<input type="text" name="carExt.plateColor" value="${carExt.plateColor}" /> 	
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色:</td>
								<td >
									<input type="text" name="carExt.carColor" value="${carExt.carColor}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆颜色深浅:</td>
								<td >
									<input type="text" name="carExt.carColorType" value="${carExt.carColorType}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车辆类型:</td>
								<td >
									<input type="text" name="carExt.carType" value="${carExt.carType}" />(大中小) 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车标:</td>
								<td >
									<input type="text" name="carExt.carLogo" value="${carExt.carLogo}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">外形:</td>
								<td >
									<input type="text" name="carExt.carShape" value="${carExt.carShape}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车架号:</td>
								<td >
									<input type="text" name="carExt.carFrameNum" value="${carExt.carFrameNum}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车主:</td>
								<td >
									<input type="text" name="carExt.owner" value="${carExt.owner}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">车主电话:</td>
								<td >
									<input type="text" name="carExt.ownerPhone" value="${carExt.ownerPhone}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">发动机号:</td>
								<td >
									<input type="text" name="carExt.engineNum" value="${carExt.engineNum}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">维护警员编号:</td>
								<td >
									<input type="text" value="${carExt.userCode}" disabled/> 	
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">维护警员姓名:</td>
								<td >
									<input type="text" value="${carExt.userName}" disabled /> 	
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">IP:</td>
								<td >
									<input type="text" value="${carExt.ip}" disabled /> 	
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">时间:</td>
								<td >
									<s:date name="carExt.lastUpdate" format="yyyy-MM-dd HH:mm:ss" />
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">创建时间:</td>
								<td >
									<s:date name="carExt.createdOn" format="yyyy-MM-dd HH:mm:ss" />
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">状态:</td>
								<td >
											<select name="carExt.status" >
											<option value="1" selected>启用</option>
											<option value="-1">禁用</option>
										</select>
										<script>
											$("select[name='carExt.status']").val("${carExt.status }");
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