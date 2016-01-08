<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>

<div class="container" style="margin: 50px auto;">
	<div class="container">
		<ul class="nav nav-tabs" id="tabs">
			<li style="width: 25%; text-align: center;"><a class="list" href="#">已刊登</a></li>
			<li style="width: 25%; text-align: center;"><a class="list" href="#">未刊登</a></li>
			<li style="width: 25%; text-align: center;"><a class="list" href="#">待交換</a></li>
			<li style="width: 25%; text-align: center;"><a class="list" href="#">已交換</a></li>
		</ul>
	</div>
	<br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-3"> -->
<!-- 					<div class="prolist" -->
<!-- 						onclick="location.href='/WebContent/product/product.jsp';"> -->
<!-- 						<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-3"> -->
<!-- 					<div class="prolist"> -->
<!-- 						<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-3"> -->
<!-- 					<div class="prolist"> -->
<!-- 						<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-3"> -->
<!-- 					<div class="prolist"> -->
<!-- 						<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
	</div>
</div>
	  
<script type="text/javascript">

$('.list').click(function() {
	
	console.log("list = "+ $(this).text());
	
	$.ajax({
		contentType:"application/json",
		url:"/product/query1",
		dataType :"json",
		type:"get",
		data:{ "query" : $(this).text()},
		success: function(data){
			console.log(data);
			
		$("#itemContainer").html('');
		$.each(data,function(i){
			var productdiv = $("<div></div>");
			var aclick = $("<a>").attr("href","/product/"+data[i].id);
			var productimg = $("<img>").addClass("prodimg");
			$(aclick).text(data[i].name).append($(productimg));
			$(productdiv).addClass("proddiv").append($(aclick));
			
			$("#itemContainer").append(productdiv);
				
			})	
			
		}
		
	});	
});
	</script>
	
<script>
	$(function() {
		$("div.holder").jPages({
			containerID : "itemContainer",
			perPage : 8,
 			fallback: 500,
 			first: "第一頁",
 			previous: "上一頁",
 			next: "下一頁",
 			last: "最後頁",
		});

	});
	
	
	
</script>
</div>

<c:import url="/WebContent/layout/footer.jsp"></c:import>