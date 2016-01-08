<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<%-- <c:import url="/WEB-INF/pages/layout/meta.jsp"></c:import> --%>
<%-- <c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import> --%>
<%-- <c:import url="/WEB-INF/pages/layout/css.jsp"></c:import> --%>

<div class="container" style="margin: 50px auto;">
	<div class="container">
		<ul class="nav nav-tabs" id="tabs">
			<li style="width: 25%; text-align: center;"><a class="list" href="#">已刊登</a></li>
			<li style="width: 25%; text-align: center;"><a class="list" href="#">未刊登</a></li>
			<li style="width: 25%; text-align: center;"><a class="list" href="#">待交換</a></li>
			<li style="width: 25%; text-align: center;"><a class="list" href="#">已交換</a></li>
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


$('.list').click(function hello() {
	
	console.log("list = "+ $(this).text());
	var type = $(this).text();

	$.ajax({
		contentType:"application/json",
		url:"/product/query1",
		dataType :"json",
		type:"get",
		data:{ "query" : $(this).text()},
		//success
		success: function(data){

		$("#itemContainer").html('');
		
		$.each(data,function(i){
			var productdiv = $("<div></div>");
			
			if(type == "未刊登"){
			//update button
			var updateBtn = $("<span></span>").addClass("btn btn-sm btn-success glyphicon glyphicon-pencil")
			.attr("onclick","location.href='/WebContent/product/newproduct.jsp'");
			//delete button
			var delBtn = $("<span></span>").addClass("btn btn-sm btn-danger glyphicon glyphicon-trash delBtn")
			.attr("onclick","deleteProduct("+data[i].id+")");	

			}

			if(type == "已刊登"){
			//down button
			var downBtn = $("<span></span>").addClass("btn-sm btn-warning glyphicon glyphicon-download-alt");
			}
			
			var productimg = $("<img>").addClass("prodimg");
			var aclick = $("<a>").attr("href","/product/"+data[i].id);
			
			getpicture(data[i], productimg);//productPic
			$(productdiv).addClass("proddiv").append($(aclick));
			$(aclick).text(data[i].name).append($(productimg));
			
			
			$(productdiv).append($(updateBtn));
			$(productdiv).append($(delBtn));
			$(productdiv).append($(downBtn));
			
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
function deleteProduct(id){
	var data ={
			"id":id
	}
	$.ajax({
		url : "/product/delete",
		dataType : "html",
		type : "post",
		data : data,
		success:function(data) {
			
			alert("deleted");
			$('.list').trigger('click');
		}
	});
}
	
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