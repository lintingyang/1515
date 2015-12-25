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
	<table id="dataTable">
		
	</table>


</body>
<script language="javascript">
$('#searchButton').click(function() {
		console.log("searching...");
		$.ajax({
			contentType:'application/json',
			url: '/userbanlists/query',
			dataType:'json',
			type: 'post',
			data: JSON.stringify({"id":$("#id").val()}),
			success: function(data) {
				console.log(data);
			}			
		});	
});
// $(function(){
// 	$.ajax({
// 		'type':'get',  //post,delete
// 		'url':"/userbanlists/query",
// 		'dataType':'json',
// 		'data':{},
// 		'success':function(data){
// 			$(data).find('Category').each(function(){
// 				var tp = $("<option></option>").val($(this).children('CategoryID').text())
// 												.text($(this).children('CategoryName').text());
// 				$('#select1').append(tp);
// 			});
// 		}
// 	});

</script>


</html>