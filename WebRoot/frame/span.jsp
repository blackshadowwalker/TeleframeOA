<%@ page language="java" contentType="text/html;charset=utf8" isErrorPage="false"%>

<HTML>

<%
    String thisPath=request.getContextPath();
%>
 

<style>
	#pagespan
	{
	    width: 10px;
	    height: 100%;
	    background-image: url(images/mid2.gif);
	    border: #ACA899 solid 0px;
	}
	
	#pagespantext
	{
	    color: blue;
	    cursor: hand;
	    height: 100px;
	    padding-top:40px;
	    background-color: #ECE9D8;
	    font-family: Webdings;
	    font-size: 8px;
	}

</style>
<SCRIPT>
function switchSysBar()
{
    if (pagespantext.innerText==7)
    {
        pagespantext.innerText=8;
        pagespantext.title="打开左栏";
        window.parent.parent.frames["second"].cols="0,10,*";
    }
    else
    {
        pagespantext.innerText=7;
        pagespantext.title="关闭左栏";
        window.parent.parent.frames["second"].cols="180,10,*";
    }
}
</SCRIPT>

<HEAD>
  <title>spanPAGE</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <SCRIPT src="<%=thisPath %>/scripts/jquery/jquery-1.7.min.js" type=text/javascript></SCRIPT>
</HEAD>

<body>

  <table id="pagespan" border=0 cellSpacing=0 cellPadding=0>
    <tr>
       <td onclick=switchSysBar()>
         <DIV id="pagespantext" title="关闭左栏">7</DIV>    
       </td>
    </tr>
  </table>


</body>

</HTML>
