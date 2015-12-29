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
	
		<input type="text" name="account" placeholder="數入account"> 
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
			<th>changeScore</th>
		</tr>
		<c:if test="${!empty findUser.id}" >
		<tr>
			<td>${findUser.id}</td>
			<td>${findUser.name}</td>
			<td><input type="text" name="account" value="${findUser.account}" readonly="readonly" style="border:none"></td>
			<td>${findUser.address}</td>
			<td>${findUser.schoolEmail}</td>
			<td>${findUser.gameScore}</td>
			<td>${findUser.onlineDatetime}</td>
			<td>
				<select name="isolate"> 
					<option value="F">F
					<option value="T">T
				</select>
			</td>
			<td><input type="text" name="score"/></td>
			<td><input type="submit" value="送出"></td>
		</tr>

		<tr>
			<td>${findUser.id}</td>
			<td>${findUser.name}</td>
			<td>${findUser.account}</td>
			<td>${findUser.address}</td>
			<td>${findUser.schoolEmail}</td>
			<td>${findUser.gameScore}</td>
			<td>${findUser.onlineDatetime}</td>
			<td>${findUser.isolated}</td>
		</tr>
		</c:if>
	</table>
	</form>
	<a href='http://localhost:8080/users/list'>aaa</a>
	<input type ="button" onclick="javascript:location.href='http://localhost:8080/users/list'" value="回帳號列表"></input>
	<input type ="button" onclick="history.back()" value="回到上一頁"></input>
</body>

</html>