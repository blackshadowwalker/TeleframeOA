<!-- 
* @author : karl
* @creation : 2014-03-31 16:00:15
* @ModuleName : 车辆查询 
* @description : 
* 	车辆查询描述
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
	<title>套牌车辆查询信息</title>
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
	
	<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>
	
	<script src="scripts/MiniTree/CommonLibs/TreeSelectWindow.js" type="text/javascript"></script>
	<script src="scripts/main.js" type="text/javascript"></script>

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
		.titlelabel{
			border:0px #f00 solid;
			width:80px;
			display:inline-block;
			text-align:right;
		}
		.ConditionFiled  input{
			width:120px;
		}
		.ConditionFiled select{
			width:124px;
		}
	</style>

	<script language="javascript">

		var msg="${msg}";
		if(msg!="null" && msg!="")
		alert(msg);
		
		 function ChooseDevice(e) {
            var win = new TreeSelectWindow();
            win.set({
                multiSelect: false,
  //             checkRecursive: true,    
   				showFolderCheckBox : true,       
                url:  "<%= basePath%>/DeviceAction?method=listTreeSelect",    
                title: "选择设备",
                width: 350,
                height: 350
            });
            
            win.show();

            //初始化数据
            win.setData(null, function (action) {
                if (action == "ok") {
                    //获取数据
                    var data = win.getTreeDate();
                    console.log(data);
                    if (data && data.length>0) {
                    	var node = data[0];
                    	$("input[name='resultCar.deviceId']").val(node.id);
                    	var pnode = win.tree.getParentNode(node);
                    	console.log(pnode);
                    	var text = "";
                    	if(pnode.text != undefined )
                    		text += pnode.text;
                    	text += node.text;
                    	$("input[name='resultCar.devicePath']").val(text);
                    }
                }
            });
        }

	</script>
	
