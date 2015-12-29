<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-1.11.3.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
	<form action="/users/query" method="get">
		查詢單一帳號:<input type="text" name="account" id="account"> 
		<input type="button" value="Search" id="searchButton">
	</form>
	
	<table id="simpleTable">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Account</th>
				<th>Address</th>
				<th>SchoolEmail</th>
				<th>GameScore</th>
				<th>onlineDatetime</th>
				<th>Isolated</th>
			</tr>
		</thead>
		
		<tbody>
			<c:choose>
				<c:when test="${!empty data}">
<!-- 					<tr> -->
<%-- 						<td>${findUser.id}</td> --%>
<%-- 						<td>${findUser.name}</td> --%>
<%-- 						<td>${findUser.account}</td> --%>
<%-- 						<td>${findUser.address}</td> --%>
<%-- 						<td>${findUser.schoolEmail}</td> --%>
<%-- 						<td>${findUser.gameScore}</td> --%>
<%-- 						<td>${findUser.onlineDatetime}</td> --%>
<%-- 						<td>${findUser.isolated}</td> --%>
<!-- 					</tr> -->
				</c:when>
				<c:otherwise>
					<c:forEach items="${getAllUser}" var="temp">
						<tr>
							<td>${temp.id}</td>
							<td>${temp.name}</td>
							<td>${temp.account}</td>
							<td>${temp.address}</td>
							<td>${temp.schoolEmail}</td>
							<td>${temp.gameScore}</td>
							<td>${temp.onlineDatetime}</td>
							<td>${temp.isolated}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	</tbody>
	</table>
<script type="text/javascript">

$('#searchButton').click(function() {
	console.log("searching...");
	$.ajax({
		contentType:'application/json',
		url: '/users/query',
		dataType:'json',
		type: 'post',
		data: JSON.stringify({account:$("#account").val()}),
		success: function(data) {
			console.log(data);
			var mytbody = $('#simpleTable>tbody');
			
			
			var temp1 = $("<td></td>").text(data.id);	
			var temp2 = $("<td></td>").text(data.name);	
			var temp3 = $("<td></td>").text(data.account);	
			var temp4 = $("<td></td>").text(data.address);	
			var temp5 = $("<td></td>").text(data.schoolEmail);	
			var temp6 = $("<td></td>").text(data.gameScore);	
			var temp7 = $("<td></td>").text(data.onlineDatetime);	
			var temp8 = $("<td></td>").text(data.isolated);	
			var maTr = $("<tr></tr>").append([temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8]);
			
			$(mytbody).append(maTr);
				
				
				
			
		}			
	});	
});


</script>

</body>
</html>