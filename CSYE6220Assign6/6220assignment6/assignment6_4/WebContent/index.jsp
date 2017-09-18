<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script type="text/javascript">
		function add() {
			var title = "index_RSS";
			var link = document.getElementById("URL").value;
			$.ajax({
				url : encodeURI(encodeURI('/assignment6_4/rss/add?title='
						+ title + '&link=' + link)),
				type : 'get',
				cache : false,
				success : function(data) {
					if (data == "wang") {
						window.location.href = "/assignment6_4/rss/index";
					} else {

						alert("Operate database error!");
					}
				},
				error : function() {
					alert("Server busy, try later!");
				}
			});
}
</script>
<script type="text/javascript">  
$(document).ready(function () {  
    $("#display").click(function () {  
        $("#content").html('');  
        var url=document.getElementById("URL").value;
        console.log(url);
        var yql = 'http://query.yahooapis.com/v1/public/yql?q=' + 
        		encodeURIComponent('select * from xml where url="' + url + '"') 
        		+ '&format=json&callback=?';
        $.getJSON(yql, function (data) {
        	//console.log(data);
        	var result = eval(data);
        	$("#content").html("<div>"+result.query.results.rss.channel.item[0].title+"<br>"+
        			"<a href='"+result.query.results.rss.channel.item[0].link+"'>Link: "
        			+result.query.results.rss.channel.item[0].link+"</a></div>"
        			+"<br>"
        			+"<div>"+result.query.results.rss.channel.item[1].title+"<br>"+
        			"<a href='"+result.query.results.rss.channel.item[1].link+"'>Link: "
        			+result.query.results.rss.channel.item[0].link+"</a></div>"
        			+"<br>"
        			+"<div>"+result.query.results.rss.channel.item[2].title+"<br>"+
        			"<a href='"+result.query.results.rss.channel.item[2].link+"'>Link: "
        			+result.query.results.rss.channel.item[0].link+"</a></div>"
        			+"<br>"
        			+"<div>"+result.query.results.rss.channel.item[3].title+"<br>"+
        			"<a href='"+result.query.results.rss.channel.item[3].link+"'>Link: "
        			+result.query.results.rss.channel.item[0].link+"</a></div>"
        			+"<br>"
        			+"<div>"+result.query.results.rss.channel.item[4].title+"<br>"+
        			"<a href='"+result.query.results.rss.channel.item[4].link+"'>Link: "
        			+result.query.results.rss.channel.item[0].link+"</a></div>");
        });
    });  
});  
</script>
<!-- <script type="text/javascript">
function showHint(str)
{
var xmlhttp;
if (str.length==0)
  { 
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","/ajax/gethint.asp?q="+str,true);
xmlhttp.send();
}
</script> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index RSS</title>
</head>
<body bgcolor=FFF0F5>
	<div align="center">
	<h1>Feed URL</h1>
	    <input type="text" size="25" id="URL" name="URL" /> 
    	<input type="button" value="Add Subscribe" onclick="add()"> 
<!-- 			<p><span id="txtHint"></span></p>   -->
  	    <input type="button" id="display" value="Show Contents" /> 
	</div>
	<br>
	<div id="content"
		style="width: 700px; height: 500px; overflow: auto; position: fixed; left: 50%; margin-left: -200px; align: left; "></div>


</body>
</html>