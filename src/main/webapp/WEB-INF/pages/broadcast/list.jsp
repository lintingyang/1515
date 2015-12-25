<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/jquery-1.11.3.js"></script>  
<script src="/resources/js/bootstrap.min.js"></script>
<script>
$(function(){    
	 $("#btn").click(function(){
		 	var formData = JSON.stringify($("#myForm").serializeArray());
		 	formData={"id":"1","broadcastDescription":"test"};
	        $.ajax({
	           type: "GET",
	           url: "http://localhost:8080/broadcasts/insert",
	           data: formData,
	           success: function(data){
	        	   drawTable(data);
	           },
	           dataType: "json",
	           contentType : "application/json"
	         });
	    });
	 
	 function drawTable(data) {
		 var obj = JSON.stringify(data);
		 console.log(obj);
		 $.each($.parseJSON(data), function() {
		        alert(this.id + " ");
		    });
		
		}
});
</script>
</head>
<body>

	<form id="myForm">
		<input type="text" name="id" size="5" placeholder="使用者ID">
		<input type="text" name="broadcastDescription">
	</form>
	<button id="btn">輸入</button>
<div id="div1">
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>user</th>
				<th>broadcastDescription</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="s" items="${beans}">
				<tr>
					<td>${s.id}</td>
					<td>${s.user.name}</td>
					<td>${s.broadcastDescription}</td>
					<td><input type="submit" value="Delete" 
   					onclick="window.location='delete?id=${s.id}';" />  </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>



</body>
</html>