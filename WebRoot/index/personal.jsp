<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1";/><!-- IE的渲染模式 -->
    
    <title> <s:property value="#application.config.title" /> </title>
    
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="bootstrap/3/css/bootstrap.css" rel="stylesheet"/>
	<link href="index/css/justified-nav.css" rel="stylesheet">
	<link href="index/css/style.css" rel="stylesheet" >

	<script src="scripts/jquery/jquery-1.7.min.js"></script>
	<script src="bootstrap/3/js/bootstrap.min.js"></script>
	<link href="bootstrap/3/css/datepicker.css" rel="stylesheet"/>
	<script src="bootstrap/3/js/bootstrap-datepicker.js"></script>
	
	<script src="index/js/index.js" type="text/javascript"></script>
	
	<style>
	</style>
	
  </head>
  
  <body>
   
	<div class="" >
	
		
      <div class="pagetop">
      	 	<%@ include file="top.jsp" %>
      </div>

      <div class="nav container"  style="width:1000px;">
       	 <%@ include file="nav.jsp" %>
      </div>
      
      <div class="container" style="margin-top:10px;padding-left:0px;width:1000px;">
	   
	   	 <div class="panel panel-info">
		   	  <div class="panel-heading">
		   	  		<center> 个人信息 </center>
		   	  </div>
		   	   <div class="panel-body">
		   	   		<div class="container" style="width:400px;">
		   	   			<form action="UserAction?method=personal&save=true" method="post"  >
							<div  style="width:400px;">
								<table id="tableforpersonal"  cellspacing="0" class="1" style="border-top:0px;" >
									<tr >
										<td width="15%" class="text-right"></td>
										<td colspan="1">
											<span class=errorMessage style="margin-left:20px;" >${msg}</span>
										</td>
									</tr>
									<tr >
										<td width="15%" class="text-right">个人头像:</td>
										<td >
											<input type="hidden" class="img-thumbnail" name="userInfo.userPhoto" value="${userInfo.userPhoto}" style="width:200px;"/>
											<img src="${userInfo.userPhoto }" for="userInfo.userPhoto" alt="用户头像"   class="img-thumbnail"
												style="width:120px;height:130px;cursor:pointer;" onClick="chooserPhoto();"/>
												
											<input type="button" class="btn btn-info btn-sm" onClick="chooserPhoto();" alt="选择头像" value="..."/>
										</td>
									</tr>
									<tr>
										<td width="10%" class="text-right">帐号:</td>
										<td width="30%" class="field-content">
											<input type="text" class="form-control"  value="${userInfo.userCode }"  disabled />
										</td>
									</tr>
									<tr>
										<td width="10%" class="text-right"><span class="requied" >*</span>用户名:</td>
										<td width="30%" class="field-content">
											<input type="text" class="form-control" name="userInfo.userName" id="inputError"  value="${userInfo.userName }"  />
											
											<span class="errorMessage" >
												<s:property value="errors['userInfo.userName'][0]" /> 
											</span>
										</td>
									</tr>
									<tr>
										<td width="10%" class="text-right"><span class="requied" >*</span>密码:</td>
										<td width="30%" class="field-content">
											<input type="password" class="form-control"  name="userInfo.userPasswd" value="" />
											<span class=errorMessage >
												<s:property value="errors['userInfo.userPasswd'][0]" /> 
											</span>
										</td>
									</tr>
									<tr>
										<td width="10%" class="text-right">生日:  </td>
										<td width="30%" class="field-content">
										
											<div class="input-group bootstrap-datepicker  form-control" data-date-format="yyyy-mm-dd" for="userInfo.userBirthString" >
												<input class="form-control"  name="userInfo.userBirthString"  type="text"  
													value="<s:date name="userInfo.userBirth" format="yyyy-MM-dd" />" readonly="">
											  	<span class="input-group-addon ">
													<span class="glyphicon glyphicon-calendar"></span> 
												</span>
											</div>
										
										</td>
									</tr>
									<tr>
										<td width="10%" class="text-right">角色:</td>
										<td width="30%" class="field-content">
											
											<input type="text" class="form-control"  value="${userInfo.userRoleName }" disabled/>
										</td>
									</tr>
									<tr>
										<td width="10%" class="text-right">部门:</td>
										<td width="30%" class="field-content">
											<input type="text" class="form-control"  value="${userInfo.userDepartmentName }" disabled/>
											
										</td>
									</tr>
									<tr>
										<td width="10%" class="text-right"></td>
										<td colspan="1" >
											<br/>
											<input type="button" class="btn btn-success" value="修改" onclick="sub(this);" />
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="button" class="btn btn-success" value="取消" onclick="javascript:history.back();" />
										</td>
									</tr>
								</table>		
							</div>
						</form>
					</div>
		   	   </div>
		</div>
		
		
		<div class="booter container" style="width:1000px;">
	   		<%@ include file="booter.jsp" %>
	   </div>
	   
		
		<div style="display:none;">
			<form action="UploadAction?callback=callback"  method="post" ENCTYPE="multipart/form-data" target="hidden_frame" >
				<input type=file name=file onchange="uploadPhoto(this);" />
				<input type="text" name="dir"  value="user/photos" /><br>
			</form>
			<iframe name="hidden_frame"></iframe>
		</div>
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title">系统提示</h4>
		      </div>
		      <div class="modal-body">
		        <p>One fine body&hellip;</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" name="IDOK">确定</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		
	</div>
  </div>	
 			       
 
		
	  <script type="text/javascript">
			
			$(".bootstrap-datepicker").datepicker({ 
				format: 'yyyy-mm-dd'
			}).on('changeDate', function(ev){
					console.log( $(this).data('date'));
					$( "input[name='"+$(this).attr("for")+"']" ).val( $(this).data('date') );
				//	$('#startDate').text($.data('date'));
					/*
					if (ev.date.valueOf() > endDate.valueOf()){
						$('#alert').show().find('strong').text('The start date can not be greater then the end date');
					} else {
						$('#alert').hide();
						startDate = new Date(ev.date);
						$('#startDate').text($('#dp4').data('date'));
					}
					*/
			});
	  
	  		$("#userRole").val("${userInfo.userRole}");
	  		$("#userDept").val("${userInfo.userDepartment}");
	  		
	  		function myalert(str){
	  			$("#myModal .modal-body").html("<font color=red> "+str+" </font>");
	  			$('#myModal').modal('toggle');
	  		}
	  		
	  		function sub(obj){
	  			var form = $(obj).parents().filter("form");
	  			console.log( form.attr("action") );
	  			var table = $(obj).parents().filter("table");
	  			console.log( table.attr("id") );
	  			
	  			var item= table.find("input[name='userInfo.userName']");
	  			if($.trim(item.val())==""){
	  				item.focus();
	  			//	item.css("border","1px #f00 solid");
	  				myalert("用户名不能为空");
	  				return ;
	  			}
	  			
	  			var item= table.find("input[name='userInfo.userPasswd']");
	  			var pw = $.trim(item.val());
	  			if( pw.length>0 && pw.length<6){
	  				item.focus();
	  			//	item.css("border","1px #f00 solid");
	  				myalert("密码至少6位");
	  				return ;
	  			}
	  			$("#myModal button[name='IDOK']").click( function() {
	  				form.submit();
			 		//$('#myModal').modal('toggle');
				});
	  			myalert("确定修改吗？");
	  			
		//		if(confirm("确定修改吗？"))
			//		document.forms[0].submit();
			}
	  		
	  		var error = "${error}";
	  		if(error=="1")
	  		{
	  			window.parent.leftFrame.location.reload();
	  			window.parent.topFrame.location.reload();
	  		}	
	  		
	  		function uploadPhoto(obj){
	  			$(obj).parent().submit();
	  		}
	  		
	  		function callback(json){
				if(json.error==0){
					if(json.data.length>=1)
					{
						$("input[name='userInfo.userPhoto']").val(json.data[0].path);
						$("img[for='userInfo.userPhoto']").attr("src",json.data[0].path);
					}
				}
			}
	  		
	  		function chooserPhoto(){
	  			$("input[name=file]").click();
	  		}
	  		
	  </script>


  </body>
</html>


