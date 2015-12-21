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


	<form action="/threads/query" method="get">
		輸入ID回文搜尋:<input type="text" name="id"> <input type="submit">
	</form>

	<button type="button" onclick="location.href='/threads/add'">新增帖子</button>
	<hr>
	<button type="button" onclick="location.href='/threads/list2'">依發帖時間排序</button>
	<c:if test="${!empty beans}">
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>title</th>
					<th>createdDate</th>
					<th>threadContent</th>
					<th>hit</th>
<!-- 					<th>replyCount</th> -->
					<th>user</th>
					<th>board</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${beans}">
					<tr>
						<td>${s.id}</td>
						<td>${s.title}</td>
						<td>${s.createdDate}</td>
						<td>${s.threadContent}</td>
						<td>${s.hit}</td>
<%-- 						<td>${s.replyCount}</td> --%>
						<td>${s.user}</td>
						<td>${s.board}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>


</body>
</html>