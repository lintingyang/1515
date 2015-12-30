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
		success: function(data) {
			console.log(data);
			$.each(data,function(i,datas){
				var editbtn = $("<td></td>").html('<input type="button" name="edit" value="修改" >');
				var temp1 = $("<td></td>").text(datas.id);	
				var temp2 = $("<td></td>").text(datas.account);
				var temp3 = $("<td></td>").text(datas.password);
				var temp4 = $("<td></td>").text(datas.name);
				var temp5 = $("<td></td>").text(datas.email);
				var temp6 = $("<td></td>").text(datas.authority);
				var deletebtn = $("<td></td>").html('<input type="button" name="delete" value="刪除" >');
				var maTr = $("<tr></tr>").append([editbtn,temp1,temp2,temp3,temp4,temp5,temp6,deletebtn]);
				$("#mytbody").html(maTr);
				
				$("input[name = edit]").bind("click",function(){
					javascript:location.href='/admins/edit?id='+datas.id;
				})
				
				$("input[name = delete]").bind("click",function(){
					
					javascript:location.href='/admins/delete?id='+datas.id;
					alert("delete");
				})
			})
			
		
		}
	})
})

</script>


<!-- 	<form action="/admins/query" method="get"> -->
<!-- 		帳號搜尋:<input type="text" name="account" id="account"> <input -->
<%-- 			id="searchbtn" type="submit">${ error } --%>
<!-- 	</form> -->
	<button type="button" onclick="location.href='/admins/add'">新增管理員</button>


	<table border="1" id="simpleTable">
	<thead>
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
		</thead>
		<tbody id="mytbody">
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
		</tbody>
	</table>
</body>
</html>