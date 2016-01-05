<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add</title>
</head>
<body>
	<c:if test="${!empty bean}">
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>user</th>
					<th>messages</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${bean.id}</td>
					<td>${bean.user.name}</td>
					<td>${bean.messages}</td>
				</tr>
			</tbody>
		</table>
	</c:if>


</body>
</html>