<%@ page language="java" import="java.util.*"   pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 	<base href="<%=basePath%>/" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>设备信息列表</title>
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	
	<link rel="stylesheet" href="scripts/jquery/jquery-ui/css/drop-down-list/jquery-ui.css" type="text/css" media="all"/>
	
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	
	<link rel="stylesheet" href="scripts/MiniTree/css/miniui/miniui.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="scripts/MiniTree/css/miniui/demo.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="scripts/MiniTree/css/miniui/icons.css" type="text/css" media="all"/>
	<script src="scripts/MiniTree/boot.js" type="text/javascript"></script>
	<script src="scripts/MiniTree/core.js" type="text/javascript"></script>
	<script src="scripts/MiniTree/miniui.js" type="text/javascript" ></script>  
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	<script src="scripts/MiniTree/pagertree/pagertree.js" type="text/javascript"></script>
	<script src="scripts/MiniTree/CommonLibs/TreeSelectWindow.js" type="text/javascript"></script>
	
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>

	<style type="">
		a.opeate img{
			margin-left:15px;
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
	<form action="DeviceAction?" method="post" >
	<table id="table-data-outter">
	 <tr><td>
		<table id="table-data-inner" cellspacing="0">
			<tr id="tr-menu-path">
				<td colspan="2" nowrap="nowrap">
					<fieldset id="f-menu-path">当前位置:&nbsp; 系统管理 &gt;  设备管理</fieldset>
					<fieldset id="f-condition-display">
						<img src="images/main/display_on.gif" onclick="displayCondition(this,'tr-menu-path')" 
							align="bottom" width="17" height="15" alt="隐藏查询条件" />
					</fieldset>
				</td>
			</tr>
			<tr>
				<td >
					<span style="display:none;">
					设备名称：
						<input type="text" name="deviceInfo.name" value="" /> 
    	                <input  type="submit" value="查询" class="button"  />  
                    </span>
        
                    <label >设备名称：</label>
        				  <input id="key" class="mini-textbox" style="width:150px;" onenter="onKeyEnter"/>
          					<a  >
								<input  type="button" value="查询" class="button" onclick="search();" />                    
          					</a>    
                    <a href="DeviceAction?method=beforeAdd">
						<input  type="button" value="添加根分组" class="button" />                    
                    </a>
				</td>
			</tr> 
		</table>
	  </td></tr>
	</table>
	  </form>	

	<div id="treegrid1" class="mini-treegrid " style="width:95%;height:600px;"     
	   url="<%=basePath %>/DeviceAction?method=listTree&deviceInfo.name=${deviceInfo.name}"
	    ondrawcell="onDrawCell" showTreeIcon="true"  
	    treeColumn="name" idField="id" parentField="pid" resultAsTree="false"
	    allowResize="true" expandOnLoad="true" allowCellEdit="false" allowCellSelect="false"
	    allowDrag="true" allowDrop="true" allowLeafDropIn="true" 
	    >
	    
	    <div property="columns">
	        <div  field="id" width="30">ID</div>
		    <div name="name" field="name" width="200">卡点名称
		        <input property="editor" class="mini-textbox" style="width:100%;"  /> 
		    </div> 
		    <div  field="pid" width="0">上级id
	        	<input property="editor" class="mini-textbox" style="width:100%;"  /> 
	    	</div> 
	    	 <div name="" field="ip" width="60">IP
	        	<input property="editor" class="mini-textbox" style="width:100%;"  /> 
	    	</div> 
	    	 <div name="" field="longitude" width="60">经度
	        	<input property="editor" class="mini-textbox" style="width:100%;"  /> 
	    	</div> 
	    	 <div name="" field="latitude" width="60">纬度
	        	<input property="editor" class="mini-textbox" style="width:100%;"  /> 
	    	</div> 
		    <div field="lastUpdateString" width="100" dateFormat="yyyy-MM-dd">最后修改日期
		        <input property="editor" class="mini-datepicker" style="width:100%;" />
		    </div>
		    <div name="" field="status" width="60">状态
	        	<input property="editor" class="mini-textbox" style="width:100%;"  /> 
	    	</div>
	         <div field="operator" width="100" >操作
	         </div>        
	    </div>
	    
	</div>
	
	<script type="text/javascript">
        mini.parse();
       var tree = mini.get("treegrid1");

		$(document).ready(function(){
			
			setTimeout(function(){
				var WinAlerts = window.alert;
				window.alert = function (e) 
				{
				//	WinAlerts("嘿嘿,和谐内容:"+e);
					if (e != null && typeof(e)=="string" && (e.indexOf("试用到期")>-1 || e.indexOf("www.miniui.com")) )
					{
						//和谐了
						WinAlerts("和谐了miniui@device,嘿嘿!");
					}
					else
					{
						WinAlerts (e);
					}
					
				};   
				//alert("seted alert");
			}, 200);
		});
        function search() {
            var key = mini.get("key").getValue();
            if (key == "") {
                tree.clearFilter();
            } else {
                key = key.toLowerCase();                
                tree.filter(function (node) {
                	console.log(node.name);
                    var text = node.name ? node.name.toLowerCase() : "";
                    if (text.indexOf(key) != -1) {
                        return true;
                    }
                });
            }
        }
        function onKeyEnter(e) {
            search();
        }

        function onDrawCell(e){
            var node = e.node,
                column = e.column,
                field = e.field,
                value = e.value;

            //超链接任务
            if (field == "operator") {
                e.cellHtml = "<s:if test="#request.i>=0"><a class=opeate href=\"<%= basePath%>/DeviceAction?method=beforeAdd&pid="+node.id+"&pname="+ node.name+"\" >"+
                				"<img src=\"images/button/addnew.gif\" title=\"添加\" style=\"cursor:pointer \"></img></a></s:if> "+
                			"<s:if test="#request.u>=0"><a class=opeate href=\"DeviceAction?method=beforeUpdate&id="+node.id+ "\">"+
                				"<img src=\"images/button/pen.png\" title=\"修改\" border=0 style=\"cursor:pointer\"></img></a></s:if>"+
                			" <s:if test="#request.d>=0"><a class=opeate href=\"javascript:del("+ node.id +")\">"+
                				"<img src=\"images/button/delete.png\" title=\"删除\" style=\"cursor:pointer \"></img></a></s:if>";
            }
            //格式化日期
            if (field == "lastUpdateString") {
                if (mini.isDate(value)) 
                	e.cellHtml = mini.formatDate(value, "yyyy年MM月dd日");
             }
             
             if(field == "status"){
             	if(value==1)
	             	e.cellHtml = "启用";
	             else
	             	e.cellHtml = "禁用";
           	}
        };
        
        function del(id){
        	console.log(id);
			if(confirm("确定删除吗？")){
				location.href="<%= basePath%>/DeviceAction?method=delete&id="+id;
			}
		}
		
	
    </script>
    
    
</body>

</html>