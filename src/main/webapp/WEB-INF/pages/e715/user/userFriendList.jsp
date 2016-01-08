<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">
<c:import url="/WEB-INF/pages/e715/layout/header.jsp" />



<div class="container" style="margin: 50px auto;">
	<div style="height: 250px">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<div class="row">
				<ul class="nav navbar-nav">
					<li><img class="img-circle" style="width: 200px;"
						src="${user.picture}"></li>
					<li><ul style="list-style: none;">
							<li><h4>${user.account}</h4></li>
							<li>${user.name}</li>
							<li>${user.schoolName}</li>
						</ul></li>
					<!--<li><span class="glyphicon glyphicon-plus">123</span></li> -->

				</ul>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
	
	
	<div class="col-md-12">
		<div>
			<!-- Nav tabs -->
			<br> <br>
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#" class="friendShip"
					aria-controls="home" role="tab" data-toggle="tab" id="123">好友名單</a></li>
				<li role="presentation"><a href="#" class="friendShip"
					aria-controls="profile" role="tab" data-toggle="tab" id="456">黑名單</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="holder"></div>
			<div id="itemContainer"></div>
			<div class="holder"></div>
		</div>
	</div>
</div>

<script type="text/javascript">

$(function() {
	$.ajax({
		contentType : "application/json",
		url : "/E715Member/userFriendList",
		dataType : "json",
		type : "post",
		data : "",
		success : function(data) {
			console.log(data);
 				}
 			});
		});



	$('.friendShip').click(function() {
		if($(this).text().equal("好友名單")){
		$.ajax({
			contentType : "application/json",
			url : "/E715Member/userFriendList",
			dataType : "json",
			type : "get",
			data : "",
			success : function(data) {
				console.log(data);
					}
				});
		}else{
			
			$.ajax({
				contentType : "application/json",
				url : "/E715Member/userBanList",
				dataType : "json",
				type : "get",
				data : "",
				success : function(data) {
					console.log(data);
						}	
			
			});
		}
		
			});


	$(function() {
		$("div.holder").jPages({
			containerID : "itemContainer1",
			perPage : 20,
			fallback : 500,
			first : "第一頁",
			previous : "上一頁",
			next : "下一頁",
			last : "最後頁",
		});
	});
</script>



<c:import url="/WebContent/layout/footer.jsp"></c:import>