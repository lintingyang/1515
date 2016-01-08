<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="/resources/css/user.css" />

<div class="container" style="margin: 50px auto;">

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-3"></div>
			<div class="col-md-3" style="text-align: center;margin-top:20px;">
				<img class="img-circle" style="width: 120px;"
					src="${user.picture}">
			</div>
			<div class="col-md-6">
				<br> 
				<ul style="list-style: none;">
					<li><a href="#"><span class="glyphicon glyphicon-envelope iconpme" ></span></a> 
						<a href="#"><span class="glyphicon glyphicon-plus iconpme"  style="margin-left: 20px;"></span></a></li>
					<li><h4>${user.name}</h4></li>
					<li><span style="color: gray;">${user.schoolName}</span><br></li>


				</ul>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-3"></div>
			<div class="col-md-3" style="text-align: center;">
				<div class="row">
				<h4 style="color: gray;">${user.account}</h4>	
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-5">
						<span class="glyphicon glyphicon-thumbs-up iconpro">${good}</span><span
							class="badge"></span>
					</div>
					<div class="col-md-5">
						<span class="glyphicon glyphicon-thumbs-down iconpro">${bad}</span>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
			<div class="col-md-6"><span style="margin-left:40px;color:gray;">${user.aboutMe}</span></div>
		</div>
		<div class="col-md-1"></div>
	</div>

	<hr>

	<div class="row">
			<div id="itemContainer">

			</div>
		<div class="holder"></div>
	</div>


</div>

<script type="text/javascript">

$(function() {
	$.ajax({
		contentType : "application/json",
		url : "/product/query",
		dataType : "json",
		type : "get",
		data : {"id" : "${user.id}"},
		success : function(data) {
			$("#itemContainer").html('');
			$.each(data,
				function(i) {
				var productdiv = $("<div></div>");
				var aclick = $("<a>").attr("href","/product/" + data[i].id);
				var productimg = $("<img>").addClass("prodimg");
				var p = $("<span>").text(data[i].name);
				$(aclick).append($(productimg)).append($(p));
				$(productdiv).addClass("proddiv").append($(aclick));

				$("#itemContainer").append(productdiv);
				getpicture(data[i], productimg);})

				$("div.holder").jPages({
						containerID : "itemContainer",
						perPage : 4,
						fallback : 500,
						first : "第一頁",
						previous : "上一頁",
						next : "下一頁",
						last : "最後頁",
					});
			
				}
			});

		});
function getpicture(prod, prodimg) {
	var formData = {
		"id" : prod.id
	}
	$.ajax({
		contentType : "application/json",
		url : "/queryimg",
		dataType : "json",
		type : "get",
		data : formData,
		success : function(data) {

			if (data[0] != null) {
				console.log(data[0].picture);
				$(prodimg).attr("src", data[0].picture);
			}
		}
	});
}
</script>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>