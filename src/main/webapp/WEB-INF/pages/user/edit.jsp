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

	<form action="/users/update1" method="get">
		<input type="text" name="account" > 
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
		<tr>
			<td>${getOne.id}</td>
			<td>${getOne.name}</td>
			<td>${getOne.account}</td>
			<td>${getOne.address}</td>
			<td>${getOne.schoolEmail}</td>
			<td>${getOne.gameScore}</td>
			<td>${getOne.onlineDatetime}</td>
			<td>
			<c:choose>
				<c:when test=" ${getOne.isolated == 'F' }" >
				<form action="/users/update" method="get">
					<input type="radio" name="isolate" value="F" checked="checked">F
					<input type="radio" name="isolate" value="T">T
					<input type="submit" value="送出">
				</form>
				</c:when>
				<c:otherwise>
					<form action="/users/update" method="get">
					<input type="radio" name="isolate" value="F">F
					<input type="radio" name="isolate" value="T" checked="checked">T
					<input type="submit" value="送出">
					</form>
				</c:otherwise>
			</c:choose>
			</td>
			
		</tr>
	</table>
	
	

</body>

</html>