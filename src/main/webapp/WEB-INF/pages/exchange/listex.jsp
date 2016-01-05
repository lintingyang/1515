<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
search by product A id:
<form action="/exchanges/query" method="get">
<input name="id">
<input type="submit" value="submit">
</form>
<table>
	<c:forEach items="${entities}" var="item">
	<tr>
		<td>${item.id}</td>	
		<td>${item.exchangeTime}</td>
		<td>${item.productByProductAId.name}</td>
		<td>${item.productByProductBId.name}</td>
	</tr>
	</c:forEach>
	<c:forEach items="${results}" var="item">
	<tr>
		<td>${item.id}</td>	
		<td>${item.exchangeTime}</td>
		<td>${item.productByProductAId.name}</td>
		<td>${item.productByProductBId.name}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>