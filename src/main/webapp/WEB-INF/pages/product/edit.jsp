<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product Edit</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

td, th {
	border: 1px solid blue;
}
</style>
<script type="text/javascript"> 
window.onload = function(){
	var status = document.getElementsByTagName("p").firstChild.nodeValue;
		alert(status);	
}

</script>
</head>
<body>
	<form action="/products/query" method="get">
		關鍵字(產品名稱、交換地、使用者名稱、產品類別)：
		<input type="text" name="pname">
		<input type="submit" value="search"><hr>
	</form>
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
			</tr>
		</thead>
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
				<td>
					<p>${p.postStatus}</p>
					<input type="radio" name="status${p.id}" value="T" checked="checked">刊登
					<input type="radio" name="status${p.id}" value="F" >下架
					<input type="button" id="edit" value="確定修改">
				</td>
				<td>${p.tradeStatus}</td>
				<td>${p.clickTimes}</td>
				<td>${p.exchange.id}</td>
				<td>${p.product.id}</td>
				<td>${p.userByItemOwnerId.id}</td>
				<td>${p.tradeFinishedTime}</td>
				<td>${p.grade}</td>
				<td>${p.gradeTime}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>