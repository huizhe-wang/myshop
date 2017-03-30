<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>my Cart</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/cart.css"
	rel="stylesheet" type="text/css" />

</head>
<body>

	<div class="container header">
		<%@ include file="menu.jsp"%>
	</div>
	<div class="container cart">
		<div class="span24">
			<table>
				<tbody>
					<tr>
						<th colspan="5">Order Number:<c:out value="${order.oid}" />&nbsp;&nbsp;&nbsp;&nbsp;
						</th>
					</tr>
					<tr>
						<th>Photo</th>
						<th>Product</th>
						<th>Price</th>
						<th>Number</th>
						<th>Total</th>
					</tr>
					<c:forEach var="orderItem" items="${order.orderItems}">
						<tr>
							<td width="60"><img
								src="${ pageContext.request.contextPath }/<c:out value="${ orderItem.product.image}"/>" />
							</td>
							<td><c:out value="${orderItem.product.pname}" /></td>
							<td><c:out value="${orderItem.product.shop_price}" /></td>
							<td class="quantity" width="60">
							<c:out value="${orderItem.count}" /></td>
							<td width="140"><span class="subtotal">￥
							<c:out	value="${orderItem.subtotal}" /></span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<dl id="giftItems" class="hidden" style="display: none;">
			</dl>
			<div class="total">
				<em id="promotion"></em> Price: <strong id="effectivePrice">$<c:out
						value="${order.total}" />
				</strong>
			</div>
			<hr/>
			<br/>
			<form id="orderForm" action="${ pageContext.request.contextPath }/payOrder" method="post">
				<input type="hidden" name="oid" value="<c:out value="${order.oid}"/>" />
					
				<table>
				<tbody>
					<tr>
						<td>Address：</td>
						<td><input name="addr" type="text" value="<c:out value="${sessionScope.user.addr}"/>"
							style="width: 350px" />  </td>
				  </tr>
				  <tr>
						<td>Consignee：</td>
						<td><input name="name" type="text" value="<c:out value="${sessionScope.user.username}"/>"
							style="width: 150px" /> </td>
				    </tr>
				       <tr>
						<td>Phone Number：</td>
						<td><input name="phone" type="text" value="<c:out value="${sessionScope.user.phone}"/>"
							style="width: 150px" /></td>
							</tr>
							</tbody>
					</table>
					<p style="text-align: right">
						<a
							href="javascript:document.getElementById('orderForm').submit();">
							submit
						</a>
					</p>
					<hr/>
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