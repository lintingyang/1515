<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="/resources/css/user.css" />

<div class="container" style="margin: 50px auto;">
	<div class="col-md-6">
		<div class="row">
			<div id="big-image">
				<img src="${productPictures[0].picture}"
					style="width: 400px;">
			</div>
		</div>
		<div class="row">
			<ul class="nav navbar-nav">
				<c:if test="${not empty productPictures[0].picture}">
				<li><a class="thumbnail" href="${productPictures[0].picture}">
				<img class="smaimg"
						src="${productPictures[0].picture}"></a></a></li>
				</c:if>
				<c:if test="${not empty productPictures[1].picture}">
				<li><a class="thumbnail" href="${productPictures[1].picture}">
				<img class="smaimg"
						src="${productPictures[1].picture}"></a></li>
				</c:if>
				<c:if test="${not empty productPictures[2].picture}">
				<li>
				<a class="thumbnail" href="${productPictures[2].picture}">
				<img class="smaimg"
						src="${productPictures[2].picture}"></a></li>
				</c:if>
				<c:if test="${not empty productPictures[3].picture}">
				<li><a class="thumbnail" href="${productPictures[3].picture}"><img class="smaimg"
						src="${productPictures[3].picture}"></a></li>
				</c:if>
			</ul>
		</div>
		<div class="row">
			<hr>
			<ul class="nav navbar-nav">
				<li><img class="img-circle" style="width: 100px;"
					src="${product.userId.picture}"></li>
				<li><ul style="list-style: none;">
						<li><h4>
								Account: ${product.userId.account} <a href="#"></a>
							</h4></li>
						<li>${product.userId.name}</li>
						<li>${product.userId.schoolName}<li>
					</ul></li>
				<li><span class="glyphicon glyphicon-plus">123</span></li>

			</ul>
		</div>
	</div>
	<div class="col-md-6">
		<h3>${product.name}</h3>
		<div>
			<h5>希望交易商品：</h5>
			<br> ${product.wishItem}
		</div>
		<hr>
		<div>
			<h5>描述：</h5>
			<br>${product.description} 
		</div>
		<hr>
		<div>
			<h5>交易地點：${product.location} </h5>
			<h5>交易期限：${product.deadline} </h5>
			<h5>交易時段：${product.transactionTime} </h5>
		</div>
		<hr>
		<div>
			<h5>交易方式：${product.tradeWay} </h5>
		</div>
		<div class="container"
			style="width: 100%; height: 100px; text-align: center;">
			<input class="btn btn-primary btn-lg" type="button" value="我要交換" onclick="location.href='/WebContent/product/exchangeproduct.jsp'">
		</div>
	</div>

	<div class="col-md-12">
		<div>
			<!-- 功能選單 -->
			<br> <br>
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#question"
					aria-controls="home" role="tab" data-toggle="tab">問與答</a></li>
				<li role="presentation"><a href="#exchange"
					aria-controls="profile" role="tab" data-toggle="tab">交換物品</a></li>
			</ul>

			<!-- 問與答區塊開始 -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="question">
					<table class="table table-striped" id="qatable"></table>
<!-- 						<tr> -->
<!-- 							<td><h4>Question:</h4>我可以用兩個CityCoffee跟你換嗎 -->
<!-- 								<hr> -->
<!-- 								<h4>Answer:</h4>不行喔<br></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><h4>Question:</h4> 全新的嗎 -->
<!-- 								<hr> -->
<!-- 								<h4>Answer:</h4>九成新<br></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><h4>Question:</h4>AAA <br> -->
<!-- 								<hr> -->
<!-- 								<h4>Answer:</h4>BBB<br></td> -->
<!-- 						</tr> -->
					<div>
						<!-- 發問區開始 -->
						<div style="text-align: center;">
							<textarea rows="10" cols="100" placeholder="提出問題..."></textarea>
							<br>
							<label><input type="checkbox">匿名發言</label>
							<br>
							<br> 
							<input type="button" value="送出" class="btn btn-primary">
							<div class="checkbox">	
							</div>
						</div>
						<!-- 發問區結束 -->
					</div>
				</div><!-- 問與答區塊結束 -->
				<!-- exchange區塊開始 -->
				<div role="tabpanel" class="tab-pane" id="exchange">
					<table class="table table-striped" id="testtable">
<!-- 						<tr> -->
<!-- 							<td> -->
<!-- 								<div class="col-md-2"> -->
<!-- 									<img src="/resources/imgs/phone.jpg" -->
<!-- 										style="height: 100px;"> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<h4>星巴克紀念杯款</h4> -->
<!-- 									物品狀況：九成新 <br>產品描述：j123oi21j3oijelkwjeq;oijaksjd;alkdjsqkje;lqwkej;ls -->
<!-- 								</div> -->
<!-- 								<div class="col-md-4" style="border-left: 1px dashed gray;"> -->
<!-- 									<ul class="nav navbar-nav"> -->
<!-- 										<li><img class="img-circle" style="height: 80px;" -->
<!-- 											src="/resources/imgs/noname.jpg"></li> -->
<!-- 										<li><ul style="list-style: none;"> -->
<!-- 												<li><h4> -->
<!-- 														Account <a href="#"></a> -->
<!-- 													</h4></li> -->
<!-- 												<li>Name</li> -->
<!-- 												<li>台灣大學</li> -->
<!-- 											</ul></li> -->
<!-- 										<li><span class="glyphicon glyphicon-plus">123</span></li> -->

