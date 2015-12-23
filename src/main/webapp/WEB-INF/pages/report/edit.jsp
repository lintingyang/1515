<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Report List</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

td, th {
	border: 1px solid blue;
	padding: 5px;
}
</style>
</head>
<body>
	<a href="/reports/list">所有檢舉</a>
	<a href="/reports/unread">未審核檢舉</a>
	<a href="/reports/editold">修改已審核檢舉(*)</a>
	<br />
	<table>
		<thead>
			<tr>
				<th>編號</th>
				<th>檢舉者</th>
				<th>檢舉內文</th>
				<th>檢舉時間</th>
				<th>是否通過</th>
				<th>審核者</th>
			</tr>
		</thead>
		<c:if test="${!empty edits.id}" >
			<tr>
				<td>${edits.id}</td>
				<td>${edits.user.name}</td>
				<td>${edits.article}</td>
				<td>${edits.reportTime}</td>
				<td><c:choose>
						<c:when test="${edits.isPassed.toString() eq 'T'}">通過</c:when>
						<c:when test="${edits.isPassed.toString() eq 'F'}">未通過</c:when>
						<c:otherwise>尚未審核</c:otherwise>
					</c:choose></td>
				<td><c:choose>
						<c:when test="${not empty edits.admin.id}">${edits.admin.id}</c:when>
						<c:otherwise>無</c:otherwise>
					</c:choose></td>
			</tr>
		</c:if>
	</table>

</body>
</html>