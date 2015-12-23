<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<!-- 	<form action="/boards/edit" method="get"> -->
	
<!-- 		<input type="text" name="name" >  -->
<!-- 		<input type="submit" value="送出"> -->
<!-- 	</form> -->
	
	<form action="/boards/update" method="get">
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
					<th>isCream</th>
					<th>isHide</th>
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
						<td>${s.isCream}</td>
						<td>${s.isHide}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

	</form>
	

</body>

</html>