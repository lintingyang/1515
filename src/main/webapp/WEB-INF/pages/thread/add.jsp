<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add</title>
</head>
<body>
	<form method="get" action="/threads/insert">
		<select name="boardCategoria">
		<c:forEach var="s" items="${beans}">
			<option value="${s.name}">${s.name}
		</c:forEach>
		</select> <br>
	<select name="board">
		<c:forEach var="b" items="${boards}">
			<option value="${b.name}">${b.name}
		</c:forEach>
		</select> <br>
		帖子標題：<input type = "text" name ="title"/><br>
		帖子內文：<input type="text" name="threadContent" /><br>
		帖子標籤：<input type="text" name="threadTags" /><br>
		<br>
		
		<input type = "submit" value = "送出表單"/><input type="button" value="回列表" onclick="location.href='/threads/list'">
		
	</form>
	${ message }
	
	

</body>
</html>