<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>


	<form action="/admins/query" method="get">
		帳號搜尋:<input type="text" name="account"> <input type="submit">
	</form>
	<button type="button" onclick = "location.href='/admins/add'">新增管理員</button>

	${aaa.name}
	<table border="1">
		<tr>
			<th>edit</th>
			<th>id</th>
			<th>account</th>
			<th>password</th>
			<th>name</th>
			<th>email</th>
			<th>authority</th>
		</tr>
		<c:forEach items="${ entity }" var="admin">
			<tr>
				<td>
				<input type = "button" value="修改" onclick = "javascript:location.href='/admins/edit?account=${ admin.account }'">
				</td>
				<td>${ admin.id }</td>
				<td>${ admin.account }</td>
				<td>${ admin.password }</td>
				<td>${ admin.name }</td>
				<td>${ admin.email }</td>
				<td>${ admin.authority }</td>
				
			</tr>

		</c:forEach>
	</table>
</body>
</html>