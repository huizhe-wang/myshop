<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link href="${pageContext.request.contextPath}/css/register.css"
	rel="stylesheet" type="text/css" />

</head>
<body>
	<div class="container header">
		<%@ include file="menu.jsp"%>
	</div>
	
	<div class="container register">
		<div class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong>Manage Information</strong>USER Information
					</div>
					 <form:form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/updateuser" method="post"
		modelAttribute="user" enctype="multipart/form-data">
		<form:hidden path="state"/>
			<form:hidden path="uid"/>
			<form:hidden path="code"/>
			<table>
		    <tbody>
			    <tr>		
				  <th><span class="requiredField">*</span>User Photo:</th>
				  <td>
				  <c:if test="${user.url!=null&&user.url!=''}">
         					<img src="${ pageContext.request.contextPath }/${user.url}" width="60" height="60"/>
       			  </c:if>
				  <input type="file" name="upload"/></td>
			    </tr>
				<tr>
									<th>Username:</th>
									<td><form:input type="text"
						 path="username" id="userAction_save_do_logonName" class="text" maxlength="20" />
									</td>
								</tr>
								<tr>
									<th>Password:</th>
									<td><form:input type="password"
						path="password" id="userAction_save_do_logonName" class="text" maxlength="20" /></td>
								</tr>
								<tr>
									<th>Name:</th>
									<td><form:input type="text"
						path="name" id="userAction_save_do_logonName" class="text"
										maxlength="200" /></td>
								</tr>
								<tr>
									<th>Email:</th>
									<td><form:input type="text"
						path="email" id="userAction_save_do_logonName" class="text" /></td>
								</tr>
								<tr>
									<th>Phone Number:</th>
									<td><form:input type="text"
						path="phone" id="userAction_save_do_logonName" class="text" /></td>
								</tr>
								<tr>
									<th>Address:</th>
									<td><form:input type="text"
						path="addr" id="userAction_save_do_logonName" class="text" /></td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td>
									<button type="submit" id="userAction_save_do_submit" value="submit"
						class="button_ok">submit</button>
					                <button type="reset" value="reset" class="button_cancel">reset</button>
					                <input class="button_ok" type="button" onclick="history.go(-1)" value="back" />
					                </td>
								</tr>
							</tbody>
						</table>
						<div class="login">
							<dl>
								<dt>Shopping now？</dt>
								<dd>
									Go to shopping more！ <a href="${pageContext.request.contextPath}/index">Home Page</a>
								</dd>
							</dl>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<div class="container footer">
		<div class="span24">
			<div class="copyright"> web design by huizhe wang || 001614841 || 6220 Final Project</div>
		</div>
	</div>
</body>
</html>