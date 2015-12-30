<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery-1.11.3.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List</title>
</head>
<body>


	<form action="/boardCategorias/query" method="get">
		輸入ID搜尋版面:<input type="text" name="id">
		<input id="searchButton" type="button" class="primary-btn" value="Searching.."/>
	</form>
<!-- 	<button type="button" onclick="location.href='/boardCategorias/add'">新增版面類別</button> -->

<%-- 	<c:if test="${!empty beans}"> --%>
<!-- 		<table> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>id</th> -->
<!-- 					<th>name</th> -->
<!-- 					<th>edit</th> -->
<!-- 					<th>createdDate</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 				<c:forEach var="s" items="${beans}"> --%>
<!-- 					<tr> -->
<%-- 						<td>${s.id}</td> --%>
<%-- 						<td>${s.name}</td> --%>
<!-- 						<td><input type="button" value="修改名稱" -->
<%-- 							onclick="javascript:location.href='/boardCategorias/edit?id=${ s.id }'"> --%>
<!-- 						</td> -->
<%-- 						<td>${s.createdDate}</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->
<%-- 	</c:if> --%>
	Ajax
	<table id="simpleTable">
		<thead>
		<tr>
			<th>id</th>
			<th>name</th>
			<th>edit</th>
			<th>createdDate</th>
		</tr>
	</thead>
	<tbody>
	
	</tbody>
	</table>
<script language="javascript">
$('#searchButton').click(function() {
		console.log("searching...");
		$.ajax({
			contentType:'application/json',
			url: '/boardCategorias/query',
			dataType:'json',
			type: 'post',
			data: JSON.stringify({id:$("#id").val()}),
			success: function(data) {
				console.log(data);
				var mytbody = $('#simpleTable>tbody');
				
				$.each(data,function(i,datas){
				var temp1 = $("<td></td>").text(datas.id);	
				var temp2 = $("<td></td>").text(datas.name);	
				var temp3 = $("<td></td>").text(datas.edit);	
				var temp4 = $("<td></td>").text(datas.createdDate);	
				var maTr = $("<tr></tr>").append([temp1,temp2,temp3,temp4]);
				
				$(mytbody).append(maTr);
					
				})
			}			
		});	
});


</script>
<%-- 	<c:if test="${!empty boards}"> --%>
<!-- 		<table> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>id</th> -->
<!-- 					<th>name</th> -->
<!-- 					<th>createdDate</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 				<c:forEach var="s" items="${boards}"> --%>
<!-- 					<tr> -->
<%-- 						<td>${s.id}</td> --%>
<%-- 						<td>${s.name}</td> --%>
<%-- 						<td>${s.createdDate}</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->
<%-- 	</c:if> --%>

</body>
</html>