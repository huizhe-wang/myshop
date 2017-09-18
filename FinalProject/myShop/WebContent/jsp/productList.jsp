<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://localhost:8080/mango/product/list/1.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>product list</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet" type="text/css" />

</head>
<body>
	<div class="container header">
		<%@ include file="menu.jsp"%>
	</div>
	<div class="container productList">
		<div class="span6">
			<div class="hotProductCategory">
				<c:forEach var="c" items="${sessionScope.cList }">
					<dl>
						<dt>
							<a
								href="${pageContext.request.contextPath }/findByCid/<c:out value="${c.cid}"/>/1"><c:out
									value="${c.cname}" /></a>
						</dt>
						<c:forEach var="cs" items="${c.categorySeconds}">
							<dd>
								<a
									href="${ pageContext.request.contextPath }/findByCsid/<c:out value="${cs.csid}/1"/>"><c:out
										value="${cs.csname}" /></a>
							</dd>
						</c:forEach>
					</dl>
				</c:forEach>
			</div>
		</div>
		<div class="span18 last">
			<form id="productForm"
				action="${pageContext.request.contextPath}/image/蔬菜 - Powered By Mango Team.htm"
				method="get">
				<div id="result" class="result table clearfix">
					<ul>
						<c:forEach var="p" items="${products}">
							<li><a
								href="${ pageContext.request.contextPath }/findByPid/<c:out value="${p.pid}"/>">
									<img
									src="${pageContext.request.contextPath}/<c:out value="${p.image}"/>"
									width="170" height="170" style="display: inline-block;" /> <span
									style='color: green'> <c:out value="${p.pname}" />
								</span> <span class="price"> sale price： ￥<c:out
											value="${p.shop_price}" />
								</span>
							</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="pagination">
				<!-- first category -->
					<c:if test="${cid != null }">
						<span>the <c:out value="${page}" />/<c:out value="${count}" />page
						</span>
						<!-- index -->
						<span><a class="firstPage"
							href="${pageContext.request.contextPath}/findByCid/${cid}/1"></a></span>
						<c:if test="${page != 1}">
							<span><a class="previousPage"
								href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${page-1}"/>"></a></span>
						</c:if>
						<c:forEach var="i" begin="1" end="${count }">
							<span>
							   <!-- can not click on if it is the current page -->
							   <c:if test="${i == page }">
							    	<span class="currentPage">${page }</span>
							   </c:if>
							   <c:if test="${i != page }">
								 <a href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${i}"/>">
									<c:out value="${i}" /></a>
								</c:if>
							</span>
						</c:forEach>
						<!-- next page -->
						<c:if test="${page !=count }">
							<span><a class="nextPage"
								href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${page+1}"/>"></a></span>
						</c:if>
						<!-- last page -->
						<a class="lastPage"
							href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${count}"/>"></a>
					</c:if>
					<!-- second category -->
					<c:if test="${csid != null }">
						<span>the <c:out value="${page}" />/<c:out value="${count}" />page
						</span>
						<!-- first page -->
						<span><a class="firstPage"
							href="${pageContext.request.contextPath}/findByCsid/${csid}/1"></a></span>
						<c:if test="${page != 1}">
							<span><a class="previousPage"
								href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${page-1}"/>"></a></span>
						</c:if>
						<c:forEach var="i" begin="1" end="${count }">
							<span>
							 <!-- can not click on if it is the current page -->
							   <c:if test="${i == page }">
							    	<span class="currentPage">${page }</span>
							   </c:if>
							   <c:if test="${i != page }">
								 <a href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${i}"/>">
									<c:out value="${i}" /></a>
								</c:if>
							</span>
						</c:forEach>
						<!-- next page -->
						<c:if test="${page !=count }">
							<span><a class="nextPage"
								href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${page+1}"/>"></a></span>
						</c:if>
						<!-- last page -->
						<a class="lastPage"
							href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${count}"/>"></a>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<div class="container footer">
		<div class="span24">
			<div class="copyright"> web design by huizhe wang || 001614841 || 6220 Final Project</div>
		</div>
	</div>
</body>
</html>