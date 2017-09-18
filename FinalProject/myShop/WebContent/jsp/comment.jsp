<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Comments</title>
<link href="${pageContext.request.contextPath}/css/slider.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/xheditor/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/xheditor/xheditor-1.2.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/xheditor/xheditor_lang/zh-cn.js"></script>
<body>
	<div class="container header">
		<%@ include file="menu.jsp"%>
	</div>
	<div class="container index">

		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
			<c:if test="${user == null }">
			    <div class="title" style="text-align:center;color:#666666;font-size:30px ;width:950px;background:transparent">
					Please Log In !
					<!-- <a  target="_blank"></a> -->
				</div>	
			</c:if>				
			</div>
			<c:if test="${user != null }">
			  <form action="${pageContext.request.contextPath }/addComment" method="post">
			       <textarea  name="cvalue" class="xheditor" style="width:950px;height:300px"></textarea>
			       <input type="submit" value="submit" style="width:200px;height:32px;margin:5px auto;float:right"/>
			  </form>		
			</c:if>		
		</div>
	</div>
	
	<div class="container footer">
		<div class="span24">
			<div class="copyright"> web design by huizhe wang || 001614841 || 6220 Final Project</div>
		</div>
	</div>
</body>
</html>