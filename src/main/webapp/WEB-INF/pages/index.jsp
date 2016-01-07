<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<div class="container" style="margin: 50px auto;">
	<div class="container">
		<ul class="nav nav-tabs" id="tabs">
			<li style="width: 25%; text-align: center;"><a class="categorylist" href="#">熱門</a></li>
			<li style="width: 25%; text-align: center;"><a class="categorylist" href="#">最新</a></li>
			<li style="width: 25%; text-align: center;"><a class="categorylist" href="#">誠信</a></li>
			<li style="width: 25%; text-align: center;"><a class="categorylist" href="#">推薦</a></li>
		</ul>
	</div>
	<br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" id="productlist">
		
		

		
		
			<div class="row">
				<div class="col-md-3">
					<div class="prolist"
						onclick="location.href='/WebContent/product/product.jsp';">
						<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/01.jpg">雙雙的Mac
					</div>
				</div>
			</div>




			<div class="row">
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/01.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/01.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/01.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/01.jpg">雙雙的Mac
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/01.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/01.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/01.jpg">雙雙的Mac
					</div>
				</div>
				<div class="col-md-3">
					<div class="prolist">
						<img class="prodimg" src="/resources/imgs/01.jpg">雙雙的Mac
					</div>
				</div>
			</div>
			
			
			
			
			
			
		</div>
	</div>
	<nav class="alignCenter">
		<ul class="pagination">
			<li><a href="#" aria-label="Previous"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>

</div>




<script type="text/javascript">

$('.categorylist').click(function() {
	
	console.log("category = "+ $(this).text());
	
	
	$.ajax({
		contentType:"application/json",
		url:"/query",
		dataType :"json",
		type:"get",
		data:{ "orderby" : $(this).text()},
		success: function(data){
			console.log(data[0]);
		}
		
	});
	
// 	$.ajax({
// 		contentType:'application/json',
// 		url: '/users/query',
// 		dataType:'json',
// 		type: 'post',
// 		data: JSON.stringify({account:$("#account").val()}),
// 		success: function(data) {
// 			console.log(data);
// 			var mytbody = $('#simpleTable>tbody');
			
			
// 			var temp1 = $("<td></td>").text(data.id);	
// 			var temp2 = $("<td></td>").text(data.name);	
// 			var temp3 = $("<td></td>").text(data.account);	
// 			var temp4 = $("<td></td>").text(data.address);	
// 			var temp5 = $("<td></td>").text(data.schoolEmail);	
// 			var temp6 = $("<td></td>").text(data.gameScore);	
// 			var temp7 = $("<td></td>").text(data.onlineDatetime);	
// 			var temp8 = $("<td></td>").text(data.isolated);	
// 			var maTr = $("<tr></tr>").append([temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8]);
			
// 			$(mytbody).html(maTr);
				
				
				
			
// 		}			
// 	});	
});


</script>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>



