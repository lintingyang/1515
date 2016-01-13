<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp" />
<script src="/resources/js/jquery.tinyMap.min.js"></script>
<link rel="stylesheet" href="/resources/css/user.css" />
<style>
.map {
    width: 540px;
    height: 180px;
}
</style>
<div class="container" style="margin: 50px auto;">
	<div class="col-md-6">
		<div class="row">
			<div id="big-image">
				<img src="${productPictures[0].picture}" style="width: 400px;">
			</div>
		</div>
		<div class="row">
			<ul class="nav navbar-nav">
				<c:if test="${not empty productPictures[0].picture}">
					<li><a class="thumbnail" href="${productPictures[0].picture}">
							<img class="smaimg" src="${productPictures[0].picture}">
					</a></a></li>
				</c:if>
				<c:if test="${not empty productPictures[1].picture}">
					<li><a class="thumbnail" href="${productPictures[1].picture}">
							<img class="smaimg" src="${productPictures[1].picture}">
					</a></li>
				</c:if>
				<c:if test="${not empty productPictures[2].picture}">
					<li><a class="thumbnail" href="${productPictures[2].picture}">
							<img class="smaimg" src="${productPictures[2].picture}">
					</a></li>
				</c:if>
				<c:if test="${not empty productPictures[3].picture}">
					<li><a class="thumbnail" href="${productPictures[3].picture}"><img
							class="smaimg" src="${productPictures[3].picture}"></a></li>
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
								<a href="/E715Member/${product.userId.id}">Account:
									${product.userId.account} </a>
							</h4></li>
						<li>${product.userId.name}</li>
						<li>${product.userId.schoolName}
						<li>
					</ul></li>
				<li><span class="glyphicon glyphicon-plus">123</span></li>

			</ul>
		</div>
	</div>
	<div class="col-md-6">
		<h2>${product.name}</h2>
		<div>
			<h5>希望交易商品：</h5>
			<br> ${product.wishItem}
		</div>
		<hr>
		<div>
			<h5>描述：</h5>
			<br> ${product.description}
		</div>
		<hr>
		<div>
			<h5>交易地點： ${product.location}</h5>
			<div class="map"></div>
		</div>
		<hr>
		<div>
			<h5>交易期限： ${product.deadline}</h5>
			<h5>交易時段： ${product.transactionTime}</h5>
		</div>
		<hr>
		<div>
			<h5>交易方式： ${product.tradeWay}</h5>
			<h5>交易狀態：
			<c:choose>
			    <c:when test="${product.tradeStatus=='FALSE'}">等待交易中 </c:when>
			    <c:otherwise>交易完成</c:otherwise>
			</c:choose>
			</h5>
		</div>
		<div class="container"
			style="width: 100%; height: 100px; text-align: center;">
			<c:if test="${product.userId.id != user.id}">
				<input id="excBtn" class="btn btn-primary btn-lg" type="button" value="我要交換" data-toggle="modal" 
				data-target="#myProductList">
			</c:if>
		</div>

	</div>

	<div class="col-md-12">
		<a name="qBookmark"></a>
		<div>
			<!-- 功能選單 -->
			<br> <br>
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#question"
					aria-controls="home" role="tab" data-toggle="tab" id="qablock">問與答</a></li>
				<li role="presentation"><a href="#exchange"
					aria-controls="profile" role="tab" data-toggle="tab" id="exgblock">交換物品</a></li>
			</ul>

			<!-- 問與答區塊開始 -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="question" name="question">
					<table class="table table-striped" id="qatable"></table>
					<div>
						<!-- 發問區開始 -->
						<c:if test="${empty user}">
						<!-- 要求先登入才能發問 -->
							<div style="text-align: center;">
								<h3>請先登入才能發問！</h3>
							</div>
						</c:if>
						<c:if test="${not empty user.id && user.id != product.userId.id}">
						<!-- 已登入而且不是product的擁有者才能發問 -->	
							<div style="text-align: center;">
								<textarea id="questiontext"  class="form-control"　rows="10"
									placeholder="提出問題..."></textarea>
								<br> 
								<label><input type="checkbox" id="notPublic">不公開提問</label> <br>
								<br> 
								<input type="button" value="送出" class="btn btn-primary" id="submitquestion" disabled>
								<input type="button" value="清除" class="btn btn-warning" id="resetquestion">
								<div class="checkbox"></div>
							</div>
						</c:if>
						<!-- 發問區結束 -->
					</div>
				</div>
				<!-- 問與答區塊結束 -->
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
      <h4 style=""id="myProductList"><small>請選擇想要交換的物品</small></h4>
      <hr>
      		<table style=" margin:auto;" id="userAProduct">
      			<tr><td class="productcategory" >
					
      			</td></tr>
      		</table>
      		<br>
      		<br>
       <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
