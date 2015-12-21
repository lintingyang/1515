<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List</title>
</head>
<body>


	<form action="/boards/query" method="get">
		版面搜尋:<input type="text" name="name"> <input type="submit">
	</form>
	
	<button type="button" onclick="location.href='/boards/add'">新增版面</button><hr>
	<button type="button" onclick="location.href='/boards/list2'">依名稱排序</button>
	<c:if test="${!empty beans}">
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>createdDate</th>
					<th>description</th>
					<th>threadCount</th>
					<th>replyCount</th>
					<th>boardCategoria</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${beans}">
					<tr>
						<td>${s.id}</td>
						<td>${s.name}</td>
						<td>${s.createdDate}</td>
						<td>${s.description}</td>
						<td>${s.threadCount}</td>
						<td>${s.replyCount}</td>
						<td>${s.boardCategoria}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>


</body>
</html>