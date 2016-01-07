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
<!-- 	<nav style="text-align: center;"> -->
<!-- 		<ul class="pagination"> -->
<!-- 			<li><a href="#" aria-label="Previous"> <span -->
<!-- 					aria-hidden="true">&laquo;</span> -->
<!-- 			</a></li> -->
<!-- 			<li><a href="#">1</a></li> -->
<!-- 			<li><a href="#">2</a></li> -->
<!-- 			<li><a href="#">3</a></li> -->
<!-- 			<li><a href="#">4</a></li> -->
<!-- 			<li><a href="#">5</a></li> -->
<!-- 			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> -->
<!-- 			</a></li> -->
<!-- 		</ul> -->
<!-- 	</nav> -->

<!--
<script>
					$.ajax({
						contentType : 'application/json',
						url : '/product/query',
						dataType : 'json',
						type : 'post',
						data : JSON.stringify({
							id : $("#id").val()
						}),
						success : function(data) {
							console.log(data);
							var mytbody = $('#simpleTable>tbody');

							$.each(data, function(i, datas) {
								var temp1 = $("<td></td>").text(datas.id);
								var temp2 = $("<td></td>").text(datas.name);
								var temp3 = $("<td></td>").text(datas.tradeWay);
								var temp4 = $("<td></td>").text(datas.description);
								var maTr = $("<tr></tr>").append(
										[ temp1, temp2, temp3 , temp4]);
								$(mytbody).append(maTr);
							})
						}
					});
	</script>
	  -->
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
		}
		
	});	
});
	</script>
</div>

<c:import url="/WebContent/layout/footer.jsp"></c:import>