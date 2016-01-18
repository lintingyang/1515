
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<div class="container" style="margin: 20px auto;">
	<div class="container">


		<ul class=" nav-tabs" id="tabs" >
			<li style="width: 50%; text-align: center; "><div class="catrgorybox categorylist searchbtn" id="hot">熱門</div></li>
			<li style="width: 50%; text-align: center; "><div class="catrgorybox categorylist searchbtn" id="new">最新</div></li>
		</ul>
	</div>



	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" id="productlist">
			<c:if test ="${!empty namelike }" >
				以下為搜尋結果：${ namelike}
			</c:if>
			<div class="holder" style="text-align: center;"></div>
			<div id="itemContainer"  style="padding:auto;text-align: center">
			</div>
			
			<div class="holder"></div>

		</div>
	</div>
</div>
	
	




<!-- $("#searchbar").text() -->
<script type="text/javascript">
$("#hot").click(function(){
	$("#hot").css("border-bottom","3px solid #009FCC");
	$("#new").css("border-bottom","");
})
$("#new").click(function(){
	$("#hot").css("border-bottom","");
	$("#new").css("border-bottom","3px solid #009FCC");
})
	$('.categorylist').click(function() { //點選排列方式後按照順序排列
		

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
					var productdiv = $("<div class='panel panel-danger'></div>");
					var productdiv2 = $("<div class='panel-body'></div>");
					var productdiv3 = $("<div class='panel-footer'></div>");
					var aclick = $("<a>").attr("href","/product/" + data[i].id);
					var productimg = $("<img style='max-width:100%;'>").addClass("prodimg").attr("src",data[i].primaryPicture);
					var p = $("<span></span>").text(data[i].name);
					$(aclick).append($(productimg));
					$(productdiv2).append($(aclick));
					$(productdiv3).append($(p));
					
					$(productdiv).addClass("proddiv").append($(productdiv2)).append($(productdiv3));

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
	$("#hot").css("border-bottom","3px solid #009FCC");
	$.ajax({
		contentType : "application/json",
		url : "/query",
		dataType : "json",
		type : "get",
		data : {"orderby" : "熱門","namelike": "${namelike}" ,"categoryname":"${categoryname}"},
		success : function(data) {
			$("#itemContainer").html('');
			$.each(data,function(i) {
				var productdiv = $("<div class='panel panel-danger'></div>");
				var productdiv2 = $("<div class='panel-body'></div>");
				var productdiv3 = $("<div class='panel-footer'></div>");
				var aclick = $("<a>").attr("href","/product/" + data[i].id);
				var productimg = $("<img style='max-width:100%;'>").addClass("prodimg").attr("src",data[i].primaryPicture);
				var p = $("<span></span>").text(data[i].name);
				$(aclick).append($(productimg));
				$(productdiv2).append($(aclick));
				$(productdiv3).append($(p));
				
				$(productdiv).addClass("proddiv").append($(productdiv2)).append($(productdiv3));

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

</script>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>
