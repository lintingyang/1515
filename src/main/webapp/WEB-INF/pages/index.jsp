<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/magic.min.css">
<style>
.box {
    width:200px;
    height:260px;
    margin:15px;
    float:left;
    position: relative;
 	box-shadow:0px 0px 1px gray;
 	color:gray;
 	background: white;
/*     display: inline-block;  */
/* 	text-align: center;  */
/*  	cursor :pointer; */
}
 
.box-content {
    display:block;
    padding:20px;
    width: 100%;
    height: 100%;
/*     background: #333; */
    color:black;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -o-box-sizing: border-box;
}
 
.box-overlay {
    width: 100%;
    height: 100%;
    position: absolute;
    top:0;
    left:0;
    z-index:10;
}
 
a.link {
    display:block;
    width: 100%;
    height: 100%;      
    position: absolute;
    top:0;
    left:0;
    z-index:15;    
}  
</style>
<div class="container" style="margin: 20px auto;">
	<div class="container">
		<span style="padding-top: 10px;"></span>
<!--         Jumbotron Header -->
<!--         <header class="jumbotron hero-spacer"> -->
<!--             <h1>Welcome E715 :(</h1> -->
<!--             <p style="font-size:medium;">E715提供全國大專院校的學生一個以交換為概念的網路平台， -->
<!-- 				主張以分享和交換物品或服務，取代購買行為，形成分享經濟的社群， -->
<!-- 				事物的價值本來就取決於個人喜好，利用自身物件換取其他心儀物品，棄如敝屣的東西也能變成另一人眼中的珍寶，達到互惠互利的雙贏局面，並發揮最大價值物盡其用環保愛地球，E715的宗旨是在環保風潮與分享交換的理念推廣下為使用者提供便捷快速，安心信任的平台。	</p> -->
<!--             <p><a class="btn btn-primary btn-large">立即註冊</a> -->
<!--             </p> -->
<!--         </header> -->


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
			

		</div>
	</div>
			<div class="holder"></div>
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
				$.each(data,function(i) {
					//slide
					var productdivv = $("<div class='box'></div>");
					var productdiv2 = $("<div class='box-content'></div>");
						var productdivB = $("<div class='box-wrapper'></div>");
							var pDes = $("<p style='color: gray;'>物品描述：</p>");
							var pDescription = $("<p></p>").text(data[i].description);
							var pWis = $("<p style='color: gray;'>希望清單：</p>");
							var pWishItem = $("<span></span>").text(data[i].wishItem);
// 							var pOwn = $("<br><span style='color: blue;'>交換者：</span>");
// 							var pOwner = $("<span></span>").text(data[i].userId.name);
					var productdivP = $("<div class='box-overlay magictime' data-hover='slideDown' data-return='slideDownRetourn'></div>");
						var productimg = $("<img style='max-width:100%;'>").addClass("prodimg").attr("src",data[i].primaryPicture);
						var divp = $("<div style='padding-top: 15px;'></div>");
							var p = $("<span></span>").text(data[i].name);
					var aclick = $("<a class='link'>").attr("href","/product/" + data[i].id);
// 					var productdivF = $("<div class='panel-footer'></div>");
				
	// 				$(productdivF).append(p);
					$(productdivB).append(pDes).append(pDescription).append(pWis).append(pWishItem);
					$(divp).append(p);
					$(productdivP).append(productimg).append(divp);
	 				$(productdiv2).append(productdivB);
					$(productdivv).append(productdiv2).append(productdivP).append(aclick);
					
					$("#itemContainer").append(productdivv);
					
					$('.box').hover(
						function () {
					    	var overlay = $(this).find('.box-overlay');
					        overlay.removeClass(overlay.data('return')).addClass(overlay.data('hover'));
					        $(this).css('box-shadow', '2px 2px 20px gray');
					    },
					    function () {
					        var overlay = $(this).find('.box-overlay');    
					        overlay.removeClass(overlay.data('hover')).addClass(overlay.data('return'));
					        $(this).css('box-shadow', '');
					    }
					);
					
					//old
// 					var productdiv = $("<div class='panel panel-danger'></div>");
// 					var productdiv2 = $("<div class='panel-body'></div>");
// 					var productdiv3 = $("<div class='panel-footer'></div>");
// 					var aclick = $("<a>").attr("href","/product/" + data[i].id);
// 					var productimg = $("<img style='max-width:100%;'>").addClass("prodimg").attr("src",data[i].primaryPicture);
// 					var p = $("<span></span>").text(data[i].name);
// 					$(aclick).append($(productimg));
// 					$(productdiv2).append($(aclick));
// 					$(productdiv3).append($(p));
					
// 					$(productdiv).addClass("proddiv").append($(productdiv2)).append($(productdiv3));

// 					$("#itemContainer").append(productdiv);
// // 					getpicture(data[i], productimg)
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
				//slide
				var productdivv = $("<div class='box'></div>");
					var productdiv2 = $("<div class='box-content'></div>");
						var productdivB = $("<div class='box-wrapper'></div>");
							var pDes = $("<p style='color: gray;'>物品描述：</p>");
							var pDescription = $("<p></p>").text(data[i].description);
							var pWis = $("<p style='color: gray;'>希望清單：</p>");
							var pWishItem = $("<span></span>").text(data[i].wishItem);
// 							var pOwn = $("<br><span style='color: blue;'>交換者：</span>");
// 							var pOwner = $("<span></span>").text(data[i].userId.name);
					var productdivP = $("<div class='box-overlay magictime' data-hover='slideDown' data-return='slideDownRetourn'></div>");
						var productimg = $("<img style='max-width:100%;'>").addClass("prodimg").attr("src",data[i].primaryPicture);
						var divp = $("<div style='padding-top: 15px;'></div>");
							var p = $("<span></span>").text(data[i].name);
					var aclick = $("<a class='link'>").attr("href","/product/" + data[i].id);
// 				var productdivF = $("<div class='panel-footer'></div>");
				
// 				$(productdivF).append(p);
				$(productdivB).append(pDes).append(pDescription).append(pWis).append(pWishItem);
				$(divp).append(p);
				$(productdivP).append(productimg).append(divp);
 				$(productdiv2).append(productdivB);
				$(productdivv).append(productdiv2).append(productdivP).append(aclick);
				
				$("#itemContainer").append(productdivv);
				
				$('.box').hover(
					function () {
				    	var overlay = $(this).find('.box-overlay');
				        overlay.removeClass(overlay.data('return')).addClass(overlay.data('hover'));
				        $(this).css('box-shadow', '2px 2px 20px gray');
				    },
				    function () {
				        var overlay = $(this).find('.box-overlay');    
				        overlay.removeClass(overlay.data('hover')).addClass(overlay.data('return'));
				        $(this).css('box-shadow', '');
				    }
				);
				
				//old
// 				var productdiv = $("<div class='panel panel-danger'></div>");
// 				var productdiv2 = $("<div class='panel-body'></div>");
// 				var productdiv3 = $("<div class='panel-footer'></div>");
// 				var aclick = $("<a>").attr("href","/product/" + data[i].id);
// 				var productimg = $("<img style='max-width:100%;'>").addClass("prodimg").attr("src",data[i].primaryPicture);
// 				var p = $("<span></span>").text(data[i].name);
// 				$(aclick).append($(productimg));
// 				$(productdiv2).append($(aclick));
// 				$(productdiv3).append($(p));
				
// 				$(productdiv).addClass("proddiv").append($(productdiv2)).append($(productdiv3));

// 				$("#itemContainer").append(productdiv);
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
