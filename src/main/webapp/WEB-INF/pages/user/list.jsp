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
	<form action="/users/query" method="get">
		查詢單一帳號:<input type="text" name="account"> 
		<input type="submit" value="送出">
	</form>
	
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Account</th>
			<th>Address</th>
			<th>SchoolEmail</th>
			<th>GameScore</th>
			<th>onlineDatetime</th>
			<th>Isolated</th>
		</tr>
		<c:choose>
			<c:when test="${!empty getOne.id}" >
			<tr>
				<td>${getOne.id}</td>
				<td>${getOne.name}</td>
				<td>${getOne.account}</td>
				<td>${getOne.address}</td>
				<td>${getOne.schoolEmail}</td>
				<td>${getOne.gameScore}</td>
				<td>${getOne.onlineDatetime}</td>
				<td>${getOne.isolated}</td>
			</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${getAllUser}" var="temp">
					<tr>
						<td>${temp.id}</td>
						<td>${temp.name}</td>
						<td>${temp.account}</td>
						<td>${temp.address}</td>
						<td>${temp.schoolEmail}</td>
						<td>${temp.gameScore}</td>
						<td>${temp.onlineDatetime}</td>
						<td>${temp.isolated}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>



	</table>


</body>
</html>