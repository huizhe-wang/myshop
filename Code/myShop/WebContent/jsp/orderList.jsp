<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>My order</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/cart.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container header">
		<%@ include file="menu.jsp"%>
	</div>

	<div class="container cart">
			<table>
				<tbody>
					<c:forEach var="order" items="${orders}">
						<tr>
							<th colspan="5">Order Number: <c:out value="${order.oid}" />&nbsp;&nbsp;&nbsp;&nbsp;
								Price: <font color="red">$<c:out value="${order.total }" /></font>
								&nbsp;&nbsp;&nbsp;&nbsp; 
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
								<td width="60"><a
									href="${ pageContext.request.contextPath }/findByPid/<c:out value="${orderItem.product.pid}"/>">
										<img
										src="${ pageContext.request.contextPath }/<c:out value="${orderItem.product.image}"/>" />
								</a></td>
								<td><c:out value="${ orderItem.product.pname}" /></td>
								<td><c:out value="${orderItem.product.shop_price}" /></td>
								<td class="quantity" width="60"><c:out
										value="${orderItem.count}" /></td>
								<td width="140"><span class="subtotal">￥<c:out
											value="${orderItem.subtotal}" />
								</span></td>
							</tr>
						</c:forEach>
					</c:forEach>
					<tr>
						<th colspan="5">
							<div class="pagination">
								<span> <c:out value="${page}" />/<c:out value="${count}" />
								</span>
								<!-- first page -->
								<span><a class="firstPage"
									href="${pageContext.request.contextPath}/findOrderByUid/1"></a></span>
								<c:if test="${page != 1}">
									<span><a class="previousPage"
										href="${pageContext.request.contextPath}/findOrderByUid/<c:out value="${page-1}"/>"></a></span>
								</c:if>
								<c:forEach var="i" begin="1" end="${count }">
									<span> <!-- cann't click on if it is the current page--> <c:if test="${i == page }">
											<span class="currentPage">${page }</span>
										</c:if> <c:if test="${i != page }">
											<a
												href="${pageContext.request.contextPath}/findOrderByUid/<c:out value="${i}"/>">
												<c:out value="${i}" />
											</a>
										</c:if>
									</span>
								</c:forEach>
								<!-- next page -->
								<c:if test="${page !=count }">
									<span><a class="nextPage"
										href="${pageContext.request.contextPath}/findOrderByUid/<c:out value="${page+1}"/>"></a></span>
								</c:if>
								<!-- last page -->
								<a class="lastPage"
									href="${pageContext.request.contextPath}/findOrderByUid/<c:out value="${count}"/>"></a>
							</div>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container footer">
		<div class="span24">
			<div class="copyright"> web design by huizhe wang || 001614841 || 6220 Final Project</div>
		</div>
	</div>
	</div>
</body>
</html>