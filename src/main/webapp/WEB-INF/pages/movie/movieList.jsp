<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<form id="theForm" action="/movies/query" method="get">
		電影名稱: <input type="text" id="name" name="name"> 	電影類別: <input type="text" id="category" name="category">
		<input id="searchButton" type="button" class="primary-btn" value="Searching.."/>
	</form>
	
	<input type='button' id='addButton' value='Add'/>
	<table id="dataTable" class="table">
	<tr><td>Function</td><td>Category</td><td>Name</td></tr>
		
	</table>


</body>
<script language="javascript">
$('#searchButton').click(function() {
		console.log("searching...");
		$.ajax({
			headers: { 
		        'Accept': 'application/json',
		        'Content-Type': 'application/json' 
		    },
			url: '/movies/query',
			dataType:'json',
			type: 'post',
			data: JSON.stringify({name:$("#name").val()}),
			success: function(data) {
				console.log(data);
				
				$.each(data, function(idx, item) {
					$("#dataTable").append('<tr><td>'+item.id+'</td>'
											+'<td>'+item.category+'</td>'
											+'<td>'+item.name+'</td></tr>');
				});
				
			}
			
			
		});
		
		
});


</script>


</html>