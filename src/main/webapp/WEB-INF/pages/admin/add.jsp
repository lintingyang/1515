<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add</title>
</head>
<body>
	<form method="get" action="/admins/insert">
		姓名：<input type = "text" name ="name"/><br><br>
		帳號：<input type = "text" name ="account"/><br><br>
		密碼：<input type = "text" name ="password"/><br><br>
		信箱：<input type = "text" name ="email"/><br><br>
		權限：<select name = "authority">
			<option value="a">最高權限</option>
			<option value="b">中等權限</option>
			<option value="c">客服權限</option>
			<option value="d">討論區版主</option>
			<option value="e">無權限</option> 
		</select><br>
		<br>
		<input type = "submit" value = "送出表單"/><input type="button" value="回列表" onclick="location.href='/admins/list'">
		
	</form>
	${ message }
	
	

</body>
</html>