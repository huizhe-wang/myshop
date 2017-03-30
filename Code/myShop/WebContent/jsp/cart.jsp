<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>My Cart</title>

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
		<c:if test="${fn:length(sessionScope.cart.cartItems)!=0}">
			<div class="span24">
				<table>
					<tbody>
						<tr>
							<th>picture</th>
							<th>product</th>
							<th>price</th>
							<th>number</th>
							<th>money</th>
							<th>operation</th>
						</tr>
						<c:forEach var="cartItem" items="${sessionScope.cart.cartItems}">
							<tr>
								<td width="60">
									<a href="${pageContext.request.contextPath }/findByPid/<c:out value="${cartItem.product.pid}"/>">
									<img
										src="${pageContext.request.contextPath}/<c:out value="${cartItem.product.image}"/>" />
									</a>
								</td>
								<td>
									<a target="_blank" href="${ pageContext.request.contextPath }/findByPid/<c:out value="${cartItem.product.pid}"/>">
									<c:out value="${cartItem.product.pname}" />
									</a>
								</td>
								<td>￥<c:out value="${cartItem.product.shop_price}" />
								</td>
								<td class="quantity" width="60"><c:out value="${cartItem.count}" /></td>
								<td width="140"><span class="subtotal">$<c:out
											value="${cartItem.subtotal}" /></span></td>
								<td><a
									href="${ pageContext.request.contextPath }/removeCart/<c:out value="${cartItem.product.pid}"/>"
									class="delete">delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				
				<div class="total">
					<em id="promotion"></em> <em> Total Prices:</em> 
					<strong id="effectivePrice">$<c:out value="${sessionScope.cart.total}"/>
					</strong>
				</div>
				<div class="bottom">
					<a
						href="${ pageContext.request.contextPath }/clearCart"
						id="clear" class="clear">Clear Shopping Car</a> <a
						href="${pageContext.request.contextPath}/saveOrder"
						id="submit" class="submit">Submit</a>
				</div>
		
			</div>
		</c:if>
		    <div style="width:100%;height:200px;color:#666666;line-height:200px;font-size:40px;text-align:center"> 		
	        	<c:if test="${fn:length(sessionScope.cart.cartItems) == 0}">
						Please go <a href="http://localhost:8080/myShop/" style="font-size:38px;color:green">shopping</a> !!!
		          </c:if>
		       </div>
		    </div>

	<div class="container footer">
		<div class="span24">
			<div class="copyright"> web design by huizhe wang || 001614841 || 6220 Final Project</div>
		</div>
	</div>
</body>
</html>