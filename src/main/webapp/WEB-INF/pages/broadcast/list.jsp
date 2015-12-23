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
<form  action="/broadcasts/insert" method="get">
	<input type="text" name="id" size="5" placeholder="使用者ID">
	<input type="text" name="broadcastDescription">
	<input type="submit" value="輸入">
</form>
	<c:if test="${!empty beans}">
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>user</th>
					<th>broadcastDescription</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${beans}">
					<tr>
						<td>${s.id}</td>
						<td>${s.user.name}</td>
						<td>${s.broadcastDescription}</td>
						<td><input type="submit" value="Delete" 
    					onclick="window.location='delete?id=${s.id}';" />  </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>


</body>
</html>