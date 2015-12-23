<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add</title>
</head>
<body>
	<form method="get" action="/boardCategorias/insert">
		版面類別名稱：<input type = "text" name ="name"/><br><br>
		<br>
		<input type = "submit" value = "送出表單"/><input type="button" value="回列表" onclick="location.href='/boardCategorias/list'">
		
	</form>
	${ message }
	
	

</body>
</html>