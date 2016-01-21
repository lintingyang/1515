<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<%-- <c:import url="/WEB-INF/pages/layout/meta.jsp"></c:import> --%>
<%-- <c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import> --%>
<%-- <c:import url="/WEB-INF/pages/layout/css.jsp"></c:import> --%>
<style>
.label-pill {
  padding-right: .6em;
  padding-left: .6em;
  border-radius: 10em;
  color:white;
  background: lightgray;
}
.proddiv{
	display: inline-block;
	height: 265px;
	width: 200px;
	text-align: center; 
	color:gray;
	margin:15px;
	cursor :pointer;
	box-shadow:0px 0px 1px gray;
	 background: white;
	}
.proddiv:hover{
	display: inline-block;
	height: 265px;
	width: 200px;
	text-align: center; 
	color:gray;
	margin:15px;
	cursor :pointer;
	box-shadow:1px 1px 10px gray;
}
h4{
	color:gray;
}
.btn-block{
	font-size:medium;
	height: 25px;
}
.editDiv{
 	display: inline-block;
	width:100px;
}
.delDiv{
 	display: inline-block;
	width:100px;
}
.dropdown-menu li:hover .sub-menu {visibility: visible;}
.dropdown:hover .dropdown-menu {display: block;}
</style>
<div class="container" style="margin: 50px auto;">
	<div class="container">
		<!-- 這個div 銘 -->
		<div class="alert alert-success alert-dismissible" role="alert" id="thx" style="display: none;">
  			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  			<strong>恭喜您編輯商品成功！！</strong>    祝您有美好的一天    ^^
		</div>
		<ul class="nav nav-tabs " id="tabs">
			<li style="width: 20%; text-align: center;"><a
				class="categorylist searchbtn queryBtn" id = "posted" href="#">已刊登&nbsp;<span class="label label-pill label-default label-as-badge" id ="totalCount"></span></a></li>
			<li style="width: 20%; text-align: center;" class = "dropdown" ><a
				class="categorylist searchbtn dropdown-toggle" data-toggle="dropdown" href="#">問與答&nbsp;<span class="label label-pill label-default label-as-badge" id ="totalCountQandA"></span></a>
				<ul class="dropdown-menu">
   			   		<li><a href="#" class = "queryBtn" id = "question"><span class="label label-warning label-as-badge" id ="totalCountQ"></span>&nbsp;待回覆的問題</a></li>
     				<li><a href="#" class = "queryBtn" id = "answer"><span class="label label-success label-as-badge" id ="totalCountA"></span>&nbsp;已收到的回覆</a></li>
    			</ul>	
			</li>
			<li style="width: 20%; text-align: center;"><a
				class="categorylist searchbtn queryBtn" id = "notPost" href="#">未刊登</a></li>
			<li style="width: 20%; text-align: center;"><a
				class="categorylist searchbtn queryBtn" id = "exchanging" href="#">提出的交換</a></li>
			<li style="width: 20%; text-align: center;" class = "dropdown" ><a totalCountEval
				class="categorylist searchbtn dropdown-toggle" data-toggle="dropdown" href="#">已交換&nbsp;<span class="label label-pill label-default label-as-badge" id ="totalCountEval"></span></a>
				<ul class="dropdown-menu">
   			   		<li><a href="#" class = "queryBtn" id = "OthersExchanged"><span class="label label-warning label-as-badge" id ="evaluateO"></span>&nbsp;提出的交換</a></li>
     				<li><a href="#" class = "queryBtn" id = "myExchanged"><span class="label label-success label-as-badge" id ="evaluateM"></span>&nbsp;收到的交換</a></li>
    			</ul>	
			</li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" id="productlist">

			<div class="holder"></div>
			<div id="itemContainer"></div>
			<div class="holder"></div>
		</div>
	</div>
</div>

<script type="text/javascript">
var total = 0 , totalQ = 0 , totalA = 0 , totalO = 0 , totalM = 0;

//銘新增的
$(function(){
	var ans = "${result}";
	if(ans == "success"){
		$('#thx').removeAttr('style');
	}
})

