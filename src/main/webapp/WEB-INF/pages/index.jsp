<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script type="text/javascript" src="/resources/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 50%;border: 1px gray solid;margin:auto;">
		<a href="/admins/login">登入</a> <a href="/admins/logout">登出</a> 使用者 ${ admin.name }
		<br> <a href="/admins/list">admins</a> <a href="/boards/list">boards</a>
		<a href="/adminquestionandanswers/list">Question And Answer</a>
	</div>
</body>
</html>