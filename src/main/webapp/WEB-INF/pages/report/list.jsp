<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/resources/js/jquery-1.11.3.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Report List</title>
<style type="text/css">
table {
	border-collapse: collapse;
	margin: 20px;
}

td, th {
	border: 1px solid blue;
	padding: 5px;
}
</style>
<script>
	$(function() {

		$("#showall").click(
				function() {
					$.ajax({
						type : "get",
						url : "/reports/show",
						dataType : "json",
						contentType : "application/json",
						data : {},
						success : function(data) {
							// 					console.log(data);
							var mytbody = $("#maintable>tbody");
							$.each(data, function(index, value) {
								console.log("index=" + index);
								console.log(value);
								console.log(value.id);
								console.log(value.user.name);
								var td1 = $("<td></td>").text(value.id);
// 								var td2 = $("<td></td>").text(value.user.name);
								var td2 = $("<td></td>").html("<a href='#'>"+value.user.name+"</a>");
								var td3 = $("<td></td>").text(value.article);
								var td4 = $("<td></td>").text(
										new Date(value.reportTime).toString().substring(0, 25));
								if(value.isPassed == null){
									var td5 = $("<td></td>").text("尚未審核");
								} else if(value.isPassed == 'T'){
									var td5 = $("<td></td>").text("通過");
								} else {
									var td5 = $("<td></td>").text("未通過");
								}
								if (value.admin != null) {
									var td6 = $("<td></td>").text(
											value.admin.name);
								} else {
									td6 = $("<td></td>").text("無");
								}
								var tr = $("<tr></tr>").append(td1, td2, td3,
										td4, td5, td6);
								$(mytbody).append(tr);
							})
						}
					});
				});
		$("#unread").click(function() {
			// 			alert("click");
			$.ajax({
				type : "get",
				url : "/reports/unread",
				dataType : "json",
				contentType : "application/json",
				data : {},
				success : function(data) {
					console.log(data);
				}
			});
		})
	});
</script>
</head>
<body>
	<a href="#" id="showall">所有檢舉</a>
	<a href="#" id="unread">未審核檢舉</a><br>
	***表單依檢舉時間排列(晚>>早)***
	<!-- 	<a href="/reports/editold">修改已審核檢舉(*)</a> -->
	<br />
	<table id="maintable">
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
		<tbody>
		</tbody>
		<%-- 		<c:forEach items="${list}" var="item"> --%>
		<!-- 			<tr> -->
		<%-- 				<td>${item.id}</td> --%>
		<%-- 				<td>${item.user.name}</td> --%>
		<%-- 				<td>${item.article}</td> --%>
		<%-- 				<td>${item.reportTime}</td> --%>
		<%-- 				<td><c:choose> --%>
		<%-- 						<c:when test="${item.isPassed.toString() eq 'T'}">通過</c:when> --%>
		<%-- 						<c:when test="${item.isPassed.toString() eq 'F'}">未通過</c:when> --%>
		<%-- 						<c:otherwise>尚未審核</c:otherwise> --%>
		<%-- 					</c:choose></td> --%>
		<%-- 				<td><c:choose> --%>
		<%-- 						<c:when test="${not empty item.admin.id}">${item.admin.id}</c:when> --%>
		<%-- 						<c:otherwise>無</c:otherwise> --%>
		<%-- 					</c:choose></td> --%>
		<!-- 			</tr> -->
		<%-- 		</c:forEach> --%>
		<%-- 		<c:forEach items="${unreads}" var="item"> --%>
		<!-- 			<tr> -->
		<%-- 				<td>${item.id}</td> --%>
		<%-- 				<td>${item.user.name}</td> --%>
		<%-- 				<td>${item.article}</td> --%>
		<%-- 				<td>${item.reportTime}</td> --%>
		<!-- 				<td><input type="button" value="通過" id="pass" name="pass" -->
		<!-- 					class="btn btn-primary" -->
		<%-- 					onclick="javascript:location.href='/reports/edit?id=${item.id}&passed=T'"> --%>
		<!-- 					<input type="button" value="不通過" id="notpass" name="notpass" -->
		<!-- 					class="btn btn-warning" -->
		<%-- 					onclick="javascript:location.href='/reports/edit?id=${item.id}&passed=F'" /> --%>
		<!-- 				</td> -->
		<%-- 				<td><c:choose> --%>
		<%-- 						<c:when test="${not empty item.admin.id}">${item.admin.id}</c:when> --%>
		<%-- 						<c:otherwise>無</c:otherwise> --%>
		<%-- 					</c:choose></td> --%>
		<!-- 			</tr> -->
		<%-- 		</c:forEach> --%>
	</table>

</body>

</html>