$(function() { 

	$.get("/product/query1",{ "query" : "answer" } ,function(data) { //進入物品管理先顯示已刊登 問與答收到回覆數
		$.each(data,function(i){
			getQandACount(data[i].id , "answer" , null);//收到的回答
		})//each
	});
	
	$.get("/product/query1",{ "query" : "question" } ,function(data) { //進入物品管理先顯示已刊登 問與答收到回覆數
		$.each(data,function(i){
			getQandACount(data[i].id , "question" , null);//被提出的問題
		})//each
	});
	
	$.get("/product/query1",{ "query" : "OthersExchanged" } ,function(data) { //進入物品管理先顯示已交換 提出的交換待評價數
		$.each(data,function(i){
			getEvaluateCount(data[i].id , "OthersExchanged" , null);//提出的交換
		})//each
	});
	$.get("/product/query1",{ "query" : "myExchanged" } ,function(data) { //進入物品管理先顯示已交換 收到的交換待評價數
		$.each(data,function(i){
			getEvaluateCount(data[i].id , "myExchanged" , null);//收到的交換
		})//each
	});
	$.post("/product/query1",{ "query" : "posted" } ,function(data) { //進入物品管理先顯示已刊登
		
			$("#itemContainer").html('');
	
			$.each(data,function(i){
	
				//remove button
				var removeBtn = $("<span></span>").addClass("btn-block btn-default glyphicon glyphicon-download-alt remove" +data[i].id)
				.attr("onclick","removeProduct("+data[i].id+")");
// 				var removeBtn = $("<span></span>").text('下架').addClass("btn-sm btn-warning remove" +data[i].id)
// 				.attr("onclick","removeProduct("+data[i].id+")");
				total = 0;
				
				
				var productdiv = $("<div></div>");
				var aclick = $("<a>").attr("href","/product/"+data[i].id);
				var productimg = $("<img>").addClass("prodimg");
				var p = $("<h4></h4>").text(data[i].name).addClass("prodText");
				var badgePost = $("<span></span>").addClass("badge pCount");
				$(p).append($(badgePost));
				$(aclick).append($(productimg)).append($(p));
				$(productdiv).addClass("proddiv").append($(aclick));
				
				getProductCount(data[i].id , "posted" , badgePost); // 已刊登欲交換數量				
				getpicture(data[i], productimg);//productPic
				
				$(productdiv).append($(removeBtn));
				
				$("#itemContainer").append(productdiv);	
				
				})//each		
				
			
				$("div.holder").jPages({
					containerID : "itemContainer",
					perPage : 8,
		 			fallback: 500,
		 			first: "第一頁",
		 			previous: "上一頁",
		 			next: "下一頁",
		 			last: "最後頁",
				});//jpages
	
	})
})//$function

$('.queryBtn').click(function() { //點選排列方式後按照順序排列
	
	console.log("categorylist = "+ $(this).val("id"));
	var type = $(this).attr("id");

	$.ajax({
		contentType:"application/json",
		url:"/product/query1",
		dataType :"json",
		type:"get",
		data:{ "query" : type },
		//success
		success: function(data){
			console.log("answer"+data)
		$("#itemContainer").html('');

		
		$.each(data,function(i){
			
			if(type == "notPost"){ //未刊登
				var delDiv = $('<div></div>').addClass("delDiv");
				var editDiv = $('<div></div>').addClass("editDiv");
				var updateBtn = $("<span></span>").addClass("btn-block btn-default glyphicon glyphicon-pencil ")
				.attr("onclick","location.href='/product/edit/"+data[i].id+"'");
				var delBtn = $("<span></span>").addClass("btn-block btn-default glyphicon glyphicon-trash delBtn delete" +data[i].id)
				.attr("onclick","deleteProduct("+data[i].id+")");	
			}

			if(type == "posted"){ //已刊登
				var removeBtn = $("<span></span>").addClass("btn-block btn-default glyphicon glyphicon-download-alt remove" +data[i].id)
				.attr("onclick","removeProduct("+data[i].id+")");
				total = 0;
			}
			
			var aclick = $("<a>").attr("href","/product/"+data[i].id);
			var productdiv = $("<div></div>");
			var productimg = $("<img>").addClass("prodimg");
			var p = $("<h4></h4>").text(data[i].name);
			var badgePost = $("<span>").addClass("badge pCount");
		
			if(type == "question"){
				console.log("answerproduct"+i);
				totalQ = 0;
				getQandACount(data[i].id , type , badgePost); // 已刊登別人提出的問題
			}
			
			if(type == "answer"){
				totalA = 0;
				getQandACount(data[i].id , type , badgePost); // 已刊登別人的回覆
			}
			
			if(type == "posted"){
				getProductCount(data[i].id , type , badgePost); // 已刊登欲交換數量
			}
			if(type == "OthersExchanged" || type == "myExchanged"){ //已交換
// 				aclick = $("<a>").bind("onclick", getExchangedProduct(data[i].id)); //會直接跳轉
				console.log("OthersExchanged");
				aclick = $("<a>").attr("onclick", "getExchangedProduct("+data[i].id+")");
				if(type == "OthersExchanged"){
					totalO = 0;
					getEvaluateCount(data[i].id , "OthersExchanged" , badgePost);
				}
				if(type == "myExchanged"){
					totalM = 0;
					getEvaluateCount(data[i].id , "myExchanged" , badgePost);
				}
			}
			getpicture(data[i], productimg);//productPic
			
			$(p).append($(badgePost));
			$(aclick).append($(productimg)).append($(p));
			$(productdiv).addClass("proddiv").append($(aclick));
			$(editDiv).append($(updateBtn));
			$(delDiv).append($(delBtn));
			$(productdiv).append($(editDiv));
			$(productdiv).append($(delDiv));
			$(productdiv).append($(removeBtn));
			
			$("#itemContainer").append(productdiv);	
			
			})//each		
			
		
			$("div.holder").jPages({
				containerID : "itemContainer",
				perPage : 8,
	 			fallback: 500,
	 			first: "第一頁",
	 			previous: "上一頁",
	 			next: "下一頁",
	 			last: "最後頁",
			});//jpages
		
		}//success
	});	//ajax
});//click

