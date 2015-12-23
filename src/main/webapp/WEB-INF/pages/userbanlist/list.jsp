<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/userbanlists/query" method="get" id="searchForm">
		輸入帳號<input type="text" id="id" name="id"><br>
		<input type="button" value="送出" id="button1" >
	</form>
	
	他的黑名單:
<!-- 	<table> -->
<%-- 		<c:forEach items="${someOne}" var="temp"> --%>
<!-- 			<tr> -->
<%-- 				<td>${temp.userByUserAId.name}</td> --%>
<%-- 				<td>${temp.userByUserBId.name}</td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 	</table> -->
		<table id="table1">
			
		</table>




</body>
<script src="/resources/js/jquery-1.11.3.js"></script>
<script src="/resources/js/bootstrap.min.js" ></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script >
$('#button1').click(function(){
	$.ajax({ 
		    type: 'GET', 
		    url: '/userbanlists/query', 
		    dataType: 'json',
		    contentType: "application/json", 
		    data: JSON.stringify({ id:$('#id').val()}),  
		    done: function(data) { 
// 				$("#table1").append("<tr>"+"<td>"+"</td>"+"</tr>");
		    	console.log(data);
		    }
		    
		 
		}); 
});
	


</script>


</html>