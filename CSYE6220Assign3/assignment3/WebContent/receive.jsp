<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align:center" >
<table border="1" align=center>
           <caption>The information</caption>
           <tr><td> First Name</td><td>${firstname}</td></tr>
            <tr><td> Middle Initial</td><td>${middleinitial}</td></tr>
			<tr><td>Last Name</td><td>${lastname}</td></tr>
			<tr><td>Gender</td><td>${gender}</td></tr>
			<tr><td>Date of Birth</td>
		    <td> ${year} / ${month}	/ ${day}	
            </td></tr>
			<tr><td>Address</td><td>${address} </td></tr>
			<tr><td>City</td><td>${city}</td></tr>
			<tr><td>State</td><td>${state}</td></tr>
			<tr><td>Zip Code</td><td>${zipcode}</td></tr>				
			</table>
			</div>
</body>
</html>