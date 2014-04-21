<!-- 
* @author : karl
* @creation : 2014-03-31 14:47:16
* @ModuleName : 告警配置 
* @description : 
* 	告警配置管理描述
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
	<title>添加/修改告警配置信息</title>
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
		location.href="<%= basePath%>/AlarmConfigAction?method=query";
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
			 当前位置:&nbsp;告警配置管理 &gt; 告警配置信息添加与修改
		</div>
		
		<form action="<%= basePath%>/AlarmConfigAction?method=save&id=${alarmConfig.id}"   method="post" >
			<table id="table-data-outter" style="width:500px;">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title">
								<td colspan="2">
									告警配置信息  添加与修改
								<span style="margin-left:20px;color:#f00;">${msg}</span>
								</td>
							</tr>
							
							<tr >
								<td width="10%" class="field-title">告警代码:</td>
								<td >
									<input type="text" name="alarmConfig.alertCode" value="${alarmConfig.alertCode}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">告警名称:</td>
								<td >
									<input type="text" name="alarmConfig.alertName" value="${alarmConfig.alertName}" /> 	
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">告警声音:</td>
								<td >
									<input type="hidden" name="alarmConfig.wavUrl" value="${alarmConfig.wavUrl}" style="width:200px;"/>
									<span id="player_span" > </span> <br />
									<span for="alarmConfig.wavUrl" ></span><br/>
									<script>
										var object="";
										if(document.all){
											object = "<embed id=player src=\"${alarmConfig.wavUrl}\"  ";
											object += "console=LonelyStreet controls=ControlPanel autostart=true ></embed> "; 
										}else{
											object = "<audio id=player controls=controls src=\"${alarmConfig.wavUrl}\" >";
											object += "<source /> </audio>";
										}
										document.getElementById("player_span").innerHTML = object;
																			
									</script>
									
									<input type="button" class="button" onClick="chooserWav();" alt="选择本地声音" value="选择本地声音"/>
									
									<input type="button" class="button" onClick="chooserWavList();" alt="选择网络声音" value="选择网络声音"/>
									 	
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">状态:</td>
								<td >
									<tr>
									<td width="10%" class="field-title">是否启用:</td>
									<td width="30%" class="field-content">
										<select name="alarmConfig.status" >
											<option value="1" selected>启用</option>
											<option value="-1">禁用</option>
										</select>
										<script>
											$("select[name='alarmConfig.status']").val("${alarmConfig.status }");
										</script>
									</td>
								</tr>
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
		
		
		
	<div style="display:none;">
		<form action="UploadAction?callback=callback"  method="post" ENCTYPE="multipart/form-data" target="hidden_frame" >
			<input type=file name=file onchange="uploadFile(this);" />
			<input type="text" name="dir"  value="sys/wav" /><br>
		</form>
		<iframe name="hidden_frame"></iframe>
		<!-- play music on background -->
		<EMBED id="embedMusic" SRC="" autostart=true hidden=true loop=false />
	</div>	
		
		
	<script type="text/javascript">
	
		function playMusic(url){
			$("#embedMusic").attr("src", url);
		}
  		
  		function uploadFile(obj){
  			$(obj).parent().submit();
  		}
  		
  		function callback(json){
			if(json.error==0){
				if(json.data.length>=1)
				{
					$("input[name='alarmConfig.wavUrl']").val(json.data[0].path);
					$("img[for='alarmConfig.wavUrl']").attr("src",json.data[0].path);
					$("#player").attr("src",json.data[0].path);
					$("span[for='alarmConfig.wavUrl']").html(json.data[0].fileName);
				}
			}
		}
  		
  		function chooserWav(){
  			$("input[name=file]").click();
  		}
  		
  </script>
		
		
		
		
	</body>
</html>