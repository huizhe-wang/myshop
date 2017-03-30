<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="span10 last" style="float: right;">
	<div class="topNav clearfix">
		<ul>
			<c:if test="${sessionScope.user == null}">
				<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<a
					href="${ pageContext.request.contextPath }/userLogin">Log in</a>|
				</li>
				<li id="headerRegister" class="headerRegister"
					style="display: list-item;"><a
					href="${ pageContext.request.contextPath }/userRegister">Sign up</a>|
				</li>
			</c:if>
			<c:if test="${sessionScope.user != null}">
				<li id="headerLogin" class="headerLogin" style="display: list-item;">
				   <a href="${ pageContext.request.contextPath }/edituser/${user.uid}"> <c:if test="${user.url!=null&&user.url!=''}">
         					<img src="${ pageContext.request.contextPath }/${user.url}" width="20" height="20"/>
       			    </c:if>
					<c:out value="${user.username }"/></a>
				</li>
				<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<a
					href="${ pageContext.request.contextPath }/findOrderByUid/1">My orders</a>
					|
				</li>
				<li id="headerRegister" class="headerRegister"
					style="display: list-item;"><a
					href="${ pageContext.request.contextPath }/quit">Log out</a>|
				</li>
			</c:if>
			
			  <c:if test="${user != null }">
			      <li><a href="${ pageContext.request.contextPath }/edituser/${user.uid}">Users Center</a> |</li>
			  </c:if>
			  <c:if test="${user == null }">
			      <li><a href="javascript:alert('please login in !');">Users Center</a> |</li>
			  </c:if>
		</ul>
	</div>
	<div class="cart" style="float: right;">
		<a href="${pageContext.request.contextPath}/myCart">My Cart</a>
	</div>
</div>
<div class="span24">
	<ul class="mainNav">
		<li><a href="${ pageContext.request.contextPath }/index">Home</a>|</li>
		<c:forEach items="${sessionScope.cList}" var="c">
		   <li><a
				href="${ pageContext.request.contextPath }/findByCid/<c:out value="${c.cid}"/>/1">
				<c:out value="${c.cname}"></c:out> 
			  </a>
		   </li>
		</c:forEach>
		<li><a href="${ pageContext.request.contextPath }/jsp/comment.jsp">Comments</a>|</li>
	</ul>
</div>