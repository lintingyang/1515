<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script type="text/javascript" src="/resources/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="width: 600px; margin: auto;">

		<button type="button" id="findallnull">未回覆提問</button>
		<table class="table" border="1">
			<thead>
				<tr>
					<td>edit</td>
					<td>id</td>
					<td>user</td>
					<td>title</td>
					<td>question</td>
					<td>answer</td>
					<td>admin</td>
					<td>create_date</td>
					<td>delete</td>
				</tr>
			</thead>
			<tbody id="mytbody">
				<c:forEach items="${ adminQA }" var="result">
					<tr>
				<td><input type="button" value="修改"
					onclick="javascript:location.href='/admins/edit?id=${ result.id }'">
				</td>
						<td>${ result.id }</td>
						<td>${ result.user.account }</td>
						<td>${ result.title }</td>
						<td>${ result.question }</td>
						<td>${ result.answer }</td>
						<td>${ result.admin.account }</td>
						<td>${ result.createdDate }</td>
						<td><input type="button" value="刪除"
					onclick="javascript:location.href='/admins/delete?id=${ result.id }'">
				</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>


	<script>
		$("#findallnull").click(function() {
			console.log("click!")
			$.ajax({
				type : "post",
				contentType : 'application/json',
				url : '/adminquestionandanswers/query',
				dataType : 'json',
				data : {},
				success : function(data) {
					console.log(data);
					$.each(data,function(i,datas){
						var editbtn = $("<td></td>").html('<input type="button" name="edit" value="修改" >');
						var temp1 = $("<td></td>").text(datas.id);	
						var temp2 = $("<td></td>").text(datas.user.account);
						var temp3 = $("<td></td>").text(datas.title);
						var temp4 = $("<td></td>").text(datas.question);
						var temp5 = $("<td></td>").text(datas.answer);
						var temp6 = $("<td></td>").text(datas.admin.account);
						var temp7 = $("<td></td>").text(datas.createdDate);
						var deletebtn = $("<td></td>").html('<input type="button" name="delete" value="刪除" >');
						var maTr = $("<tr></tr>").append([editbtn,temp1,temp2,temp3,temp4,temp5,temp6,temp7,deletebtn]);
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
			});

		})
	</script>
</body>
</html>