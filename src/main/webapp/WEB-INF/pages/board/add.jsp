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
	<form method="get" action="/boards/insert">
<!-- 		版面類別： -->
<!-- 		<select name="boardCategoria"> -->
<%-- 		<c:forEach var="s" items="${beans}"> --%>
<%-- 			<option value="${s.name}">${s.name} --%>
<%-- 		</c:forEach> --%>
<!-- 		</select> <br> -->
		<input type="hidden" name="id" value="${boardCategoria.id}">
		版面名稱：<input type="text" name="name" /><br>
		版面敘述：<input type="text" name="description" /><br>
		<input type = "submit" value = "送出表單"/><input type="button" value="回列表" onclick="location.href='/boards/list'">
		
	</form>
	${ message }
	
	

</body>
</html>