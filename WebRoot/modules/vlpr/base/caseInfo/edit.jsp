<!-- 
* @author : karl
* @creation : 2014-03-31 15:46:37
* @ModuleName : 案件 
* @description : 
* 	描述
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
	<title>添加/修改案件信息</title>
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
		location.href="<%= basePath%>/CaseInfoAction?method=query";
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
			 当前位置:&nbsp;案件管理 &gt; 案件信息添加与修改
		</div>
		
		<form action="<%= basePath%>/CaseInfoAction?method=save&id=${caseInfo.id}"   method="post" >
			<table id="table-data-outter" style="width:500px;">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title">
								<td colspan="2">
									案件信息  添加与修改
								<span style="margin-left:20px;color:#f00;">${msg}</span>
								</td>
							</tr>
							
							<tr >
								<td width="10%" class="field-title">案件代码:</td>
								<td >
									<input type="text" name="caseInfo.caseCode" value="${caseInfo.caseCode}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">案件名称:</td>
								<td >
									<input type="text" name="caseInfo.caseName" value="${caseInfo.caseName}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">案件描述:</td>
								<td >
									<input type="text" name="caseInfo.description" value="${caseInfo.description}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">状态:</td>
								<td >
											<select name="caseInfo.status" >
											<option value="1" selected>启用</option>
											<option value="-1">禁用</option>
										</select>
										<script>
											$("select[name='caseInfo.status']").val("${caseInfo.status }");
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