</head>
<body>

		<form action="${action}?&page.pageSize=${page.pageSize}" method="post" id="mainForm" >
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path">
								<td colspan="2" nowrap="nowrap">
									<fieldset id="f-menu-path">
										当前位置:&nbsp;车辆查询管理 &gt; 套牌车辆查询信息查询
									</fieldset>
									<fieldset id="f-condition-display">
										<img src="images/main/display_on.gif"
											onclick="displayCondition(this,'tr-menu-path')"
											align="bottom" width="17" height="15" alt="隐藏查询条件" />
									</fieldset>
								</td>
							</tr>
							<tr>
								<td>
								<!-- 查询条件  -->
								
				<div class="ConditionFiled">
					<span class=titlelabel >车牌:</span> 
						<input type="text" name="resultCar.plate"  value="${resultCar.plate }" />
					<span class=titlelabel>车牌颜色:</span> 
						<input type="text" name="resultCar.plateColor"  value="${resultCar.plateColor }" />
					<span class=titlelabel>车标:</span> 
						<input type="text" name="resultCar.carLogo"  value="${resultCar.carLogo }" />
					
					<span class=titlelabel>终端设备:</span>
						 <input type="hidden" name="resultCar.deviceId"  value="${resultCar.deviceId }" />
						 <input type="text" name="resultCar.devicePath"  value="${resultCar.devicePath }"
						 		onclick="ChooseDevice(this);" readonly  />
					
						<input type="submit" value="查询" class="button" />
					
					<br />
					<span class=titlelabel>车辆颜色:</span>
						 <input type="text" name="resultCar.carColor"  value="${resultCar.carColor }" />
						
					<span class=titlelabel>起始时间:</span> 
						<input type="text" name="resultCar.carTimeStart" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH'})" 
									value="${resultCar.carTimeStart }" class="Wdate"  style="width:122px;" />
					<span class=titlelabel>结束时间:</span> 
						<input type="text" name="resultCar.carTimeEnd" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH'})" 
									value="${resultCar.carTimeEnd }" class="Wdate"  style="width:122px;"/>
				
					<span class=titlelabel>套牌车辆:</span> 
					<select name="resultCar.resultType" >
						<option value="-1">...</option>
						<option value="1">黑车车辆</option>
						<option value="2">本地套牌</option>
						<option value="3">外地套牌</option>
						<option value="4">疑似套牌</option>
					</select>
				
									<input type="button" value="重置" class="button" onclick="ResetForm()" />
									<script>
										$("select[name='resultCar.resultType']").val(${resultCar.resultType});
										
										function ResetForm(){
											$("input[name='resultCar.plate']").val("");
											$("input[name='resultCar.plateColor']").val("");
											$("input[name='resultCar.carColor']").val("");
											$("input[name='resultCar.carLogo']").val("");
											$("input[name='resultCar.userCode']").val("");
											$("input[name='resultCar.userName']").val("");
											$("input[name='resultCar.carTimeEnd']").val("");
											$("input[name='resultCar.carTimeStart']").val("");
											$("select[name='resultCar.resultType']").val(0);
											//$("#mainForm").submit();
										}
									</script>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<span style="float:right;display:none;">
										<s:if test="#request.i>=0">
											<a href="${action}?method=beforeAdd" >
												<input type="button" value="添加" class="button" />
											</a>
										</s:if>
									</span>
					</div>
										
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
		
			
		<div id="list_div">
			<table id="table-view" cellpadding="0" cellspacing="1" style="width:1100px;"  >
				<tr class="row-header">
					<td width="20" class="hidden" >ID</td>
					
					<td ondblclick="return sortQuery('resultCar.plate')" class="title-header" style="width:80px;" > 车牌 </td>  
					<td ondblclick="return sortQuery('resultCar.confidence')" class="title-header" style="width:40px;" > 可信度 </td>  
					<td ondblclick="return sortQuery('resultCar.plateType')" class="title-header" style="width:120px;" > 车牌类型 </td>  
					<td ondblclick="return sortQuery('resultCar.plateColor')" class="title-header" style="width:80px;" > 车牌颜色 </td>  
					<td ondblclick="return sortQuery('resultCar.carColor')" class="title-header" style="width:80px;" > 车辆颜色 </td>  
					<td ondblclick="return sortQuery('resultCar.carLogo')" class="title-header" style="width:80px;" > 车标 </td>  
					<td ondblclick="return sortQuery('resultCar.carTime')" class="title-header" style="width:150px;" > 抓拍时间 </td>  
					<td ondblclick="return sortQuery('resultCar.deviceId')" class="title-header" style="width:320px;" > 设备 </td>  
					<td ondblclick="return sortQuery('resultCar.status')" class="title-header" style="width:120px;" > 状态 </td>  

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
						<td align="center" class="hidden" >
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
						<td align="center">
							<s:date name="#l.carTime" format="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td align="center">
							<s:property value="#l.devicePath" />
						</td>
								<td align="center">
							<s:property value="#l.resultTypeName" />
						</td>
							
						<td align="center" style="width:120px;">
							
							<span style="display:block;" >
								<s:if test="#request.u>=0">
									<a class=operate href="${action}?method=beforeUpdate&id=<s:property value='#l.id' />">
									<img src="images/button/pen.png" title="修改" border="0" style="cursor: pointer"></img>
									</a>
								</s:if>
								<s:if test="#request.d>=0">
									<a class=operate onclick="javaScript:del(<s:property value='#l.id' />);">
									<img src="images/button/delete.png" title="删除" style="cursor: pointer"></img>
									</a>
								</s:if>
								<s:if test="#request.v>=0">
									<a class=operate href="${action}?method=view&id=<s:property value='#l.id' />">
										<img src="images/button/doc.gif" title="详情" style="cursor:pointer "></img>
									</a>
								</s:if>
							</span>
						</td>
					</tr>
				</s:iterator>

			</table>
		</div> <!-- end of #list_div -->

		
		<div name="page-div" style="font-size: 13px font-family : '宋体'" align="center">
			
				共&nbsp; ${page.totalRow} &nbsp;条记录,
				共&nbsp; ${page.totalPage} &nbsp;页,
				
				&nbsp;&nbsp;
				<a class="submit"  href="${action}?page.currentPage=1&page.pageSize=${page.pageSize}" style="text-decoration:none;">
					<img src="images/page/PaginStart.gif"	border="0" />
				</a>
				&nbsp;&nbsp;
				<s:if test="page.hasPrePage==true">
					<a class="submit" href="${action}?page.currentPage=${page.prePage}&page.pageSize=${page.pageSize}" style="text-decoration:none;" 	>
						<img src="images/page/PaginLeft.gif" border="0" />
					</a>
				</s:if>
				<s:else>
					<img src="images/page/PaginLeftInactive.gif" border="0" title="已是第一页"/>
				</s:else>
				&nbsp;&nbsp;
				第:
				<select name="page.currentPage" onchange="changePage()" >
					 <script>
						for(var i=1; i<=${page.totalPage}; i++)
						{
							if(i==${page.currentPage})
								document.write("<option value='"+i+"' selected >"+i+"</option>");
							else
								document.write("<option value='"+i+"' >"+i+"</option>");
						}
					 </script>
				</select>
				页
				&nbsp;&nbsp;
				<s:if test="page.hasNextPage==true">
					<a class="submit" href="${action}?page.currentPage=${page.nextPage}&page.pageSize=${page.pageSize}"  style="text-decoration:none;">
						<img src="images/page/PaginRight.gif" border="0" />
					</a>
				</s:if>
				<s:else>
					<img src="images/page/PaginRightInactive.gif" border="0" title="已到达最后一页" />
				</s:else>
				&nbsp;&nbsp;
				<a class="submit" href="${action}?page.currentPage=${page.totalPage}&page.pageSize=${page.pageSize}"  style="text-decoration:none;">
					<img src="images/page/PaginEnd.gif" border="0" />
				</a> 
				
				每页显示
				<select name="page.pageSize" onchange="ResetSelect();changePage();" >
					<option value="5" >5</option>				
					<option value="10" >10</option>				
					<option value="15" >15</option>				
					<option value="20" >20</option>				
					<option value="50" >50</option>				
					<option value="100" >100</option>				
				</select>
				<script>
					$("select[name='page.pageSize']").val("${page.pageSize}");
				</script>
				条记录&nbsp;

		</div>
	
		<script>
		
		
			// down for page actions
			function ResetSelect(){
				$("select[name='page.currentPage']").val('1')
			}
			function changePage(){
				var curPage = $("select[name='page.currentPage']").val();
				var pageSize = $("select[name='page.pageSize']").val();
				var url = "${action}?page.currentPage="+curPage+"&page.pageSize="+pageSize;
				$("#mainForm").attr("action", url);
				$("#mainForm").submit();
			}
		
			$(document).ready(function(){
				$("a[class='submit']").click(function (event)
				{
				    event.preventDefault();
				});
				
				$("a[class='submit']").bind("click", function(){
					var url = $(this).attr("href");
					$("#mainForm").attr("action", url);
					$("#mainForm").submit();
				});
			});

		</script>


<!-- booter script -->
	<script>
	
		 function del(id){
        	console.log(id);
			if(confirm("确定删除吗？")){
				location.href="<%= basePath%>/${action}?method=delete&id="+id;
			}
		}
		
		$(document).ready(function(){
			
			
		});
		
	
	</script>
	
	</body>

</html>