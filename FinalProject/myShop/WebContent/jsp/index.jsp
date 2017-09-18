<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>myShop</title>
<link href="${pageContext.request.contextPath}/css/slider.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container header">
		<%@ include file="menu.jsp"%>
	</div>
    <div class="serach" style="text-align:center;padding:10px 0px;width:948px;height:auto;margin:0 auto;border:1px solid #ccc;background:#666666">
          <form action="${pageContext.request.contextPath }/searchProduct" method="get">
	             <input type="text" name="search" class="sear" />
	            <input type="submit" value="search"/>
            </form>
    </div>
	<div class="container index">

		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
				
				<div class="title">
					<strong class="nav active" index="0">Best Sales</strong>
					<strong class="nav" index="1">New Arrival</strong>
					<strong class="nav" index="2">Sales</strong>
					<!-- <a  target="_blank"></a> -->
				</div>
				<ul class="tab">
					<li class="current"><a href="#" target="_blank"></a></li>
					<li><a target="_blank"></a></li>
					<li><a target="_blank"></a></li>
				</ul>
				<!-- Hot -->
				<ul id="hotTab-content" class="tabContent carousel-content active">

					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${hList['9'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${hList['9'].image }"/>"
							style="display: block;" alt="${hList['9'].pname}"/>
						</a>
						<div class="product-alt">
							${hList['9'].pname}
						</div>
					</li>
					<c:forEach var="p" items="${hList}">
						<li>
							<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${p.pid}"/>"
							target="_blank"> 
								<img src="${pageContext.request.contextPath}/<c:out value="${p.image }"/>"
								style="display: block;" alt="${p.pname}"/>
							</a>
							<div class="product-alt">
								${p.pname}
							</div>
						</li>
					</c:forEach>
					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${hList['0'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${hList['0'].image }"/>"
							style="display: block;" alt="${hList['0'].pname}"/>
						</a>
						<div class="product-alt">
							${hList['0'].pname}
						</div>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${hList['1'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${hList['1'].image }"/>"
							style="display: block;" alt="${hList['1'].pname}"/>
						</a>
						<div class="product-alt">
							${hList['1'].pname}
						</div>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${hList['2'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${hList['2'].image }"/>"
							style="display: block;" alt="${hList['2'].pname}"/>
						</a>
						<div class="product-alt">
							${hList['2'].pname}
						</div>
					</li>
				</ul>
				<!-- New -->
				<ul id="newTab-content" class="tabContent carousel-content ">

					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${nList['9'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${nList['9'].image }"/>"
							style="display: block;" alt="${nList['9'].pname}"/>
						</a>
						<div class="product-alt">
							${nList['9'].pname}
						</div>
					</li>
					<c:forEach var="p" items="${nList}">
						<li>
							<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${p.pid}"/>"
							target="_blank"> 
								<img src="${pageContext.request.contextPath}/<c:out value="${p.image }"/>"
								style="display: block;" alt="${p.pname}"/>
							</a>
							<div class="product-alt">
								${p.pname}
							</div>
						</li>
					</c:forEach>
					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${nList['0'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${nList['0'].image }"/>"
							style="display: block;" alt="${nList['0'].pname}"/>
						</a>
						<div class="product-alt">
							${nList['0'].pname}
						</div>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${nList['1'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${nList['1'].image }"/>"
							style="display: block;" alt="${nList['1'].pname}"/>
						</a>
						<div class="product-alt">
							${nList['1'].pname}
						</div>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${nList['2'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${nList['2'].image }"/>"
							style="display: block;" alt="${nList['2'].pname}"/>
						</a>
						<div class="product-alt">
							${nList['2'].pname}
						</div>
					</li>
				</ul>
				<!-- Low Price -->
				<ul id="speTab-content" class="tabContent carousel-content">

					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${lList['9'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${lList['9'].image }"/>"
							style="display: block;" alt="${lList['9'].pname}"/>
						</a>
						<div class="product-alt">
							${lList['9'].pname}
						</div>
					</li>
					<c:forEach var="p" items="${lList}">
						<li>
							<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${p.pid}"/>"
							target="_blank"> 
								<img src="${pageContext.request.contextPath}/<c:out value="${p.image }"/>"
								style="display: block;" alt="${p.pname}"/>
							</a>
							<div class="product-alt">
								${p.pname}
							</div>
						</li>
					</c:forEach>
					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${lList['0'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${lList['0'].image }"/>"
							style="display: block;" alt="${lList['0'].pname}"/>
						</a>
						<div class="product-alt">
							${lList['0'].pname}
						</div>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${lList['1'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${lList['1'].image }"/>"
							style="display: block;" alt="${lList['1'].pname}"/>
						</a>
						<div class="product-alt">
							${lList['1'].pname}
						</div>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${lList['2'].pid}"/>"
						target="_blank"> 
							<img src="${pageContext.request.contextPath}/<c:out value="${lList['2'].image }"/>"
							style="display: block;" alt="${lList['2'].pname}"/>
						</a>
						<div class="product-alt">
							${lList['2'].pname}
						</div>
					</li>
				</ul>
			</div>
		</div>		
	</div>
	<div class="container footer">
		<div class="span24">
			<div class="copyright"> web design by huizhe wang || 001614841 || 6220 Final Project</div>
		</div>
	</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>