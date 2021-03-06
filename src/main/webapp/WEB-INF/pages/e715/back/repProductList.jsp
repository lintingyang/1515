<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html lang="en">
<head>
<c:import url="/WEB-INF/pages/layout/meta.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/css.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jPages.css">
<!-- <link rel="stylesheet" href="/resources/css/jPages.css"> -->
<script src="${pageContext.request.contextPath}/resources/js/jPages.js"></script>
<!-- <script src="/resources/js/jPages.js"></script> -->

<title>E715</title>
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/pages/layout/navigator.jsp"></c:import>
		<div class="container">
			<c:import url="/WEB-INF/pages/layout/breadcrumb.jsp" />
			<section class="well">
				<div>
					<form role="form" class="form-horizontal" id="listForm">
						<div class="form-group">
							<div class="col-sm-2"></div>
							<div class="col-sm-2">
								<button id="queryBtn" class="btn btn-primary"
									data-loading-text="loading..." type="button">尚未處理之檢舉列表</button>
							</div>
							<label for="code" class="col-sm-2 control-label">物品名稱</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="product" name="product"
									placeholder="product's name" />
							</div>
						</div>
					</form>
				</div>

				<div class="row pull-right">
					<button id="searchBtn" class="btn btn-success"
						data-loading-text="loading..." type="button">再次審核（搜尋）</button>
					<button id="resetBtn" class="btn btn-warning"
						data-loading-text="loading..." type="button" value="reset">重設</button>
				</div>
			</section>
			<table class="table table-hover table-condensed table-bordered">
				<thead>
					<tr>
						<th style="width: 200px;">審核</th>
						<th>id</th>
						<th>審核結果</th>
						<th>商品名稱</th>
						<th>檢舉原因</th>
						<th>檢舉人</th>
						<th>檢舉時間</th>
						<th>審核時間</th>
					</tr>
				</thead>
				<tbody id="slGrid">
				
				</tbody>
			</table>
			<div class="holder" style="text-align: center;"></div>
		</div>
	</div>
	<c:import url="/WEB-INF/pages/layout/footer.jsp"></c:import>
