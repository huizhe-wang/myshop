<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Registration</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/register.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<style>
.error{color:red}
</style>
<script>
	function checkForm() {
		// check username and value
		var username = $("#username").val();
		if (username == null || username == '') {
			alert("username can not null!");
			return false;
		}
		// check password and value
		var password = $("#password").val();
		if (password == null || password == '') {
			alert("password can not null!");
			return false;
		}
		// confirm password:
		var repassword = $("#repassword").val();
		if (repassword != password) {
			alert("don't match the password entered before!");
			return false;
		}

	}
	function checkUsername() {
		$.post(
			"checkUser/" + $("#username").val(),
			{},
			function(data) {
				if (data == 1) {
					document.getElementById("span1").innerHTML = "<font color='red'>the username has been used</font>";
					$("#username").val("");
					$("#username").focus();
					$(".submit").unbind("click",
							function(event){
						
					});
				} else {
					document.getElementById("span1").innerHTML = "<font color='green'>the username could be used</font>";
				}
		});
	}
</script>
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
						<strong>Registration</strong>USER REGISTER
					</div>
					<form:form commandName="user" 
						action="${ pageContext.request.contextPath }/register"
						method="post" modelAttribute="user"
						onsubmit="return checkForm();">
						<table>
							<tbody>
								<tr>
									<th><span class="requiredField">*</span>Username:</th>
									<td><form:input path="username" id="username"
										class="text" maxlength="20" onblur="checkUsername()"/> <span
										id="span1" style="padding-left: 10px;"></span></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>Password:</th>
									<td><form:password path="password" id="password" name="password"
										class="text" maxlength="20" /></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>Confirm Password:</th>
									<td><input id="repassword" type="password"
										name="repassword" class="text" maxlength="20" /></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>E-mail:</th>
									<td><form:input path="email" id="email"
										class="text" maxlength="20" />
									<form:errors path="email" cssClass="error"/>
										</td>
								</tr>
								<tr>
									<th>Name:</th>
									<td><form:input path="name" class="text"
										maxlength="200" /></td>
								</tr>
								<tr>
									<th>Mobile Number:</th>
									<td><form:input path="phone" class="text" /></td>
								</tr>
								<tr>
									<th>Address:</th>
									<td><form:input path="addr" class="text"
										maxlength="200" /></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>Security Code:</th>
									<td><span class="fieldSet"> <input type="text"
											id="checkcode" name="checkcode" class="text captcha"
											maxlength="4" /> <img id="checkImg" class="captchaImage"
											src="${pageContext.request.contextPath}/getCheckCodeImage"
											onclick="changeImg()" title="click to change code" /></span>
											<c:if test="${errorCheckCode !=null}">
											   <font color="red">Wrong Security Code</font>
											</c:if>
									</td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td>
									By clicking Create Account, you agree to our Terms and that you have read our Data Policy, including our Cookie Use.
                                    </td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" value="Sign Up" /></td>
								</tr>
							</tbody>
						</table>
						<div class="login">
							<dl>
								<dt>Have An Account？</dt>
								<dd>
									Login immediately to enjoy your shopping ！ <a href="${pageContext.request.contextPath}/userLogin">Sign in</a>
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
	<div id="_my97DP"
		style="position: absolute; top: -1970px; left: -1970px;">
	</div>
	<script type="text/javascript">
		function changeImg() {
			var img1 = document.getElementById("checkImg");
			img1.src = "${pageContext.request.contextPath}/getCheckCodeImage"
					+ "?date=" + new Date();
		}
	</script>
</body>
</html>
