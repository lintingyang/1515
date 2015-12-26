<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<!-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script type="text/javascript" src="/resources/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>

	<!-- <form  action="/admins/upload" method="post" enctype="multipart/form-data"> -->
	<!-- 	<input type="text" name="id" size="5" placeholder="使用者ID"> -->
	<!-- 	<input type="text" name="message"><br> -->
	<!-- 	<input type="file" name="file" /><br> -->
	<!-- 	<input type="submit" value="輸入"> -->
	


<form id="search-form">
	帳號查詢:<input type="text" name="account" id="account"/>
	<input type="button" value="submit" id="submittn" name="submit">
</form>


<script>

$("#submittn").click(function(){
	console.log("search!");
	$.ajax({
		type:"post",
		contentType:'application/json',
		url:'/admins/query',
		dataType:'json',
		data:JSON.stringify({account:$("#account").val()}),
	    success : function(data){
	    	console.log(data);
	    }
	})
})

</script>


<!-- 	<form action="/admins/query" method="get"> -->
<!-- 		帳號搜尋:<input type="text" name="account" id="account"> <input -->
<%-- 			id="searchbtn" type="submit">${ error } --%>
<!-- 	</form> -->
	<button type="button" onclick="location.href='/admins/add'">新增管理員</button>


	<table border="1">
		<tr>
			<th>edit</th>
			<th>id</th>
			<th>account</th>
			<th>password</th>
			<th>name</th>
			<th>email</th>
			<th>authority</th>
			<th>delete</th>
		</tr>
		<c:forEach items="${ entity }" var="result">
			<tr>
				<td><input type="button" value="修改"
					onclick="javascript:location.href='/admins/edit?id=${ result.id }'">
				</td>
				<td>${ result.id }</td>
				<td>${ result.account }</td>
				<td>${ result.password }</td>
				<td>${ result.name }</td>
				<td>${ result.email }</td>
				<td>${ result.authority }</td>
				<td><input type="button" value="刪除"
					onclick="javascript:location.href='/admins/delete?id=${ result.id }'">
				</td>

			</tr>

		</c:forEach>
	</table>
</body>
</html>