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
div{
	padding-bottom: 20px;
}
label{
	width:150px;
	float:left;
	text-align: center;
}
</style>
</head>
<body>
	<form action="/products/query" method="get">
		關鍵字(產品名稱、交換地、使用者名稱、產品類別)： <input type="text" name="pKeywords"> <input
			type="submit" value="search">
	</form>
	<hr>
	<form action="/products/add">
		<input type="submit" value="新增產品">
	</form>
	<input type="button" value="回商品清單列表" onclick="javascript:location.href='list'">
	<hr>
	<form action="/products/insert">
		<div>
			<label>產品名稱：</label><input type="text" name="name" size="30">
		</div>
		<!-- <div>
			<label>使用者：</label><input type="text" name="user" size="10">
		</div>
		<div>
			<label>產品類別：</label>
			<select name="category">
				<option value="1">3C</option>
				<option value="2">家電</option>
				<option value="3">傢俱</option>
				<option value="4">文具</option>
				<option value="5">日常生活用品</option>
				<option value="6">課本書籍</option>
				<option value="7">影音遊戲片</option>
				<option value="8">票券</option>
				<option value="9">體育用品</option>
				<option value="10">食品</option>
				<option value="11">美妝</option>
			</select>
		</div> -->
		<div>
			<label>刊登截止日期：</label><input type="text" name="deadline">
		</div>
		<div>
			<label>交換地點：</label><input type="text" size="50" name="location">
		</div>
		<div>
			<label>交換方式：</label><input type="text" size="20" name="tradeWay">
		</div>
		<div>
			<label>慾望清單：</label><textarea rows="4" cols="50" name="wishItem"></textarea>
		</div>
		<!-- <div>
			<label>圖片：</label><input type="file" name="picture" multiple>
		</div>
		<div>
			<label>影片：</label><input type="file" name="video">
		</div> -->
		<div>
			<input type="submit" value="送出">
		</div>
	</form>
	${result}
</body>
</html>