<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td> -->
<!-- 								<div class="col-md-2"> -->
<!-- 									<img src="/resources/imgs/phone.jpg" -->
<!-- 										style="height: 100px;"> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<h4>星巴克紀念杯款</h4> -->
<!-- 									物品狀況：九成新 <br>產品描述：j123oi21j3oijelkwjeq;oijaksjd;alkdjsqkje;lqwkej;ls -->
<!-- 									<input type="button" value="我想跟你換"> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-4" style="border-left: 1px dashed gray;"> -->
<!-- 									<ul class="nav navbar-nav"> -->
<!-- 										<li><img class="img-circle" style="height: 80px;" -->
<!-- 											src="/resources/imgs/noname.jpg"></li> -->
<!-- 										<li><ul style="list-style: none;"> -->
<!-- 												<li><h4> -->
<!-- 														Account <a href="#"></a> -->
<!-- 													</h4></li> -->
<!-- 												<li>Name</li> -->
<!-- 												<li>台灣大學</li> -->
<!-- 											</ul></li> -->
<!-- 										<li><span class="glyphicon glyphicon-plus">123</span></li> -->

<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td> -->
<!-- 								<div class="col-md-2"> -->
<!-- 									<img src="/resources/imgs/phone.jpg" -->
<!-- 										style="height: 100px;"> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<h4>星巴克紀念杯款</h4> -->
<!-- 									物品狀況：九成新 <br>產品描述：j123oi21j3oijelkwjeq;oijaksjd;alkdjsqkje;lqwkej;ls -->
<!-- 								</div> -->
<!-- 								<div class="col-md-4" style="border-left: 1px dashed gray;"> -->
<!-- 									<ul class="nav navbar-nav"> -->
<!-- 										<li><img class="img-circle" style="height: 80px;" -->
<!-- 											src="/resources/imgs/noname.jpg"></li> -->
<!-- 										<li><ul style="list-style: none;"> -->
<!-- 												<li><h4> -->
<!-- 														Account <a href="#"></a> -->
<!-- 													</h4></li> -->
<!-- 												<li>Name</li> -->
<!-- 												<li>台灣大學</li> -->
<!-- 											</ul></li> -->
<!-- 										<li><span class="glyphicon glyphicon-plus">123</span></li> -->

<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</td> -->
<!-- 						</tr> -->

<!-- 						<tr> -->
<!-- 							<td> -->
<!-- 								<div class="col-md-2"> -->
<!-- 									<img src="/resources/imgs/phone.jpg" -->
<!-- 										style="height: 100px;"> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<h4>星巴克紀念杯款</h4> -->
<!-- 									物品狀況：九成新 <br>產品描述：j123oi21j3oijelkwjeq;oijaksjd;alkdjsqkje;lqwkej;ls -->
<!-- 								</div> -->
<!-- 								<div class="col-md-4" style="border-left: 1px dashed gray;"> -->
<!-- 									<ul class="nav navbar-nav"> -->
<!-- 										<li><img class="img-circle" style="height: 80px;" -->
<!-- 											src="/resources/imgs/noname.jpg"></li> -->
<!-- 										<li><ul style="list-style: none;"> -->
<!-- 												<li><h4> -->
<!-- 														Account <a href="#"></a> -->
<!-- 													</h4></li> -->
<!-- 												<li>Name</li> -->
<!-- 												<li>台灣大學</li> -->
<!-- 											</ul></li> -->
<!-- 										<li><span class="glyphicon glyphicon-plus">123</span></li> -->

<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</td> -->
<!-- 						</tr> -->
					</table>
				</div><!-- exchange區塊結束 -->
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
    $(".thumbnail").click(function(e){
    	e.preventDefault()
        var href = $(this).attr("href");
        $("#big-image img").attr("src", href);
        e.preventDefault();
        return false;
    });

 	var formData={"id":${product.id}}
    $.ajax({
       type: "GET",
       url: "http://localhost:8080/product/findexchange",
       data: formData,
       success: function(data){
    	   show(data);
       },
       dataType: "json",
       contentType : "application/json"
     });
 	 function show(data) {
 		var obj = JSON.stringify(data);
 		
//		 document.getElementById("tbody1").innerHTML="";
// 		 var counter=0;
		 $.each($.parseJSON(obj), function() {
			 $("#testtable").append('<tr><td><div class="col-md-8"><h4>'+
					 this.productBId.name+'</h4>物品狀況：'+this.productBId.status +
					 '<br>產品描述：'+this.productBId.description+
					 '</div><div class="col-md-4" style="border-left: 1px dashed gray;"><ul class="nav navbar-nav"><li><img class="img-circle" style="height: 80px;"src="'+
					 this.productBId.userId.picture+
					 '"></li><li><ul style="list-style: none;"><li><h4>'+
					 this.productBId.userId.account+'<a href="#"></a></h4></li><li>'+
					 this.productBId.userId.name +'</li><li>'+this.productBId.userId.schoolName+
					 '</li></ul></li><li><span class="glyphicon glyphicon-plus">123</span></li></ul></div></td></tr>')
		 });
	}
 	
});/*end of function*/

</script>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>