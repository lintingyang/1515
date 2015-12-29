<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script type="text/javascript" src="/resources/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="width: 600px;margin:auto;">
	<table class="table" border="1">
		<thead>
			<tr>
				<td>id</td>
				<td>user</td>
				<td>question</td>
				<td>answer</td>
				<td>admin</td>
				<td>create_date</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ adminQA }" var="result">
				<tr>
					<td>${ result.id }</td>
					<td>${ result.user.account }</td>
					<td>${ result.question }</td>
					<td>${ result.answer }</td>
					<td>${ result.admin.account }</td>
					<td>${ result.createdDate }</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	</div>
</body>
</html>