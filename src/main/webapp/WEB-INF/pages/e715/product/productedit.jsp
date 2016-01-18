<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<%-- <c:import url="/WEB-INF/pages/layout/meta.jsp"></c:import> --%>
<%-- <c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import> --%>
<%-- <c:import url="/WEB-INF/pages/layout/css.jsp"></c:import> --%>

<div class="container" style="margin: 50px auto;">
	<div class="container">
		<!-- 這個div 銘 -->
		<div class="alert alert-success alert-dismissible" role="alert" id="thx" style="display: none;">
  			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  			<strong>恭喜您編輯商品成功！！</strong>    祝您有美好的一天    ^^
		</div>
		<ul class="nav nav-tabs " id="tabs">
			<li style="width: 20%; text-align: center;"><a
				class="categorylist searchbtn queryBtn" id = "posted" href="#">收到的交換<span class="badge" id ="totalCount"></span></a></li>
			<li style="width: 20%; text-align: center;" class = "dropdown" ><a
				class="categorylist searchbtn dropdown-toggle" data-toggle="dropdown" href="#">問與答<span class="badge" id ="totalCountQandA"></span></a>
				<ul class="dropdown-menu">
   			   		<li><a href="#" class = "queryBtn" id = "question">被提出問題<span class="badge" id ="totalCountQ"></span></a></li>
     				<li><a href="#" class = "queryBtn" id = "answer">收到的回答<span class="badge" id ="totalCountA"></span></a></li>
    			</ul>	
			</li>
			
<!-- 			<li style="width: 20%; text-align: center;" ><a -->
<!-- 				class="categorylist searchbtn queryBtn" id = "qAndA" href="#">問與答<span class="badge" id ="totalCountQ"></span></a>	</li>	 -->
			<li style="width: 20%; text-align: center;"><a
				class="categorylist searchbtn queryBtn" id = "notPost" href="#">未刊登</a></li>
			<li style="width: 20%; text-align: center;"><a
				class="categorylist searchbtn queryBtn" id = "exchanging" href="#">提出的交換</a></li>
			<li style="width: 20%; text-align: center;" class = "dropdown" ><a
				class="categorylist searchbtn dropdown-toggle" data-toggle="dropdown" href="#">已交換</a>
				<ul class="dropdown-menu">
   			   		<li><a href="#" class = "queryBtn" id = "OthersExchanged">別人刊登的，現在是我的。</a></li>
     				<li><a href="#" class = "queryBtn" id = "myExchanged">我刊登的，現在是別人的。</a></li>
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
var total = 0 , totalQ = 0 , totalA = 0;

//銘新增的
$(function(){
	var ans = "${result}";
	if(ans == "success"){
		$('#thx').removeAttr('style');
	}
})

$(function() { //進入物品管理先顯示已刊登
	$.post("/product/query1",{ "query" : "posted" } ,function(data) { //點選排列方式後按照順序排列
		
			$("#itemContainer").html('');
	
			$.each(data,function(i){
	
				//remove button
				var removeBtn = $("<span></span>").addClass("btn-sm btn-warning glyphicon glyphicon-download-alt remove" +data[i].id)
				.attr("onclick","removeProduct("+data[i].id+")");
				total = 0;
				
				
				var productdiv = $("<div></div>");
				var aclick = $("<a>").attr("href","/product/"+data[i].id);
				var productimg = $("<img>").addClass("prodimg");
				var p = $("<span>").text(data[i].name);
				var badgePost = $("<span>").addClass("badge pCount");
				$(p).append($(badgePost));
				$(aclick).append($(productimg)).append($(p));
				$(productdiv).addClass("proddiv").append($(aclick));
				
				getQandACount(data[i].id , "answer" , null);
				getProductCount(data[i].id , "posted" , badgePost); // 已刊登欲交換數量
				
// 				getQandACount(data[i].id , "question" , null);//
				

				
				
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

		$("#itemContainer").html('');

		
		$.each(data,function(i){
			if(type == "notPost"){ //未刊登
			//update button
			var updateBtn = $("<span></span>").addClass("btn btn-sm btn-success glyphicon glyphicon-pencil ")
			.attr("onclick","location.href='/product/edit/"+data[i].id+"'");

			var delBtn = $("<span></span>").addClass("btn btn-sm btn-danger glyphicon glyphicon-trash delBtn delete" +data[i].id)
			.attr("onclick","deleteProduct("+data[i].id+")");	
			}

			if(type == "posted"){ //已刊登
			//remove button
			var removeBtn = $("<span></span>").addClass("btn-sm btn-warning glyphicon glyphicon-download-alt remove" +data[i].id)
			.attr("onclick","removeProduct("+data[i].id+")");
			total = 0;
			}
			var aclick = $("<a>").attr("href","/product/"+data[i].id);
			
			if(type == "OthersExchanged" || type == "myExchanged"){ //已交換
// 				aclick = $("<a>").bind("onclick", getExchangedProduct(data[i].id)); //會直接跳轉
				aclick = $("<a>").attr("onclick", "getExchangedProduct("+data[i].id+")");
			}
			
			var productdiv = $("<div></div>");
			var productimg = $("<img>").addClass("prodimg");
			var p = $("<span>").text(data[i].name);
			var badgePost = $("<span>").addClass("badge pCount");
			$(p).append($(badgePost));
			$(aclick).append($(productimg)).append($(p));
			$(productdiv).addClass("proddiv").append($(aclick));
			
			if(type == "question" || type == "answer"){
				totalQ = 0;
				totalA = 0;
				getQandACount(data[i].id , type , badgePost); // 已刊登別人提出的問題
			}
			
			if(type == "posted"){
				getProductCount(data[i].id , type , badgePost); // 已刊登欲交換數量
			}

			getpicture(data[i], productimg);//productPic
			
			$(productdiv).append($(updateBtn));
			$(productdiv).append($(delBtn));
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
			console.log("type="+ type);
			if(type == "question"){
				console.log("totalQ");
				totalQ += count;
				$('#totalCountQ').text(totalQ);
			}
			if(type == "answer"){
				console.log("totaA");
				totalA += count;
				$('#totalCountA').text(totalA);
			}
			$('#totalCountQandA').text(totalQ+totalA);
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
		title: "Are you sure?",
		text: "是否確定下架此物品？",
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
		title: "Are you sure?",
		text: "是否確定刪除此筆資料？",
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

<c:import url="/WebContent/layout/footer.jsp"></c:import>