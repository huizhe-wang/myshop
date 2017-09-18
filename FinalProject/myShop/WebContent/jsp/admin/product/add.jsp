<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
</HEAD>
<body>
	<!--  -->
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/addProduct" method="post"
		enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>add product</STRONG> </strong></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					Product Name：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="pname" value="" id="userAction_save_do_logonName"  />
				</td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					Hot or Not：</td>
				<td class="ta_01" bgColor="#ffffff"><select name="is_hot">
						<option value="1">Yes</option>
						<option value="0">No</option>
				</select></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					Price：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="market_price" value="" id="userAction_save_do_logonName"
					class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					Sale Price：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="shop_price" value="" id="userAction_save_do_logonName"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					Product Image：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3">
					<input type="file" name="upload"/></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					Second Category：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3"><select
					name="csid">
						<c:forEach var="cs" items="${categorySeconds }">
							<option value="<c:out value="${cs.csid}"/>"><c:out
									value="${cs.csname}" /></option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					product information：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3"><textarea
						name="pdesc" rows="5" cols="30"></textarea></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="userAction_save_do_submit" value="submit"
						class="button_ok">submit</button> 
					<button type="reset" value="reset" class="button_cancel">reset</button>
                   <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="back" />
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>