
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<div class="container" style="margin: 50px auto;">
	<div class="container">


		<ul class="nav nav-tabs" id="tabs">
			<li style="width: 50%; text-align: center;"><a
				class="categorylist searchbtn" href="#">熱門</a></li>
			<li style="width: 50%; text-align: center;"><a
				class="categorylist searchbtn"  href="#">最新</a></li>
		</ul>
	</div>
	<br>


	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" id="productlist">
			<c:if test ="${!empty namelike }" >
				以下為搜尋結果：${ namelike}
			</c:if>
			<div class="holder"></div>
			<div id="itemContainer" >
			</div>
			
			<div class="holder"></div>

		</div>
	</div>
</div>
	
	




<!-- $("#searchbar").text() -->
<script type="text/javascript">
// var searchType = "熱門";
// function changesearch(){
// 	console.log(searchType);
// 	$(searchType) = $(this).text();
// }


	$('.categorylist').click(function() { //點選排列方式後按照順序排列
// 		$("img.lazy").lazyload({
// 			threshold : 200,
// 			failure_limit : 10
// 		});

		$.ajax({
			contentType : "application/json",
			url : "/query",
			dataType : "json",
			type : "get",
			data : {"orderby" : $(this).text(),"namelike": "${namelike}","categoryname":"${categoryname}"},
			success : function(data) {
// 				console.log(data);

				$("#itemContainer").html('');
// 				$("img.lazy").lazyload({
// 					threshold : 200,
// 					failure_limit : 10
// 				});
				$.each(data,
					function(i) {
					var productdiv = $("<div></div>");
					var aclick = $("<a>").attr("href","/product/" + data[i].id);
					var productimg = $("<img>").addClass("prodimg").attr("src",data[i].primaryPicture);
					var p = $("<span>").text(data[i].name);
					$(aclick).append($(productimg)).append($(p));
					$(productdiv).addClass("proddiv").append($(aclick));

					$("#itemContainer").append(productdiv);
// 					getpicture(data[i], productimg)
					})
					$("div.holder").jPages({
							containerID : "itemContainer",
							perPage : 20,
							first : "第一頁",
							previous : "上一頁",
							next : "下一頁",
							last : "最後頁",
						});
					}
				});

			});
$(function() { //畫面第一次進入時出現的product list
	
	$.ajax({
		contentType : "application/json",
		url : "/query",
		dataType : "json",
		type : "get",
		data : {"orderby" : "熱門","namelike": "${namelike}" ,"categoryname":"${categoryname}"},
		success : function(data) {
			$("#itemContainer").html('');
			$.each(data,function(i) {
				var productdiv = $("<div></div>");
				var aclick = $("<a>").attr("href","/product/" + data[i].id);
				var productimg = $("<img>").addClass("prodimg").attr("src",data[i].primaryPicture);
				var p = $("<span>").text(data[i].name);
				$(aclick).append($(productimg)).append($(p));
				$(productdiv).addClass("proddiv").append($(aclick));

				$("#itemContainer").append(productdiv);
// 				getpicture(data[i], productimg);
				}
			)
		
				$("div.holder").jPages({
						containerID : "itemContainer",
						perPage : 20,
						first : "第一頁",
						previous : "上一頁",
						next : "下一頁",
						last : "最後頁",
					});
			
				}
		
			});

		});

	$(function() {
		$("div.holder").jPages({
			containerID : "itemContainer1",
			perPage : 20,
			fallback : "fast",
			first : "第一頁",
			previous : "上一頁",
			next : "下一頁",
			last : "最後頁",
		});
		
		
	});
// function getpicture(prod, prodimg) { //取得每一個商品的物件
// 		var formData = {
// 			"id" : prod.id
// 		}
// 		$.ajax({
// 			contentType : "application/json",
// 			url : "/queryimg",
// 			dataType : "json",
// 			type : "get",
// 			data : formData,
// 			success : function(data) {
// 				if (data != null) { 
// 					$(prodimg).attr("data-original", data.primaryPicture);
// 					$("img.lazy").lazyload({
// 						threshold : 200,
// 						failure_limit : 10
// 					});

//  					$(prodimg).attr("src", data.primaryPicture);
// 				}
// 			}
// 		});
// }
</script>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>