//按下我要交換按鈕
$("#excBtn").click(function(){
	if( ${empty user} ){
		swal({   
			title: "尚未登入",   
			text: "您尚未登入,無法使用交換功能!使否導入登入頁面?",   
			type: "warning",   showCancelButton: true,   
			confirmButtonColor: "#DD6B55",   
			confirmButtonText: "是的！我要登入",   
			closeOnConfirm: false }, 
			function(){   
				location.href="/head/login";
			});
		
	}else {
		$.ajax({
			contentType : "application/json",
			url : "/product/query",
			dataType : "json",
			type : "get",
			data : {"id" : "${user.id}"},
			success : function(data) {
				console.log(data);
				if(data == ""){
					swal({   
						title: "沒有物品可交換",   
						text: "您目前沒有上傳任何物品 是否要新增一樣商品呢",   
						type: "warning",   showCancelButton: true,   
						confirmButtonColor: "#DD6B55",   
						confirmButtonText: "好的",   
						closeOnConfirm: false }, 
						function(){   
							location.href="/product/add";
						});
				}	
			}
		});
	}
})
$(function(){
	//地圖是也
	var mapLoc= "台灣"+"${product.location}";
	$('.map').tinyMap({
	    'center': mapLoc,
	    'zoom'  : 14
	});
	// 	顯示Q&A列表
	var formData={"id":${product.id}}
	function getqanda(){
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
	}
	getqanda();
	  function showtable(data){
    	 $("#qacount").remove();
    	 $("#qablock").append("<span id='qacount'>("+data.length+")</span>");//顯示問與答數量
    	 var index = 0;
    	 var questions = data;
    	 var loginId = "${user.id}";
		 var productOwnerId = "${product.userId.id}";
    	 $.each(data, function(){
    		 var qtime = this.questionTime.year + "/" + this.questionTime.monthValue +"/" + this.questionTime.dayOfMonth
				+ ", " + this.questionTime.hour + ":" + this.questionTime.minute;
    		 var questionPart = "<tr><td>問題" + (index+1) + " / " + 
				this.questionerId.nickname + "(<a href='/E715Member/"+ this.questionerId.id +"'>"+this.questionerId.account + "</a>)" + 
				qtime + " <span id='ansbtn" + index + "'></span><br>" + this.question + "<span id='answer"+index+"'></span></td></tr>"
    		 if(this.questionerId.id == loginId || productOwnerId == loginId){
    				$("#qatable").append(questionPart);
    		 } else {
    				if(this.isPublic == "TRUE"){
    	    			 $("#qatable").append(questionPart);
    				} else {
        			$("#qatable").append("<tr><td>問題" + (index+1) + " / <br>這是一則隱藏的提問!</td></tr>");
        			}
    		 }
    		 if (productOwnerId == loginId) {
    			 	if (this.answer == null){
    			 	$("#ansbtn"+index).append("<input type='button' class='btn btn-default' value='回答' id='writeanswer"+index+"'>");
    			 	}
    		 } 
    		 if(this.answer != null){
    			var atime = this.answerTime.year + "/" + this.answerTime.monthValue + "/" + this.answerTime.dayOfMonth
  				+ ", " + this.answerTime.hour + ":" + this.answerTime.minute;
    			$("#answer"+index).append("<hr>答覆  " + atime + "<br>" + this.answer + "<br>"); 
    		 }
    		 $("#writeanswer"+index).on("click", function(){
    			 var thisindex = this.id; 
    			 var currentindex = thisindex.substring(11);
    		 	$("#answer"+currentindex).empty();
			 	$("#answer"+currentindex).append("<br><textarea id='answertext" + currentindex + "' class='form-control' rows='10' autofocus placeholder='撰寫回覆...'></textarea>" + 
						"<br><input type='button' value='送出' class='btn btn-default' id='submitanswer" + currentindex + "' disabled><input type='button' class='btn btn-default' id='resetanswer" + currentindex + "' value='清除'>");	
			 	//回答問題
			 	$("#answertext" + currentindex).on("keydown", function(){
			 		var answerLength = $("#answertext"+currentindex).val().length;
				 	if(answerLength != 0){
				 		$("#submitanswer"+currentindex).removeAttr("disabled");
				 	}
			 	})
			 	$("#submitanswer"+currentindex).on("click", function(){
			 		var theId = questions[currentindex].id;
					var theAnswer = $("#answertext"+currentindex).val();
					var answerData = JSON.stringify({"id":theId, "answer":theAnswer, "productid":${product.id}});
// 					console.log(answerData);    
					$.ajax({
    					type: "POST",
    					url: "/qanda/answer/",
    					data: answerData,
    					contentType : "application/json",
    					dataType: "json",
    					async: false,
    					success: function(data2){
//     						console.log(data2);
    						$("#qatable").empty();
    						showtable(data2);
    						window.location="#qBookmark";
//     						location.reload(true);
    					},
    				})
			 	})//end回答問題
			 	//清除回覆欄
			 	$("#resetanswer"+currentindex).on("click", function(){
			 		$("#answertext"+currentindex).val("");
			 		$("#submitanswer"+currentindex).attr("disabled", true);
			 	})
			 	//end清除回覆欄
    		 })
    		 index ++;
    	 })//end of each	 
     }//end of showtable()
//	end顯示Q&A列表	
//	提問功能
	$("#questiontext").on("input", function(){
		var questionLength = $("#questiontext").val().length;
		if(questionLength != 0){
			$("#submitquestion").removeAttr("disabled");
		} else if(questionLength == 0){
			$("#submitquestion").removeAttr("disabled");
			$("#submitquestion").attr("disabled", true);
		}
	})
	var notPublic = false;
    $("#notPublic").click(function(){
		notPublic = $("#notPublic").prop("checked");
	})	
	$("#submitquestion").click(function(){
		var questionData = JSON.stringify({"productid":${product.id}, "question":$("#questiontext").val(), "notPublic":notPublic});
		$.ajax({
			type: "POST",
			url: "/qanda/question",
			data: questionData,
			contentType : "application/json",
		    dataType: "json",
		    async: false,
			success: function(data){
// 				console.log(data);
				 $("#qatable").empty();
				 showtable(data);
				window.location="#qBookmark";
		       },
		})
	})
//	end 提問功能
//	清除問題
	$("#resetquestion").click(function(){
		$("#questiontext").val("");
		$("#submitquestion").attr("disabled", true);
	})
// 	end清除問題
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
		 var loginId="${user.id}";
		 var prodUserId="${product.userId.id}";

		 $.each(data, function() {
			imgId++;
			var excBtn2='';
			//顯示交換物品欄的交換鈕
			if(prodUserId.length!=0 && prodUserId==loginId){
				excBtn2 = '<button id="cha" name="cha" type="button" class="btn btn-primary" onclick="javascript:location.href=\'makeSure?id='+ this.id + '\'">交換</button>';
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
//  按下我要交換後出現的物品選單
	$.ajax({
		contentType : "application/json",
		url : "/product/query",
		dataType : "json",
		type : "get",
		data : {"id" : "${user.id}"},
		success : function(data){
			if(data==""){ 
				$("#excBtn").attr("data-target","");
				}
			$.each(data,function(i) {
				var prodimg = $("<img>").addClass("prodimgsm");
				var namespan = $("<h5>").text(data[i].name);
				var div = $("<div></div>").append($(namespan)).append($(prodimg)).addClass("btn").addClass(" btn-default")
				.addClass("exc").attr("name",data[i].id);
				getpicture(data[i], prodimg);
				var nameid= data[i].id;
				$("#userAProduct").append($(div));
 				$(".exc[name="+nameid+"]").bind("click",{id: data[i].id},addexchange);
// 				$(".exc").bind("click",function(){ location.href="/product/exchange/"+$(this).attr("name")+"/"+${product.id}})
			})
		}
	})
});//end of function onload

// 物品放入待交換區 不會重覆交換
function addexchange(event){
	$.ajax({
		contentType : "application/json",
		url : "/product/checkexchanged",
		dataType : "json",
		type : "get",
		data : {"bid" : event.data.id,"aid":${product.id}},
		success : function(data){
			console.log(data);
			if(data == true){
				console.log("aaaaaa");
			 	swal({  title: "Are you sure?", 
		 		text: "你確定要與此物件提出交換?",  
		 		type: "warning",   
		 		showCancelButton: true,   
		 		confirmButtonColor: "#DD6B55",  
		 		confirmButtonText: "是, 我要交換此物件",  
		 		cancelButtonText: "不, 再讓我考慮一下",   
		 		closeOnConfirm: false,   closeOnCancel: false }, 
		 		function(isConfirm){   
		 			if (isConfirm) {    
		 			swal("提出交換!", "已經幫您提出交換請求", "success");  
		 		 	location.href="/product/exchange/"+event.data.id+"/"+${product.id};
		 		} else { 
		 			swal("", "取消交換", "error"); 
		 				}
		 		});

			}else if(data == false){
				swal("", "您已經使用此物品交換過了", "error"); 
			}
		}
	})
	


}
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
				$(prodimg).attr("src", data[0].picture);
			}
		}
	});
}

</script>

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>