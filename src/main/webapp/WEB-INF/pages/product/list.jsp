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
<script type="text/javascript">
	$(function() {
		$("#btnSe").click(function() {
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
					$('tbody').html('');
					var myBody = $('tbody');
					var pId = $('<td></td>').text(data.id);
					var pIdValue = $('<td></td>').text();
					var pName = $('<td></td>').text(data.name);
					var pCategoryId = $('<td></td>').text(data.productCategory.id);
					var pCategoryName = $('<td></td>').text(data.productCategory.name);
					var pUserByUserId = $('<td></td>').text(data.userByUserId.id);
					var pUserByUserIdName = $('<td></td>').text(data.userByUserId.name);
					var pPostTime = $('<td></td>').text(data.postTime);
					var pDeadline = $('<td></td>').text(data.deadline);
					var pLocation = $('<td></td>').text(data.location);
					var pTradeWay = $('<td></td>').text(data.tradeWay);
					var pWishItem = $('<td></td>').text(data.wishItem);
					var pPostStatus = $('<td></td>').text(data.postStatus);
					var pPostStatusBtn = $('<input></input>').attr('type','button').attr('value','修改狀態').attr('id','btnUp');
					$(pPostStatus).append(pPostStatusBtn);
					var pClickTimes = $('<td></td>').text(data.clickTimes);
					var pDelete = $('<td></td>')
					var pDeleteBtn = $('<input></input>').attr('type','button').attr('value','刪除產品').attr('id','btnDe');
					$(pDelete).append(pDeleteBtn);					
					var bodyTr = $('<tr></tr>').append([pId,pName,pCategoryId,pCategoryName,pUserByUserId,pUserByUserIdName,pPostTime,pDeadline,pLocation,pTradeWay,pWishItem,pPostStatus,pPostStatus,pClickTimes,pDelete]);
					$(myBody).append(bodyTr);
					var i =JSON.stringify({
	 					id : $("#pId").val()
	 				})
					
	 				$("#btnDe").click(function() {
			 			$.ajax({
			 				type : "POST",
			 				contentType : 'application/json',
			 				url : '/products/delete1',
			 				dataType : 'text',
			 				data : i,
			 				success : function(data) {
			 					$('table').html('');
			 					var body = $('body');
			 					var message = $('<h3></h3>').text(data);
			 					$(body).append(message);
			 				}
			 			});
					});
					$("#btnUp").click(function() {
						pPostStatus.html('').text(data.postStatus);
						var st = data.postStatus;
						var select = $('<select></select>').attr('name','pPs').attr('id','pPsId');
						var optionT = $('<option></option>').attr('value','T').text('T');
						var optionF = $('<option></option>').attr('value','F').text('F');
						$(select).append([optionT,optionF]);
						var statusFC = $('<input></input>').attr('type','button').attr('value','確認修改').attr('id','btnUpF');
						$(pPostStatus).append([select,statusFC]);
						$('#pPsId').val(st);
						
						$("#btnUpF").click(function() {
							var stF = $('#pPsId').val();
				 			$.ajax({
				 				type : "POST",
				 				contentType : 'application/json',
				 				url : '/products/update1',
				 				dataType : 'json',
				 				data : JSON.stringify({
				 					id : $("#pId").val(),
				 					postStatus : $('#pPsId').val()
				 				}),
				 				success : function(data) {
				 					alert("update successful!!!")
				 					pPostStatus.html('').text(data.postStatus);
									$(pPostStatus).append(pPostStatusBtn);
// 				 					$('table').html('');
// 				 					var body = $('body');
// 				 					var message = $('<h3></h3>').text(data);
// 				 					$(body).append(message);
				 				}
				 			});
						});
					});
				}
			});
		});
		
	})
</script>
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
	<input type="button" value="回商品清單列表" onclick="javascript:location.href='list'">
	<hr>

	<form id="search-form">
		id查詢:<input type="text" name="id" id="pId" /> <input type="button"
			value="searchById" id="btnSe" />
	</form>
	<hr>

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
				<th>點擊次數</th>
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
					<td>${p.clickTimes}</td>
					<td><input type="button" value="刪除產品"
						onclick="javascript:location.href='delete?id=${p.id}'"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>