function getEvaluateCount(id , type ,badgePost){ // 已交換待評價
	$.post("/product/queryExchangeCount", {"id" : id , "query" : type } , function(count){
		if(count>0){
				
			if(type == "OthersExchanged"){
				totalO += count;
				$(badgePost).text("請評價");
				$('#evaluateO').text(totalO);				
			}
			if(type == "myExchanged"){
				totalM += count;
				$(badgePost).text("尚未收到評價");
				$('#evaluateM').text(totalM);
			}
			
			$('#totalCountEval').text(totalO+totalM);
		}//count
	})//post
}//getQandACount

function getExchangedProduct(productId){ //傳入productId 跳轉交易完成頁面
	console.log(productId);
	$.post("/product/exchangedProduct",{ "id" : productId } ,function(exchangeId) {
		location.href="/product/exchanging?id="+exchangeId;
	})
}

function getQandACount(id , type ,badgePost){ // 已刊登別人提出的問題
	$.post("/product/queryQA", {"id" : id , "query" : type } , function(count){
		if(count>0){
			if(count>10){
				$(badgePost).text('10+');				
			}else{
				$(badgePost).text(count);
			}
			if(type == "question"){
				totalQ += count;
				$('#totalCountQ').text(totalQ);				
			}
			if(type == "answer"){
				totalA += count;
				$('#totalCountA').text(totalA);
			}
			
			$('#totalCountQandA').text(totalQ);
		}//count
	})//post
}//getQandACount

function getProductCount(id , type ,badgePost){ // 已刊登欲交換數量
	var data ={
			"id" : id ,
			"query" : type
	}
	$.ajax({
		url : "/product/queryCount",
		dataType : "json",
		type : "post",
		data : data,
		success:function(count) {
				if(count>0){
					if(count>10)
						$(badgePost).text('10+');
					$(badgePost).text(count);
					total += count;
					$('#totalCount').text(total);
				}
		}//success
	});//ajax
}//get

function removeProduct(id){
	var formData ={
			"id":id
	}
	swal({
		title: "是否確定下架此物品？",
		text: "下架物品，物品問與答紀錄將會消失。",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: "#F5A056",
		closeOnConfirm: true
	}, function() {
		$.ajax({
			url : "/product/remove",
			dataType : "html",
			type : "post",
			data : formData,
			success:function() {
				$(".remove"+id).parent().remove();
			}
		});//ajax
	});	//swal
}//remove
	
function deleteProduct(id){
	var data ={
			"id":id
	}
	swal({
		title: "是否確定捨棄此物品？",
		text: "此物品將會消失。",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: "#F5A056",
		closeOnConfirm: true
	}, function() {
		$.ajax({
			url : "/product/delete",
			dataType : "html",
			type : "post",
			data : data,
			success:function(data) {
				$(".delete"+id).parent().remove();
// 				$('.categorylist').trigger('click');
			}
		});//ajax
	});	//swal
}//delete

function getpicture(prod, prodimg) {
	var formData = {
		"id" : prod.id
	}
	$.ajax({
		contentType : "application/json",
		url : "/product/queryimg",
		dataType : "json",
		type : "get",
		data : formData,
		success : function(data) {
			if (data != null) {
// 				console.log(data);
				$(prodimg).attr("src", data.primaryPicture);
			}
		}
	});
}//getpicture

</script>

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>