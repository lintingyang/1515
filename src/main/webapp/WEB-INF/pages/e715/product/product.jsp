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
								<a href="/E715Member/${product.userId.id}">Account: ${product.userId.account} </a>
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
		<div class="container" style="width: 100%; height: 100px; text-align: center;">		
			<input id="excBtn" class="btn btn-primary btn-lg" type="button" value="我要交換" data-toggle="modal" data-target="#myProductList">
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
					<div>
						<!-- 發問區開始 -->
						<c:if test="${empty user}">
						<div style="text-align: center;">
						<h3>請先登入才能發問！</h3>
						</div>
						</c:if>
						<c:if test="${not empty user.id}">
						<div style="text-align: center;">
							<textarea id="questiontext"　rows="10" cols="100" placeholder="提出問題..."></textarea>
							<br>
							<label><input type="checkbox">匿名發言</label>
							<br>
							<br> 
							<input type="button" value="送出" class="btn btn-primary" id="submitquestion">
							<div class="checkbox">	
							</div>
						</div>
						</c:if>
						<!-- 發問區結束 -->
					</div>
				</div><!-- 問與答區塊結束 -->
				<!-- exchange區塊開始 -->
				<div role="tabpanel" class="tab-pane" id="exchange">
					<table class="table table-striped" id="testtable"></table>
				</div>
				<!-- exchange區塊結束 -->
			</div>
		</div>
	</div>
</div>

<!-- 我要交換扭的下拉選單 -->
<div class="modal fade" id="myProductList" tabindex="-1" role="dialog" aria-labelledby="myProductList" aria-hidden="true">
  <div class="modal-dialog" style="background-color: gray;">
    <div class="modal-content">
      <div class="modal-body alignCenter">
      <h5 id="myProductList">請選擇類別</h5>
      		<table style=" margin:auto;" id="userAProduct">
      			<tr><td class="productcategory" >
					
      			</td></tr>
      		</table>
      		<br>
      		<br>
       <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>

$(function(){
// 	Q&A
	var formData={"id":${product.id}}
    $.ajax({
       type: "GET",
       url: "/qanda/getqanda",
       data: formData,
       success: function(data){
    	   showtable(data);
       },
       dataType: "json",
       contentType : "application/json"
     });
     function showtable(data){
    	 $.each(data, function(){
     		 $("#qatable").append("<tr><td><h4>問題:</h4>" + this.question + 
     			"<hr><h4>Answer:</h4>" + this.answer + "<br></td></tr>");
    	 })	 
     }
//	end of Q&A	
//	submit question
	$("#submitquestion").click(function(){
		var questionData = JSON.stringify({"productid":"${product.id}", "question":$("#questiontext").val()});
		$.ajax({
			type: "POST",
			url: "/qanda/question",
			data: questionData,
			contentType : "application/json",
		    dataType: "text",
		    async: false,
			success: function(data){
		    	 location.reload(true);
		       },
		       
		})
	})
//	end of submit question
//	小圖示
    $(".thumbnail").click(function(e){
    	e.preventDefault()
        var href = $(this).attr("href");
        $("#big-image img").attr("src", href);
        e.preventDefault();
        return false;
    });
//	小圖示end
//	show Exchange
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
 		 var imgId=0;
		 $.each(data, function() {
			imgId++;
			var excBtn2='';
			var loginId="${user.id}";
			var prodUserId="${product.userId.id}";
			//關閉我要交換鈕
			//顯示交換物品欄的交換鈕
			if(prodUserId.length!=0 && prodUserId==loginId){
				$("#excBtn").val("").attr('data-target', '');
				excBtn2 = '<button id="cha" name="cha" type="button" class="btn btn-primary" onclick="javascript:location.href=\'exchanging?id='+ this.id + '\'">交換</button>';
			}
			
			$("#testtable").append('<tr><td><div class="col-md-2">'+
					'<a href="/product/'
					 +this.productBId.id+'"><img id="imgId'+this.productBId.id+'" style="height: 100px;"></a></div><div class="col-md-6"><h4>'+
					 this.productBId.name+'</h4>物品狀況：'+this.productBId.status +
					 '<br>產品描述：'+this.productBId.description+
					 '<br><div name="d1">'+excBtn2+'</div></div><div class="col-md-4" style="border-left: 1px dashed gray;"><ul class="nav navbar-nav"><li><img class="img-circle" style="height: 80px;"src="'+
					 this.productBId.userId.picture+
					 '"></li><li><ul style="list-style: none;"><li><h4>'+
					 this.productBId.userId.account+'</h4></li><li>'+
					 this.productBId.userId.name +'</li><li>'+this.productBId.userId.schoolName+
					 '</li></ul></li><li><span class="glyphicon glyphicon-plus">123</span></li></ul></div></td></tr>');
//	end of show Exchange (A->B)
//	交易結束鎖定
			if(this.tradeStatus=="TRUE"){
				$("#excBtn").val("交易結束").attr('onclick', '');
			}

	
//	交易結束鎖定end
//	Exchange product pic
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
		 if($("#excBtn").val() == "交易結束"){
			 $('div[name*="d1"]').html("");
		 }
	}
 	//確認Exchange (B->A)		
	var formData={"id":${product.id}}
	 $.ajax({
	       type: "GET",
	       url: "http://localhost:8080/product/findexchanged",
	       data: formData,
	       success: function(data){
	    	   checkExchanged(data);
	       },
	       dataType: "json",
	       contentType : "application/json"
	     });
	//確認Exchange (B->A)
	//如果交易結束(B->A) 關閉按鈕
 	 function checkExchanged(data) {
		 $.each(data, function() {
			 if(this.tradeStatus=="TRUE"){
					$("#excBtn").val("交易結束").attr('onclick', '');
			}
		 });
		 if($("#excBtn").val() == "交易結束"){
			 $('div[name*="d1"]').html("");
		 }
 	 }
 	 
 	function getImg(img) {
        $("#imgId"+img.product.id).attr("src", img.picture);
 	}
//	end of Exchange product pic
	
	$.ajax({
		contentType : "application/json",
		url : "/product/query",
		dataType : "json",
		type : "get",
		data : {"id" : "${user.id}"},
		success : function(data){
			$.each(data,function(i) {
				console.log(data[i].name)
				var btn = aå 
				var tr = $("<tr></tr>");
				var prodimg = $("<img>").addClass("prodimgsm");
				var namespan = $("<h5>").text(data[i].name)
				var div = $("<div></div>").append($(namespan)).append($(prodimg));
				var td = $("<td></td>").append($(div));
				
				getpicture(data[i], prodimg);
				
				$(tr).append($(td));
				$("#userAProduct").append($(tr));
			})
		}
	})

});//end of function onload

function getpicture(prod, prodimg) { //取得每一個商品的物件
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