<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="/admins/check">
帳號：<input type="text" name="account"><br>
密碼：<input type="text" name="password"><br>
<input type="submit">
${ error }
${ admin.account }

</form>
</body>
</html>