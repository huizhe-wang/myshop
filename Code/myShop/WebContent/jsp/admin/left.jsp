<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>menu</title>
<link rel="StyleSheet"
	href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/dtree.js"></script>
</head>
<body>
	<table width="100">
		<tr>
			<td height="11"></td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td>
				<div class="dtree">
					<a href="javascript: d.openAll();">Open All</a> ｜ <a
						href="javascript: d.closeAll();">Close All</a>
					<script type="text/javascript">
						d = new dTree('d');
						d.add('01', -1, 'system menus');
						d.add('0101', '01', 'user management', '', '', 'mainFrame');
						d.add(
										'010101',
										'0101',
										'users',
										'listUser/1',
										'', 'mainFrame');
						
						d.add('0104', '01', 'product management');
						d.add(
										'010401',
										'0104',
										'products',
										'${pageContext.request.contextPath}/listProduct/1',
										'', 'mainFrame');
						d.add('0105', '01', 'order management');
						d.add(
										'010501',
										'0105',
										'orders',
										'${pageContext.request.contextPath}/listOrder/1',
										'', 'mainFrame');
						d.add('0106', '01', 'comment management');
						d.add(
										'010601',
										'0106',
										'comments',
										'${pageContext.request.contextPath}/showComment/1',
										'', 'mainFrame');
						document.write(d);
					</script>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
