<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>find password</title>
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
		// check username and value:
		var username = $("#username").val();
		if (username == null || username == '') {
			alert("username can not be null!");
			return false;
		}
		// check password and value:
		var password = $("#password").val();
		if (password == null || password == '') {
			alert("password can not be null!");
			return false;
		}
		

	}
	function checkUsername() {
		$.post(
			"checkUser/" + $("#username").val(),
			{},
			function(data) {
				if (data == 1) {
					document.getElementById("span1").innerHTML = "<font color='green'>√</font>";
	
				
				} else {
					$(".submit").unbind("click",
							function(event){
						
					});
					document.getElementById("span1").innerHTML = "<font color='red'>usename doesn't exist</font>";
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
						<strong>Find Password</strong>FIND PASSWORD
					</div>
					<form:form commandName="user" 
						action="${ pageContext.request.contextPath }/updatepass"
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
									<th><span class="requiredField">*</span>E-mail:</th>
									<td><form:input path="email" id="email"
										class="text" maxlength="20" />
									<form:errors path="email" cssClass="error"/>
										</td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>New Password:</th>
									<td><form:password path="password" id="password" name="password"
										class="text" maxlength="20" /></td>
								</tr>
							
								
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" value="sumbit" /></td>
								</tr>
							
								
							</tbody>
						</table>
						<div class="login">
										<dl>
											<dt>Remember your Password？</dt>
											<dd>
												sign in immediately to enjoy your shopping！ <a href="${pageContext.request.contextPath }/userLogin">Sign in</a>
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
