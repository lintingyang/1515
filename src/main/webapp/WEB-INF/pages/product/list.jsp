<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/products/query" method="get">
		產品名稱：<input type="text" name="id"><input type="submit"
			value="submit" id="btn"> <br>
	</form>
	<table style="border: 1px solid blue;">
		<thead>
			<tr>
				<th>編號</th>
				<th>名稱</th>
				<th>類別</th>
				<th>使用者</th>
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
				<td style="border: 1px solid blue;">${p.id}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.category_id}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
				<td style="border: 1px solid blue;">${p.name}</td>
			</tr>
		</c:forEach> 
	</table>
</body>
</html>