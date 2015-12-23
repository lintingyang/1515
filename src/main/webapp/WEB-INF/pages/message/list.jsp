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
	<form action="/messages/query" method="get">
	SenderId:<input type="text" name="senderId">
	receiverId:<input type="text" name="receiverId">
	<input type="submit" value="送出">
	</form>
	
	<table>
		<tr>
			<th>sender_id</th>
			<th>article</th>
			<th>deliver_time</th>
			<th>read_time</th>
			<th>receiver_id</th>
		</tr>
		<c:forEach items="${getSome}" var="getOne">
			<tr>
				<td>${getOne.userBySenderId.id}</td>
				<td>${getOne.article}</td>
				<td>${getOne.deliverTime}</td>
				<td>${getOne.readTime}</td>
				<td>${getOne.userByReceiverId.id}</td>
			</tr>		
		</c:forEach>
	
	
	
	
	
	
	</table>
	


</body>
</html>