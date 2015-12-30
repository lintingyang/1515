<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/js/jquery-1.11.3.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$("#div1 a").click(function(event) {
			var p = $(this).text();
			$.ajax({
				type : "post",
				contentType : 'application/json',
				url : '/products/query2',
				dataType : 'json',
				data : JSON.stringify({
					'name' : p
				}),
				success : function(data) {
					var counter=0;
					 $.each(data, function() {
// 						 alert(this.name);
						 counter++;
						    $("#p"+counter).text(this.name);
					    });
				}
			});
		});
	})
</script>

<title>e5e7</title>
</head>
<body>
<div class="row">
  <div class="col-md-2" id="div1">
  <ul>
  <c:forEach items="${productCategory}" var="p">
  
  <li ><a href="#">${p.name}</a></li>
  </c:forEach>
  </ul>
  
  
  </div>
  <div class="col-md-2" id="p1"></div>
  <div class="col-md-2" id="p2"></div>
  <div class="col-md-2" id="p3"></div>
  <div class="col-md-2" id="p4"></div>
  
  
  
  <div class="col-md-2">.col-md-2</div>
</div>

</body>
</html>