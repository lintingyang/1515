<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/jquery-1.11.3.js"></script>  
<script src="/resources/js/bootstrap.min.js"></script>
<script>
$(function(){    
	$("#btn").click(function(){
		event.preventDefault();
	 	var formData={"id":$("#id").val(),"message":$("#message").val()}
        $.ajax({
           type: "GET",
           url: "http://localhost:8080/chats/insertM",
           data: formData,
           success: function(data){
        	   alert(data);
           },
           dataType: "json",
           contentType : "application/json"
         });
    });
	 
});
</script>
<title>List</title>
</head>


<body>

<form  action="/chats/insert" method="post" enctype="multipart/form-data">
	<input type="text" name="id" size="5" placeholder="使用者ID" required>
	<input type="text" name="message" required><br>
	<input type="file" name="file"  required/><br>
	<input type="submit" value="輸入">
</form>
<br>
<form id="myForm" enctype="multipart/form-data">
	<input type="text" id="id" name="id" size="5" placeholder="使用者ID" required>
	<input type="text" id="message" name="message" required><br>
	<input type="submit" id="btn" value="輸入">
</form>
	<c:if test="${!empty beans}">
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>user</th>
					<th>messages</th>
					<th>picture</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${beans}">
					<tr>
						<td>${s.id}</td>
						<td>${s.user.name}</td>
						<td>${s.messages}</td>
						<td><img src="${s.picture}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>


</body>
</html>