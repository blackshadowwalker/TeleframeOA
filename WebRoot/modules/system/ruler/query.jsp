<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>菜单查询</title>
    <base href="<%=basePath%>/">
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	<script src="scripts/common.js" type="text/javascript"></script>
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>
	
	<link rel="stylesheet" href="scripts/MiniTree/css/miniui/miniui.css" type="text/css" media="all"/>
	<script src="scripts/MiniTree/miniui.js" type="text/javascript" ></script>  
	
	<link rel="stylesheet" type="text/css" href="scripts/prompt/skin/qq/ymPrompt.css" /> 
	<script type="text/javascript" src="scripts/prompt/ymPrompt.js"></script>
	
	<style type="">
		a.opeate img{
			margin-left:15px;
		}
	</style>
	
	<script type="text/javascript">
	//	ymPrompt.alert("参数");
	//	ymPrompt.confirmInfo("参数");
	
		var msg = "${msg}";
		if(msg!="")
			alert(msg);
	
		function query(id,val,text){
			if(val==text){
				document.getElementById(id).value="";
				document.getElementById(id).style.color="black";
			}
		}
		function query0(id,val,text){
			if(val==""||val==text){
				document.getElementById(id).value=text;
				document.getElementById(id).style.color="#999999";
			}
		}
		function add(){
			location.href="<%= basePath%>/RulerAction?method=beforeAdd";
		}
		
		function upd(id){
			location.href="<%= basePath%>/RulerAction?method=beforeUpdate&rulerInfo.rulerid="+id;
		}
		function del(id){
			if(confirm("确定删除吗？"))
				location.href="<%= basePath%>/RulerAction?method=delete&rulerInfo.rulerid="+id;
		}
	</script>
  </head>
  
  <body>
  	
	<div >
		<form method="post" action="<%= basePath%>/RulerAction?method=query">
			<table id="table-data-outter" >
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path">
								<td colspan="3" nowrap="nowrap">
									<fieldset id="f-menu-path">
											
											<span class="locationLable">当前位置:&nbsp;系统管理 &gt; 菜单管理</span>
									
									</fieldset>
									<fieldset id="f-condition-display">
										<img src="images/main/display_on.gif" onclick="displayCondition(this,'tr-menu-path')" 
											align="bottom" width="17" height="15" alt="隐藏查询条件" />
									</fieldset>
								</td>
								
							</tr>
							<tr>
								<td>
								菜单名称：
									<input type="text" name="rulerInfo.rulerName" id="rulerName" value="" />
									<input  type="submit" value="查询" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
									onmouseout="this.className='btns_mouseout'" />                              

									&nbsp;&nbsp;&nbsp;&nbsp;
									<span style="color:#f00">${msg }</span>
								</td>
								<td align="right">
									<s:property value='#request.insert'/>
									<s:if test="#request.i>=0">
										<input id="button1"  type="button" value="添加" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'" onclick="add();"/>
									</s:if>
								</td>									
							</tr>
						</table>
						<div id="div-button" align="center">
						</div>
						<div id="div-message" style="width:100%;height:100%;"></div>
						
					
							<div id="treegrid1" class="mini-treegrid" style="width:95%;height:500px;"     
							   url="<%=basePath %>/RulerAction?method=listTree" ondrawcell="onDrawCell" showTreeIcon="true"  
							    treeColumn="rulerName" idField="rulerid" parentField="manager" resultAsTree="false"
							    allowResize="true" expandOnLoad="true" allowCellEdit="false" allowCellSelect="true"
							     >
							    
							    <div property="columns">
							        <div name="rulerid" field="rulerid" width="30">ID</div>
							        <div name="rulerName" field="rulerName" width="150">菜单名称
							        	
							    	</div> 
							    	<div name="" field="level" width="60">菜单级别
							        	<input property="editor" class="mini-textbox" style="width:100%;"  /> 
							    	</div> 
							    	<div name="" field="url" width="200">URL
							        	<input property="editor" class="mini-textbox" style="width:100%;"  /> 
							    	</div> 
							    	<div name="" field="target" width="100">target
							        	<input property="editor" class="mini-textbox" style="width:100%;"  /> 
							    	</div> 
							    	<div name="manager" field="manager" width="0">上级部门
							        	<input property="editor" class="mini-textbox" style="width:100%;"  /> 
							    	</div> 
							    	<div name="" field="echo" width="60">是否显示
							        	<input property="editor" class="mini-textbox" style="width:100%;"  /> 
							    	</div> 
							    	<div name="" field="sortorder" width="50">排序
							        	<input property="editor" class="mini-textbox" style="width:100%;"  /> 
							    	</div> 
							    	<div name="" field="lastUpdateString" width="100">最后修改日期
							    	</div> 
							    	
						         	<div field="operator" headerAlign="center" width="130" >
						         		操作
							     	</div>   
							    </div>
							</div>


					</td>
				</tr>
			</table>		
		</form>
	</div>
	
	<br />
	
	<script type="text/javascript">
        mini.parse();
        var tree = mini.get("treegrid1");

	function onDrawCell(e){
            var node = e.node,
                column = e.column,
                field = e.field,
                value = e.value;

            //超链接任务 <%= basePath%>
            if (field == "operator") {
               e.cellHtml = "<s:if test="#request.i>=0">"+
               					"<a class=opeate href=\"RulerAction?method=beforeAdd&pid="+node.rulerid+"&pname="+node.rulerName+"\" >"+
                				"<img src=\"images/button/addnew.gif\" title=\"添加\" style=\"cursor:pointer \"></img></a></s:if>"+
                			"<s:if test="#request.u>=0">"+
                				"<a class=opeate href=\"RulerAction?method=beforeUpdate&id="+node.rulerid+"\" >"+
                				"<img src=\"images/button/pen.png\" title=\"修改\" border=\"0\" style=\"cursor:pointer \"></img></a></s:if>"+
                			"<s:if test="#request.d>=0">"+
                				"<a class=opeate href=\"RulerAction?method=delete&id="+node.rulerid+"\" >"+
                				"<img src=\"images/button/delete.png\" title=\"删除\" style=\"cursor:pointer \"></img></a></s:if>";
            }
            //格式化日期
            else if (field == "lastUpdateString") {
                if (mini.isDate(value)) 
                	e.cellHtml = mini.formatDate(value, "yyyy年MM月dd日");
                	
                	
            }else if (field=="echo"){
            	if(value==0)
            		e.cellHtml = "不显示";
            	else
            		e.cellHtml = "显示";
            	  
            }else
            	e.cellHtml = "<span>"+value+"</span>";
            
        };
	
    </script>
	
	
	
  </body>
</html>
