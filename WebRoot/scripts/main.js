function test(){
	alert('试用到期 www.miniui.com');
}

function getPercentHtml(percent){
	var html ="";
	html += "<div class=progerssbar style=\"margin-left:20px;\">";
	html += "<div class=\"progressbar-value-ui\" style=\"width:"+percent+"%;\"></div>";
	html += "<span class=\"progress-value\" >"+percent+"%</span>";
	html += "</div>";
	return html;
}
function formatJsonDate(date){
	return (date.year+1900)+"-"+(date.month+1)+"-"+date.date;
}
function formatJsonDateTime(date){
	return (date.year+1900)+"-"+(date.month+1)+"-"+date.date + " "+ date.hours+":"+date.minutes+":"+date.seconds;
}

var WinAlerts = window.alert;
window.alert = function (e) 
{
	if (e != null && typeof(e)=="string" && (e.indexOf("试用到期")>-1 || e.indexOf("www.miniui.com")>-1) )
	{
		//和谐了
		WinAlerts("miniui被和谐了,嘿嘿!"+e);
	}
	else
	{
		WinAlerts (e);
	}
	
};   

function search_do(content,keyWord){
	var keyWordArr = keyWord.replace(/[\s]+/g,' ').split(' ');
	var re;
	for(var n = 0; n < keyWordArr.length; n ++) {
		//re = new RegExp(">[\s\S]*?"+keyWordArr[n]+"[\s\S]*?<\S","gmi");
		re = new RegExp(""+keyWordArr[n]+"","gmi");
		content = content.replace(re,'<span style="color:#0f0;background-color:#">'+keyWordArr[n]+'</span>');
	}
	return content;
}
