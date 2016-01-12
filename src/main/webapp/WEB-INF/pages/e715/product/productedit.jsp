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
  			<strong>恭喜您新增商品成功！！</strong>    祝您有美好的一天    ^^
		</div>
		<ul class="nav nav-tabs " id="tabs">
			<li style="width: 25%; text-align: center;"><a
				class="list searchbtn" href="#">已刊登</a></li>
			<li style="width: 25%; text-align: center;"><a
				class="list searchbtn" href="#">未刊登</a></li>
			<li style="width: 25%; text-align: center;"><a
				class="list searchbtn" href="#">待交換</a></li>
			<li style="width: 25%; text-align: center;"><a
				class="list searchbtn" href="#">已交換</a></li>
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

//銘新增的
$(function(){
	var ans = "${result}";
	if(ans == "success"){
		$('#thx').removeAttr('style');
	}
})


$('.list').click(function() {
	
	console.log("list = "+ $(this).text());
	var type = $(this).text();

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
			
			if(type == "未刊登"){
			//update button
			var updateBtn = $("<span></span>").addClass("btn btn-sm btn-success glyphicon glyphicon-pencil ")
			.attr("onclick","location.href='/product/edit/"+data[i].id+"'");
			//.attr("onclick","editProduct("+data[i].id+")");

			var delBtn = $("<span></span>").addClass("btn btn-sm btn-danger glyphicon glyphicon-trash delBtn delete" +data[i].id)
			.attr("onclick","deleteProduct("+data[i].id+")");	
			}

			if(type == "已刊登"){
			//remove button
			var removeBtn = $("<span></span>").addClass("btn-sm btn-warning glyphicon glyphicon-download-alt remove" +data[i].id)
			.attr("onclick","removeProduct("+data[i].id+")");
			}
			
			var productdiv = $("<div></div>");
			var aclick = $("<a>").attr("href","/product/"+data[i].id);
			var productimg = $("<img>").addClass("prodimg");
			var p = $("<span>").text(data[i].name);
			$(aclick).append($(productimg)).append($(p));
			$(productdiv).addClass("proddiv").append($(aclick));
			
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
// 			$('.list').trigger('click');
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
// 				$('.list').trigger('click');
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