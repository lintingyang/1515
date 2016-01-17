<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html lang="en">
<head>
<c:import url="/WEB-INF/pages/layout/meta.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/css.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/jPages.css">
<script src="/resources/js/jPages.js"></script>

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
			url : "/report/products/query/name",
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
						.attr('onclick', 'javascript:location.href="updateY?id=' +data[i].id + '"');
					var btnNo = $("<input type='button' value='不通過' class='btn btn-danger' style='margin-left: 5px;'></input>")
						.attr('onclick', 'javascript:location.href=\'updateN?id=' +data[i].id + '\'');
					var rId = $("<td>" +data[i].id +"</td>");
					if(data[i].isPassed == null){
						var btnYes = $("<input type='button' value='通過' class='btn btn-success' style='margin-left: 5px;'></input>")
							.attr('onclick', 'javascript:location.href="updateY?id=' +data[i].id + '"');
						var btnNo = $("<input type='button' value='不通過' class='btn btn-danger' style='margin-left: 5px;'></input>")
							.attr('onclick', 'javascript:location.href=\'updateN?id=' +data[i].id + '\'');
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
					var rProductName = $("<td><a href='/product/" + data[i].product.id +"'>" +data[i].product.name +"</a></td>");
					var rArticle = $("<td>" +data[i].article +"</td>");
					var rReporterId = $("<td>" +data[i].reporterId.name +"</td>");
					var rReportTime = $("<td>" +data[i].reportTime.year +"-" 
							+data[i].reportTime.monthValue +"-"
							+data[i].reportTime.dayOfMonth +"</td>");
					
					$(btn).append(btnYes).append(btnNo);
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
			url : "/report/products/query/no",
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
						.attr('onclick', 'javascript:location.href="updateY?id=' +data[i].id + '"');
					var btnNo = $("<input type='button' value='不通過' class='btn btn-danger' style='margin-left: 5px;'></input>")
						.attr('onclick', 'javascript:location.href=\'updateN?id=' +data[i].id + '\'');
					var rId = $("<td>" +data[i].id +"</td>");
						var rIsPassed = $("<td>尚未審核</td>");
						var rFinishTime = $("<td>尚未審核</td>");
					var rProductName = $("<td><a href='/product/" + data[i].product.id +"'>" +data[i].product.name +"</a></td>");
					var rArticle = $("<td>" +data[i].article +"</td>");
					var rReporterId = $("<td>" +data[i].reporterId.name +"</td>");
					var rReportTime = $("<td>" +data[i].reportTime.year +"-" 
							+data[i].reportTime.monthValue +"-"
							+data[i].reportTime.dayOfMonth +"</td>");
					
					$(btn).append(btnYes).append(btnNo);
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
		url : "/report/products/query",
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
						.attr('onclick', 'javascript:location.href="updateY?id=' +data[i].id + '"');
					var btnNo = $("<input type='button' value='不通過' class='btn btn-danger' style='margin-left: 5px;'></input>")
						.attr('onclick', 'javascript:location.href=\'updateN?id=' +data[i].id + '\'');
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
				var rProductName = $("<td><a href='/product/" + data[i].product.id +"'>" +data[i].product.name +"</a></td>");
				var rArticle = $("<td>" +data[i].article +"</td>");
				var rReporterId = $("<td>" +data[i].reporterId.name +"</td>");
				var rReportTime = $("<td>" +data[i].reportTime.year +"-" 
						+data[i].reportTime.monthValue +"-"
						+data[i].reportTime.dayOfMonth +"</td>");
				
				$(btn).append(btnYes).append(btnNo);
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










// 	var url = '<c:url value="/report/products"/>';

// 	$(function() {
// 		$("#searchBtn").bind("click", function() {
// 			$("#slGrid").trigger('reloadGrid');
// 		});

// 		$("#resetBtn").bind("click", function() {
// 			$("#name").val("");
// 			$("#giin").val("");
// 		});

// 		$("#slGrid").slGrid({
// 			url : url,
// 			dataFormId : 'listForm',
// 			mtype : 'GET',

// 			colNames : [ 'id', '是否通過', '狀態', '物品', '檢舉原因', '檢舉時間', '檢舉人', '審核者'],
// 			colModel : [ {name : 'id', width : 50}, 
// 			             {name : 'btns', width : 70, formatter : btns}, 
// 			             {name : 'isPassed', width : 80}, 
// 			             {name : 'product.name', width : 100}, 
// 			             {name : 'article', width : 300}, 
// 			             {name : 'reportTime', width : 100}, 
// 			             {name : 'reporterId.account',width : 100},
// 			             {name : 'role.name',width : 100} 
// 			           ],
// 			sortname : "id",
// 			sortorder : "DESC",
// 			pager : "slPager",
// 			loadComplete : function() {
// 				$("#searchBtn").button('reset');
// 			}
// 		});

// 		function btns(value, row) {

// 			var $yBtn = $('<a class="btn btn-success btn-xs"></a>');
// 			$yBtn.append('<span class="glyphicon glyphicon-ok"></span> 是');
// 			$yBtn.click(function() {
// 				swal({
// 					title : "Are you sure?",
// 					text : "是否確定 通過 此筆檢舉？",
// 					type : "warning",
// 					showCancelButton : true,
// 					confirmButtonColor : "#F5A056",
// 					closeOnConfirm : true
// 				}, function() {
// 					$delBtn.button('loading');
// 					$.delete_(url + "/" + row.id, function() {
// 						$delBtn.button('reset');
// 						$("#slGrid").trigger('reloadGrid');
// 					});
// 				});
// 			});

// 			var $nBtn = $('<a class="btn btn-danger btn-xs"></a>');
// 			$nBtn.append('<span class="glyphicon glyphicon-remove"></span> 否');
// 			$nBtn.click(function() {
// 				swal({
// 					title : "Are you sure?",
// 					text : "是否確定「不」通過 此筆檢舉？",
// 					type : "warning",
// 					showCancelButton : true,
// 					confirmButtonColor : "#F5A056",
// 					closeOnConfirm : true
// 				}, function() {
// 					$delBtn.button('loading');
// 					$.delete_(url + "/" + row.id, function() {
// 						$delBtn.button('reset');
// 						$("#slGrid").trigger('reloadGrid');
// 					});
// 				});
// 			});

// 			return $("<div></div>").append($yBtn).append("&nbsp;")
// 					.append($nBtn);

// 		}

// 	});
</script>
</html>