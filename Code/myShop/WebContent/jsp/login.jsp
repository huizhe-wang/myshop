<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
  $(function(){
	  //change CAPTCHA
	   $("#captchaImage").click(function(){		   
	   		$("#captchaImage").attr("src","${pageContext.request.contextPath}/getCheckCodeImage?date="+new Date().getTime());		   
	   });
   });
  $(function(){
	  $("#username").focus(function(){
		  $("#username").val("");
	  });
  })
</script>
<title>Login In</title>

<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" type="text/css" />
</head>
<body>

 <div class="container header">
		<%@ include file="menu.jsp"%>

	</div> 
	<div class="container login">
	   <div class="title">
		   <strong>Log In</strong>USER LOGIN
		</div>
		<div class="span12">
		 <div class="ad">
				<img src="${pageContext.request.contextPath}/image/login.png"
					width="420" height="310" alt="Log In" title="Log In"/>
			</div> 
		</div>
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					
					<form:form id="loginForm" modelAttribute="user" commandName="user"
						action="${ pageContext.request.contextPath }/login"
						method="post">
						<table>
							<tbody>
								<tr>
									<th>username:</th>
									<td><form:input path="username" name="username" id="username"
										class="text" maxlength="20"/>
										<c:if test="${notUser != null }">
										    <font color="red">No This User</font>
										</c:if>
									</td>
								</tr>
								<tr>
									<th>Password:</th>
									<td><form:password id="password" path="password"
										class="text" maxlength="20"/>
										<c:if test="${notPassword != null}">
										    <font color="red">Wrong Password</font>
										</c:if>
									</td>
								</tr>
								<tr>
									<th>Security code:</th>
									<td>
										<span class="fieldSet">
											<input type="text" id="captcha" name="checkcode" class="text captcha" maxlength="4"/>
											<img id="captchaImage" class="captchaImage" 
											src="${pageContext.request.contextPath}/getCheckCodeImage" title="click to change code"/>
										</span>
										<c:if test="${errorCheckCode != null}">
										    <font color="red">Not Match</font>
										</c:if>
									</td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><label> <input type="checkbox"
											id="isRememberUsername" name="isRememberUsername"
											value="true"/>Remember Me </label> <label> &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/findpass">Find Password</a>
									</label></td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" value="Sign in "/></td>
								</tr>
								<tr class="register">
									<th>&nbsp;</th>
									<td>
										<dl>
											<dt>No Yet Sign Up？</dt>
											<dd>
												sign up immediately to enjoy your shopping！ <a href="${pageContext.request.contextPath }/userRegister">Register</a>
											</dd>
										</dl>
									</td>
								</tr>
							</tbody>
						</table>
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