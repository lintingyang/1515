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
	
	<form action="/users/update" method="get">
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
		<c:if test="${!empty getOne.id}" >
		<tr>
			<td>${getOne.id}</td>
			<td>${getOne.name}</td>
			<td><input type="text" name="account" value="${getOne.account}" readonly="readonly" style="border:none"></td>
			<td>${getOne.address}</td>
			<td>${getOne.schoolEmail}</td>
			<td>${getOne.gameScore}</td>
			<td>${getOne.onlineDatetime}</td>
			<td>
				<select name="isolate"> 
					<option value="F">F
					<option value="T">T
				</select>
				<input type="submit" value="送出">
			</td>
			
		</tr>
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
		</c:if>
	</table>
	</form>
	

</body>

</html>