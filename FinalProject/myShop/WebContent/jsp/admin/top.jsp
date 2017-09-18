<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
BODY {
	MARGIN: 0px;
	FONT-SIZE: 12px;
	COLOR: #OOOOOO
}

</style>
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css">
	</HEAD>
	<body>
		<table width="100%" height="70%">
			<tr>
			  <td width="100%" background="${pageContext.request.contextPath}/images/top.png">
				</td> 
			</tr>
		</table>
		<table width="100%">
			<tr>
				<td height="30" valign="bottom" background=#000000>
					<table width="100%" >
						<tr>
							<td width="85%" align="left">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<font color="#000000"> <script language="JavaScript">
<!--
tmpDate = new Date();
date = tmpDate.getDate();
month= tmpDate.getMonth() + 1 ;
year= tmpDate.getFullYear();
document.write(month);
document.write(" - ");
document.write(date);
document.write(" - ");
document.write(year);
document.write(" - ");

myArray=new Array(6);
myArray[0]="Sunday"
myArray[1]="Monday"
myArray[2]="Tuesday"
myArray[3]="Wednesday"
myArray[4]="Thursday"
myArray[5]="Friday"
myArray[6]="Saturday"
weekday=tmpDate.getDay();
if (weekday==0 | weekday==6)
{
document.write(myArray[weekday])
}
else
{document.write(myArray[weekday])
};
// -->
  function exit(){
       window.open('${pageContext.request.contextPath}/jsp/admin/index.jsp','_top')
         } 
									</script> </font>
							</td>
							<td width="15%">
								<table width="100%" >
									<tr>
										<td width="16" >
						
										</td>
										<td width="155" valign="bottom">
											Username：
											<font color="blue"><c:out value="${sessionScope.admin.username}"></c:out></font>
											||
											<a href="javascript:exit()" }><font color="blue">Exit</font></a> 	
								
										</td>
							
										<td width="10" align="right">
										</td>
									</tr>
								</table>
							</td>
							<td align="right" width="5%">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
