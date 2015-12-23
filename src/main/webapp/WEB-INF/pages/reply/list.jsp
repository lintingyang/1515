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


	<form action="/replies/query" method="get">
		搜尋:<input type="text" name="id"> <input type="submit">
	</form>
	
	<button type="button" onclick="location.href='/replies/add'">新增回文</button><hr>
	<button type="button" onclick="location.href='/replies/list2'">所有回文依時間排序</button>
	<c:if test="${!empty beans}">
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>title</th>
					<th>createdDate</th>
					<th>replyContent</th>
					<th>floor</th>
					<th>isHide</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${beans}">
					<tr>
						<td>${s.id}</td>
						<td>${s.title}</td>
						<td>${s.createdDate}</td>
						<td>${s.replyContent}</td>
						<td>${s.floor}</td>
						<td>${s.isHide}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>


</body>
</html>