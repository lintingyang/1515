<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/js/jquery-1.11.3.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<title>Product List</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

td, th {
	border: 1px solid blue;
}
</style>
</head>
<body>
	<form action="/products/query" method="get">
		關鍵字(產品名稱、交換地、使用者名稱、產品類別)： <input type="text" name="pKeywords">
		<input type="submit" value="search">
	</form>
	<hr>

	<form action="/products/add">
		<input type="submit" value="新增產品">
	</form>
	<hr>
	
	<form id="search-form">
		id查詢:<input type="text" name="id" id="pId" /> 
		<input type="button" value="searchById" id="btnSe"/>
	</form>
	<hr>
	<script>
		$("#btnSe").click(function() {
			console.log("search.............");
			$.ajax({
				type : "post",
				contentType : 'application/json',
				url : '/products/query1',
				dataType : 'json',
				data : JSON.stringify({
					id : $("#pId").val()
				}),
				success : function(data) {
					console.log(data);
				}
			})
		})
	</script>

	<table style="border: 1px solid blue;">
		<thead>
			<tr>
				<th>編號</th>
				<th>名稱</th>
				<th>類別</th>
				<th>類別名稱</th>
				<th>使用者</th>
				<th>使用者名稱</th>
				<th>刊登時間</th>
				<th>截止日期</th>
				<th>交換地</th>
				<th>交換方式</th>
				<th>慾望清單</th>
				<th>刊登狀態</th>
				<th>交易狀態</th>
				<th>點擊次數</th>
				<th>交換編號</th>
				<th>交換商品編號</th>
				<th>交換商品使用者</th>
				<th>交換時間</th>
				<th>評比</th>
				<th>評比時間</th>
				<th>刪除產品</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${products}" var="p">
				<tr>
					<td>${p.id}</td>
					<td>${p.name}</td>
					<td>${p.productCategory.id}</td>
					<td>${p.productCategory.name}</td>
					<td>${p.userByUserId.id}</td>
					<td>${p.userByUserId.name}</td>
					<td>${p.postTime}</td>
					<td>${p.deadline}</td>
					<td>${p.location}</td>
					<td>${p.tradeWay}</td>
					<td>${p.wishItem}</td>
					<td>${p.postStatus}<input type="button" value="修改狀態"
						onclick="javascript:location.href='edit?id=${p.id}'">
					</td>
					<td>${p.tradeStatus}</td>
					<td>${p.clickTimes}</td>
					<td>${p.exchange.id}</td>
					<td>${p.product.id}</td>
					<td>${p.userByItemOwnerId.id}</td>
					<td>${p.tradeFinishedTime}</td>
					<td>${p.grade}</td>
					<td>${p.gradeTime}</td>
					<td><input type="button" value="刪除產品"
						onclick="javascript:location.href='delete?id=${p.id}'"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>