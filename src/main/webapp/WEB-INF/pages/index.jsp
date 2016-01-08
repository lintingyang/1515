<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<div class="container" style="margin: 50px auto;">
	<div class="container">
		<ul class="nav nav-tabs" id="tabs">
			<li style="width: 25%; text-align: center;"><a
				class="categorylist" href="#">熱門</a></li>
			<li style="width: 25%; text-align: center;"><a
				class="categorylist" href="#">最新</a></li>
			<li style="width: 25%; text-align: center;"><a
				class="categorylist" href="#">誠信</a></li>
			<li style="width: 25%; text-align: center;"><a
				class="categorylist" href="#">推薦</a></li>
		</ul>
	</div>
	<br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" id="productlist">

			<div class="holder"></div>
			<div id="itemContainer">

				<c:forEach items="${products}" var="product">
					<div class="proddiv">
						<img class="prodimg" src="/resources/imgs/01.jpg">${ product.name }
					</div>
				</c:forEach>

			</div>
			<div class="holder"></div>




		</div>






	</div>
</div>




<script type="text/javascript">
	$('.categorylist').click(function() {
		$.ajax({
			contentType : "application/json",
			url : "/query",
			dataType : "json",
			type : "get",
			data : {
				"orderby" : $(this).text()
			},
			success : function(data) {
				console.log(data);

				$("#itemContainer").html('');
				$.each(data,
					function(i) {
					var productdiv = $("<div></div>");
					var aclick = $("<a>").attr("href","/product/" + data[i].id);
					var productimg = $("<img>").addClass("prodimg");
					$(aclick).text(data[i].name).append($(productimg));
					$(productdiv).addClass("proddiv").append($(aclick));

					$("#itemContainer").append(productdiv);
					getpicture(data[i], productimg);})

					$("div.holder").jPages({
							containerID : "itemContainer",
							perPage : 20,
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

	$(function() {
		$("div.holder").jPages({
			containerID : "itemContainer",
			perPage : 20,
			fallback : 500,
			first : "第一頁",
			previous : "上一頁",
			next : "下一頁",
			last : "最後頁",
		});
	});
</script>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>



