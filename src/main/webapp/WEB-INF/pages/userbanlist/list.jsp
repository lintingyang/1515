<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/js/jquery-1.11.3.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>


	<form id="theForm" action="/userbanlists/query" method="get">
		輸入帳號<input type="text" id="id" name="id"><br>
		<input id="searchButton" type="button" class="primary-btn" value="Searching.."/>
	</form>
	

	他的黑名單:
	<table id="simpleTable">
		<thead>
		<tr>
			<th>ID</th>
			<th>UserAId</th>
			<th>UserBId</th>
		</tr>
	</thead>
	<tbody>
	
	</tbody>

	</table>



</body>

<script src="/resources/js/jquery-1.11.3.js"></script>
<script src="/resources/js/bootstrap.min.js" ></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script language="javascript">
$('#searchButton').click(function() {
		console.log("searching...");
		$.ajax({
			contentType:'application/json',
			url: '/userbanlists/query',
			dataType:'json',
			type: 'post',
			data: JSON.stringify({id:$("#id").val()}),
			success: function(data) {
				console.log(data);
				var mytbody = $('#simpleTable>tbody');
				
				$.each(data,function(i,datas){
				var temp1 = $("<td></td>").text(datas.id);	
				var temp2 = $("<td></td>").text(datas.userByUserAId.id);	
				var temp3 = $("<td></td>").text(datas.userByUserBId.id);	
				var maTr = $("<tr></tr>").append([temp1,temp2,temp3]);
				
				$(mytbody).append(maTr);
					
					
					
				})
			}			
		});	
});



</script>


</html>