</body>
<script type="text/javascript">
$(function() { 
	$('#resetBtn').click(function(){
		$("#product").val('');
	});
	
	$('#searchBtn').click(function(){
		$.ajax({
	 		contentType : "application/json",
			url : "${pageContext.request.contextPath}/report/products/query/name",
			dataType : "json",
			type : "get",
	 		data : {"name" : $('#product').val()},
			success : function(data) {
				$("#slGrid").html('');
				$("#product").val('');
				$.each(data,function(i) {
					var tr = $("<tr></tr>");
					var btn = $("<td></td>");
					var btnYes = $("<input type='button' value='通過' class='btn btn-success' style='margin-left: 5px;'></input>")
						.attr('onclick', 'javascript:location.href="${pageContext.request.contextPath}/report/products/updateY?id=' +data[i].id + '"');
					var btnNo = $("<input type='button' value='不通過' class='btn btn-danger' style='margin-left: 5px;'></input>")
						.attr('onclick', 'javascript:location.href=\'${pageContext.request.contextPath}/report/products/updateN?id=' +data[i].id + '\'');
					var rId = $("<td>" +data[i].id +"</td>");
					if(data[i].isPassed == null){
						var btnYes = $("<input type='button' value='通過' class='btn btn-success' style='margin-left: 5px;'></input>")
							.attr('onclick', 'javascript:location.href="${pageContext.request.contextPath}/report/products/updateY?id=' +data[i].id + '"');
						var btnNo = $("<input type='button' value='不通過' class='btn btn-danger' style='margin-left: 5px;'></input>")
							.attr('onclick', 'javascript:location.href=\'${pageContext.request.contextPath}/report/products/updateN?id=' +data[i].id + '\'');
						var rIsPassed = $("<td>尚未審核</td>");
						var rFinishTime = $("<td>尚未審核</td>");
					}else if(data[i].isPassed == "TRUE"){
						btn.text("已審核");
						var rIsPassed = $("<td style='color: green'>通過</td>");
						var rFinishTime = $("<td>" +data[i].finishTime.year +"-" 
								+data[i].finishTime.monthValue +"-"
								+data[i].finishTime.dayOfMonth +"</td>");
					}else if(data[i].isPassed == "FALSE"){
						btn.text("已審核");
						var rIsPassed = $("<td style='color: red'>不通過</td>");
						var rFinishTime = $("<td>" +data[i].finishTime.year +"-" 
								+data[i].finishTime.monthValue +"-"
								+data[i].finishTime.dayOfMonth +"</td>");
					}
					var rProductName = $("<td></td>");
					var a = $("<a href>" + data[i].product.name +"<a>")
						.attr("onclick", "window.open(' /product/" + data[i].product.id +" ', 'e715', config='height=600,width=1100,left=70,top=20');");
// 					var rProductName = $("<td><a href='/product/" + data[i].product.id +"'>" +data[i].product.name +"</a></td>");
					var rArticle = $("<td>" +data[i].article +"</td>");
					var rReporterId = $("<td>" +data[i].reporterId.name +"</td>");
					var rReportTime = $("<td>" +data[i].reportTime.year +"-" 
							+data[i].reportTime.monthValue +"-"
							+data[i].reportTime.dayOfMonth +"</td>");
					
					$(btn).append(btnYes).append(btnNo);
					$(rProductName).append(a);
					$(tr).append(btn).append(rId).append(rIsPassed).append(rProductName)
						.append(rArticle).append(rReporterId).append(rReportTime).append(rFinishTime);
					$('#slGrid').append(tr);
					})
				
				$("div.holder").jPages({
					containerID : "slGrid",
					perPage : 10,
					first : "第一頁",
					previous : "上一頁",
					next : "下一頁",
					last : "最後頁",
				});
			}
		});
	})
	
	$('#queryBtn').click(function(){
		$.ajax({
// 	 		contentType : "application/json",
			url : "${pageContext.request.contextPath}/report/products/query/no",
			dataType : "json",
			type : "get",
// 	 		data : {"name" : $('#product').val()},
			success : function(data) {
				$("#slGrid").html('');
				$("#product").val('');
				$.each(data,function(i) {
					var tr = $("<tr></tr>");
					var btn = $("<td></td>");
					var btnYes = $("<input type='button' value='通過' class='btn btn-success' style='margin-left: 5px;'></input>")
						.attr('onclick', 'javascript:location.href="${pageContext.request.contextPath}/report/products/updateY?id=' +data[i].id + '"');
					var btnNo = $("<input type='button' value='不通過' class='btn btn-danger' style='margin-left: 5px;'></input>")
						.attr('onclick', 'javascript:location.href=\'${pageContext.request.contextPath}/report/products/updateN?id=' +data[i].id + '\'');
					var rId = $("<td>" +data[i].id +"</td>");
					var rIsPassed = $("<td>尚未審核</td>");
					var rFinishTime = $("<td>尚未審核</td>");
					var rProductName = $("<td></td>");
					var a = $("<a href>" + data[i].product.name +"<a>")
						.attr("onclick", "window.open(' /product/" + data[i].product.id +" ', 'e715', config='height=600,width=1100,left=70,top=20');");
// 					var rProductName = $("<td><a href='/product/" + data[i].product.id +"'>" +data[i].product.name +"</a></td>");
					var rArticle = $("<td>" +data[i].article +"</td>");
					var rReporterId = $("<td>" +data[i].reporterId.name +"</td>");
					var rReportTime = $("<td>" +data[i].reportTime.year +"-" 
							+data[i].reportTime.monthValue +"-"
							+data[i].reportTime.dayOfMonth +"</td>");
					
					$(btn).append(btnYes).append(btnNo);
					$(rProductName).append(a);
					$(tr).append(btn).append(rId).append(rIsPassed).append(rProductName)
						.append(rArticle).append(rReporterId).append(rReportTime).append(rFinishTime);
					$('#slGrid').append(tr);
					})
				
				$("div.holder").jPages({
					containerID : "slGrid",
					perPage : 10,
					first : "第一頁",
					previous : "上一頁",
					next : "下一頁",
					last : "最後頁",
				});
			}
		});
	})
	
	$.ajax({
// 		contentType : "application/json",
		url : "${pageContext.request.contextPath}/report/products/query",
		dataType : "json",
		type : "get",
// 		data : {"orderby" : "id"},
		success : function(data) {
			$("#slGrid").html('');
			$.each(data,function(i) {
				var tr = $("<tr></tr>");
				var btn = $("<td></td>");
				var rId = $("<td>" +data[i].id +"</td>");
				if(data[i].isPassed == null){
					var btnYes = $("<input type='button' value='通過' class='btn btn-success' style='margin-left: 5px;'></input>")
						.attr('onclick', 'javascript:location.href="${pageContext.request.contextPath}/report/products/updateY?id=' +data[i].id + '"');
					var btnNo = $("<input type='button' value='不通過' class='btn btn-danger' style='margin-left: 5px;'></input>")
						.attr('onclick', 'javascript:location.href=\'${pageContext.request.contextPath}/report/products/updateN?id=' +data[i].id + '\'');
					var rIsPassed = $("<td>尚未審核</td>");
					var rFinishTime = $("<td>尚未審核</td>");
				}else if(data[i].isPassed == "TRUE"){
					btn.text("已審核");
					var rIsPassed = $("<td style='color: green'>通過</td>");
					var rFinishTime = $("<td>" +data[i].finishTime.year +"-" 
							+data[i].finishTime.monthValue +"-"
							+data[i].finishTime.dayOfMonth +"</td>");
				}else if(data[i].isPassed == "FALSE"){
					btn.text("已審核");
					var rIsPassed = $("<td style='color: red'>不通過</td>");
					var rFinishTime = $("<td>" +data[i].finishTime.year +"-" 
							+data[i].finishTime.monthValue +"-"
							+data[i].finishTime.dayOfMonth +"</td>");
				}
				var rProductName = $("<td></td>");
				var a = $("<a href>" + data[i].product.name +"<a>")
					.attr("onclick", "window.open(' ${pageContext.request.contextPath}/product/" + data[i].product.id +" ', 'e715', config='height=600,width=1100,left=70,top=20');");
// 				var rProductName = $("<td><a href='/product/" + data[i].product.id +"'>" +data[i].product.name +"</a></td>");
				var rArticle = $("<td>" +data[i].article +"</td>");
				var rReporterId = $("<td>" +data[i].reporterId.name +"</td>");
				var rReportTime = $("<td>" +data[i].reportTime.year +"-" 
						+data[i].reportTime.monthValue +"-"
						+data[i].reportTime.dayOfMonth +"</td>");
				
				$(btn).append(btnYes).append(btnNo);
				$(rProductName).append(a);
				$(tr).append(btn).append(rId).append(rIsPassed).append(rProductName)
					.append(rArticle).append(rReporterId).append(rReportTime).append(rFinishTime);
				$('#slGrid').append(tr);
				})
			
			$("div.holder").jPages({
				containerID : "slGrid",
				perPage : 10,
				first : "第一頁",
				previous : "上一頁",
				next : "下一頁",
				last : "最後頁",
			});
		}
	});
	
});

</script>
</html>