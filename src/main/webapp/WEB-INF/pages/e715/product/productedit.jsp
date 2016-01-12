<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<%-- <c:import url="/WEB-INF/pages/layout/meta.jsp"></c:import> --%>
<%-- <c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import> --%>
<%-- <c:import url="/WEB-INF/pages/layout/css.jsp"></c:import> --%>

<div class="container" style="margin: 50px auto;">
	<div class="container">
		<div><h3 style="color:#000079">${result}</h3></div>		<!-- 銘加的 -->
		<ul class="nav nav-tabs " id="tabs">
			<li style="width: 25%; text-align: center;"><a
				class="categorylist searchbtn" id = "posted" href="#">已刊登<span class="badge" id ="totalCount"></span></a></li>
			<li style="width: 25%; text-align: center;"><a
				class="categorylist searchbtn" id = "notPost" href="#">未刊登</a></li>
			<li style="width: 25%; text-align: center;"><a
				class="categorylist searchbtn" id = "btnC" href="#">我想跟別人交換</a></li>
			<li style="width: 25%; text-align: center;"><a
				class="categorylist searchbtn" id = "btnD" href="#">已交換</a></li>
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
var total = 0;


$('.categorylist').click(function() {
	
	console.log("categorylist = "+ $(this).val("id"));
	var type = $(this).attr("id");

	$.ajax({
		contentType:"application/json",
		url:"/product/query1",
		dataType :"json",
		type:"get",
		data:{ "query" : type},
		//success
		success: function(data){

		$("#itemContainer").html('');

		
		$.each(data,function(i){
			if(type == "notPost"){ //未刊登
			//update button
			var updateBtn = $("<span></span>").addClass("btn btn-sm btn-success glyphicon glyphicon-pencil ")
			.attr("onclick","location.href='/product/edit/"+data[i].id+"'");
			//.attr("onclick","editProduct("+data[i].id+")");

			var delBtn = $("<span></span>").addClass("btn btn-sm btn-danger glyphicon glyphicon-trash delBtn delete" +data[i].id)
			.attr("onclick","deleteProduct("+data[i].id+")");	
			}

			if(type == "posted"){ //已刊登
			//remove button
			var removeBtn = $("<span></span>").addClass("btn-sm btn-warning glyphicon glyphicon-download-alt remove" +data[i].id)
			.attr("onclick","removeProduct("+data[i].id+")");
			total = 0;
			}
			
			
			var productdiv = $("<div></div>");
			var aclick = $("<a>").attr("href","/product/"+data[i].id);
			var productimg = $("<img>").addClass("prodimg");
			var p = $("<span>").text(data[i].name);
			var badgePost = $("<span>").addClass("badge pCount");
			$(p).append($(badgePost));
			$(aclick).append($(productimg)).append($(p));
			$(productdiv).addClass("proddiv").append($(aclick));
			
			if(type == "posted"){
				getProductCount(data[i].id , type , badgePost);
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

function getProductCount(id , type ,badgePost){
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
	$.ajax({
		url : "/product/remove",
		dataType : "html",
		type : "post",
		data : formData,
		success:function() {
			alert("已下架");
			$(".remove"+id).parent().remove();
		}
	});
}//remove

function deleteProduct(id){
	var formData ={
			"id":id
	}
	$.ajax({
		url : "/product/delete",
		dataType : "html",
		type : "post",
		data : formData,
		success:function() {
			alert("deleted");
			$(".delete"+id).parent().remove();
// 			$('.categorylist').trigger('click');
		}
	});
}//delete
	
// css/js 衝突
// function deleteProduct(id){
// 	var data ={
// 			"id":id
// 	}
// 	swal({
// 		title: "Are you sure?",
// 		text: "是否確定刪除此筆資料？",
// 		type: "warning",
// 		showCancelButton: true,
// 		confirmButtonColor: "#F5A056",
// 		closeOnConfirm: true
// 	}, function() {
// 		$.ajax({
// 			url : "/product/delete",
// 			dataType : "html",
// 			type : "post",
// 			data : data,
// 			success:function(data) {
				
// 				alert("deleted");
// 				$('.categorylist').trigger('click');
// 			}
// 		});
// 	});	
// }

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
			if (data[0] != null) {
				console.log(data[0].picture);
				$(prodimg).attr("src", data[0].picture);
			}
		}
	});
}//getpicture

</script>

<c:import url="/WebContent/layout/footer.jsp"></c:import>