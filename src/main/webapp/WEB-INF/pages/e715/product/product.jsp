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
			<input id="excBtn" class="btn btn-primary btn-lg" type="button" value="我要交換" onclick="location.href='/WebContent/product/exchangeproduct.jsp'">
		</div>
		
		<!-- 下面這個btn銘要用的 -->
		<div>
			<form action="/product/exchanging">
				<button id="btnExchang" type="submit" class="btn btn-success btn-lg">
					<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 轉入交易進行中畫面
				</button>
			</form>
		</div>
	</div>


	<div class="col-md-12">
		<div>
			<!-- Nav tabs -->
			<br> <br>
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#question"
					aria-controls="home" role="tab" data-toggle="tab">問與答</a></li>
				<li role="presentation"><a href="#exchange"
					aria-controls="profile" role="tab" data-toggle="tab">交換物品</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="question">
					question
					<table class="table table-striped">
						<tr>
							<td><h4>Question:</h4>我可以用兩個CityCoffee跟你換嗎
								<hr>
								<h4>Answer:</h4>不行喔<br></td>
						</tr>
						<tr>
							<td><h4>Question:</h4> 全新的嗎
								<hr>
								<h4>Answer:</h4>九成新<br></td>
						</tr>
						<tr>
							<td><h4>Question:</h4>AAA <br>
								<hr>
								<h4>Answer:</h4>BBB<br></td>
						</tr>
					</table>
					<div>
						
						<div style="text-align: center;">
						
							<textarea   rows="9" cols="100" placeholder="提出發問..."></textarea>
							<br>
							<br> <input type="button" value="送出" class="btn btn-primary">
							<div class="checkbox">
								<label> <input type="checkbox"> 匿名發言
								</label>
							</div>
						</div>
					</div>

				</div>







				<div role="tabpanel" class="tab-pane" id="exchange">
					<table class="table table-striped" id="testtable"></table>
				</div>

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
 		var imgId=0;
		 $.each($.parseJSON(obj), function() {
			imgId++;
			var excBtn2='';
			var userId1="${user.id}";
				if(this.productBId.userId.id==userId1){
					excBtn2 = '<button type="button" class="btn btn-primary">交換</button>';
				}
			
			$("#testtable").append('<tr><td><div class="col-md-2"><img id="imgId'+this.productBId.id+'" style="height: 100px;"></div><div class="col-md-6"><h4>'+
					 this.productBId.name+'</h4>物品狀況：'+this.productBId.status +
					 '<br>產品描述：'+this.productBId.description+
					 '<br>'+excBtn2+'</div><div class="col-md-4" style="border-left: 1px dashed gray;"><ul class="nav navbar-nav"><li><img class="img-circle" style="height: 80px;"src="'+
					 this.productBId.userId.picture+
					 '"></li><li><ul style="list-style: none;"><li><h4>'+
					 this.productBId.userId.account+'<a href="#"></a></h4></li><li>'+
					 this.productBId.userId.name +'</li><li>'+this.productBId.userId.schoolName+
					 '</li></ul></li><li><span class="glyphicon glyphicon-plus">123</span></li></ul></div></td></tr>');
			 
			if(this.tradeStatus=="TRUE"){
				$("#excBtn").val("交易結束").attr('onclick', '');
			} 
			var formData={"id":this.productBId.id}
		    $.ajax({
		       type: "GET",
		       url: "http://localhost:8080/product/findproductimg",
		       data: formData,
		       success: function(img){
		    	   getImg(img);
		       },
		       dataType: "json",
		       contentType : "application/json"
		     });		 
		 });

	}
 	function getImg(img) {
        $("#imgId"+img.product.id).attr("src", img.picture);
 	}
 	
});

</script>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>