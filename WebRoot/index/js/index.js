


$(document).ready(function(){
	var action = $("input[name='action']").val();
	$(".nav li a[href='"+action+"']").parent().attr("class", "active");
});

var viewurl = "/modules/oa/article/view.jsp" ;
//lastest-news
function getLastestNews(){
	
	var url = "ArticleAction?m=getJson";
	$.get(url, function(list){
		console.log("获取最新动态");
		console.log(list);
		var sum = 0;
		var html="<div style=\"line-height:20px;\" >";
		for(var i=0; i<list.length; i++){
			sum++;
			if(sum>9)
				break;
			var ar = list[i];
			html +="<div title=\""+ ar.title +"\" class=\"nowrap-ellipsis\"  style=\"display:inline-block;width:280px;\" >"
			html += "<a href='ArticleAction?id="+ar.id+"&viewurl="+viewurl+"'> ";
			html += "["+parseInt(ar.ctTime.year+1900)+"-"+ar.ctTime.month+"-"+ar.ctTime.date+"] &nbsp;";
			html += ""+ ar.title +"";
			html += "</a><br>";
			html += "</div>";
		}
		html +="</div>";
		console.log( $("div[name='lastest-news'] > .panel-body").html() );
		$("div[name='lastest-news'] > .panel-body").html(html);
	},"json");
	
}

function getRegulation(){
	
	var url = "RegulationAction?m=getJson";
	$.get(url, function(list){
		console.log("获取行政规则制度");
		console.log(list);
		var sum = 0;
		var html="<div style=\"line-height:20px;\" >";
		for(var i=0; i<list.length; i++){
			sum++;
			if(sum>5)
				break;
			var ar = list[i];
			html +="<div title=\""+ ar.title +"\" class=\"nowrap-ellipsis\"  style=\"display:inline-block;width:300px;\" >"
			html += "<a href='RegulationAction?id="+ar.id+"&viewurl="+viewurl+"'> ";
			html += "["+parseInt(ar.ctTime.year+1900)+"-"+ar.ctTime.month+"-"+ar.ctTime.date+"] &nbsp;";
			html += ""+ ar.title +"";
			html += "</a><br>";
			html += "</div>";
		}
		html +="</div>";
		$("div[name='regulation-filed'] > .panel-body").html(html);
	},"json");
	
}


function getFinance(){
	
	
	var url = "FinanceAction?m=getJson";
	$.get(url, function(list){
		console.log("获取财务制度");
		console.log(list);
		var sum = 0;
		var html="<div style=\"line-height:20px;\" >";
		for(var i=0; i<list.length; i++){
			sum++;
			if(sum>5)
				break;
			var ar = list[i];
			html +="<div title=\""+ar.introduction+"\" class=\"nowrap-ellipsis\"  style=\"display:inline-block;width:300px;\" >"
			html += "<a href='FinanceAction?id="+ar.id+"&viewurl="+viewurl+"'> ";
			html += "["+parseInt(ar.ctTime.year+1900)+"-"+ar.ctTime.month+"-"+ar.ctTime.date+"] &nbsp;&nbsp;";
			html += ""+ ar.title +"";
			html += "</a><br>";
			html += "</div>";
		}
		
		html +="</div>";
		$("div[name='finance-filed'] > .panel-body").html(html);
	},"json");
	
}




