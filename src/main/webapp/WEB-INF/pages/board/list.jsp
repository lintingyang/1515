<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List</title>
</head>
<body>


	<form action="/boards/query" method="get">
		輸入ID版面帖子搜尋:<input type="text" name="id"> <input
			id="searchButton" type="button" class="primary-btn"
			value="Searching.." />5
	</form>

	<button type="button" onclick="location.href='/boards/add'">新增版面</button>
	<hr>
	<button type="button" onclick="location.href='/boards/list'">顯示全部版面(依ID排序)</button>
	<button type="button" onclick="location.href='/boards/list2'">顯示全部版面(依名稱排序)</button>
	<c:if test="${!empty beans}">
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>createdDate</th>
					<th>description</th>
					<th>threadCount</th>
					<th>replyCount</th>
					<th>boardCategoria</th>
					<th>isCream</th>
					<th>isHide</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${beans}">
					<tr>
						<td>${s.id}</td>
						<td>${s.name}</td>
						<td>${s.createdDate}</td>
						<td>${s.description}</td>
						<td>${s.threadCount}</td>
						<td>${s.replyCount}</td>
						<td>${s.boardCategoria}</td>
						<td><input type="button" value="${s.isCream}"
							onclick="javascript:location.href='/boards/edit?id=${s.id}&ch=${s.isCream}'" /></td>
						<td><input type="button" value="${s.isHide}"
							onclick="javascript:location.href='/boards/edit1?id=${s.id}&ch=${s.isHide}'" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	Ajax
	<table id="simpleTable">
		<thead>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>createdDate</th>
				<th>description</th>
<!-- 				<th>threadCount</th> -->
<!-- 				<th>replyCount</th> -->
<!-- 				<th>boardCategoria</th> -->
<!-- 				<th>isCream</th> -->
<!-- 				<th>isHide</th> -->
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
	<script language="javascript">
		$('#searchButton').click(
				function() {
					console.log("searching...");
					$.ajax({
						contentType : 'application/json',
						url : '/boardCategorias/query',
						dataType : 'json',
						type : 'post',
						data : JSON.stringify({
							id : $("#id").val()
						}),
						success : function(data) {
							console.log(data);
							var mytbody = $('#simpleTable>tbody');

							$.each(data, function(i, datas) {
								var temp1 = $("<td></td>").text(datas.id);
								var temp2 = $("<td></td>").text(datas.name);
								var temp3 = $("<td></td>").text(datas.createdDate);
								var temp4 = $("<td></td>").text(datas.description);
								var maTr = $("<tr></tr>").append(
										[ temp1, temp2, temp3 , temp4]);
								$(mytbody).append(maTr);
							})
						}
					});
				});
	</script>

</body>
</html>