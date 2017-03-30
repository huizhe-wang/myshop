<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/js/public.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function addProduct() {
		window.location.href = "${pageContext.request.contextPath}/gotoAddProduct";
	}
	$(function() {
		$("#delete").click(function() {
			if(! confirm("are you sure to delete this item?")){				
				return false;
			}
		});
	});
</script>
</HEAD>
<body>
	<br>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/user/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>Product List</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="add"
							class="button_add" onclick="addProduct()">
							add product</button>

					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="18%">ID</td>
								<td align="center" width="17%">Product Images</td>
								<td align="center" width="17%">Product Names</td>
								<td align="center" width="17%">Product Prices</td>
								<td align="center" width="17%">HOT or NOT</td>
								<td width="7%" align="center">Edit</td>
								<td width="7%" align="center">Delete</td>
							</tr>
							<c:forEach var="p" items="${products}" varStatus="vs">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="18%"><c:out value="${vs.index+1}"></c:out></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><img width="40" height="45"
										src="${ pageContext.request.contextPath }/<c:out value="${p.image}"/>">
									</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><c:out value="${p.pname}" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><c:out value="${p.shop_price}" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><c:if test="${p.is_hot==1}">
													Yes
												</c:if> <c:if test="${p.is_hot!=1}">
													No
												</c:if></td>
									<td align="center" style="HEIGHT: 22px"><a
										href="${ pageContext.request.contextPath }/editProduct/<c:out value="${p.pid}"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_edit.gif"
											border="0" style="CURSOR: hand">
									</a></td>

									<td align="center" style="HEIGHT: 22px"><a id="delete"
										href="${ pageContext.request.contextPath }/deleteProduct/<c:out value="${p.pid}"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a></td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr align="center">
					<td colspan="7"><c:out value="${page }" />/<c:out
							value="${count }" /> <c:if test="${page != 1 }">
							<a href="${ pageContext.request.contextPath }/listProduct/1">First</a>|
								<a
								href="${ pageContext.request.contextPath }/listProduct/<c:out value="${page - 1 }"/>">Previous</a>|
							</c:if> <c:if test="${ page != count}">
							<a
								href="${ pageContext.request.contextPath }/listProduct/<c:out value="${page + 1 }"/>">Next</a>|
								<a
								href="${ pageContext.request.contextPath }/listProduct/<c:out value="${count }"/>">Last</a>|
							</c:if>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>

