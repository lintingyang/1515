<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action = "/admins/query" method = "get">

帳號搜尋:<input type = "text" name="account">
<input type = "submit">
</form>

${aaa.name}
<table border="1">
	<tr>
	<th>id</th><th>account</th><th>password</th><th>name</th><th>email</th><th>authority</th>
	</tr>
<c:forEach items = "${ entity }" var = "item">
	<tr>
	<td>${ item.id }</td>
	<td>${ item.account }</td>
	<td>${ item.password }</td>
	<td>${ item.name }</td>
	<td>${ item.email }</td>
	<td>${ item.authority }</td>
	</tr>

</c:forEach>
</table>
</body>
</html>