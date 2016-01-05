<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html lang="en">
<head>
	<c:import url="/WEB-INF/pages/layout/meta.jsp"></c:import>
	<c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import>
	<c:import url="/WEB-INF/pages/layout/css.jsp"></c:import>
	
	<title>E5E5 以物易物網</title>
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
							<label for="code" class="col-sm-2 control-label">代碼</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="code" name="code" placeholder="Code" />
							</div>
							<label for="name" class="col-sm-2 control-label">名稱</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="name" name="name" placeholder="Name" />
							</div>						
							
						</div>
					</form>
				</div>
				
				<div class="row pull-right">
					<button id="searchBtn" class="btn btn-success" data-loading-text="loading..." type="button">搜尋</button>
            		<button id="resetBtn" class="btn btn-warning" data-loading-text="loading..." type="button" value="reset">重設</button>
				</div>
			</section>
			
			<div>
          		<a href="<c:url value='/security/roles/add'/>" class="btn btn-sm btn-primary" data-loading-text="Loading">
            		<span class="glyphicon glyphicon-plus"></span>新增
            	</a>
      		</div>
      		      		
      		<table id="slGrid" class="table table-hover table-condensed table-bordered"></table>
      		
			<div align="center">
				<ul id="slPager"></ul>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/pages/layout/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	
	var url = '<c:url value="/security/roles"/>';
	
	$(function() {
		$("#searchBtn").bind("click", function() {
			$("#slGrid").trigger('reloadGrid');
		});
		
		$("#resetBtn").bind("click", function() {
			$("#name").val("");
			$("#code").val("");
		});
		
		$("#slGrid").slGrid({
			url: url,
			dataFormId: 'listForm',
			mtype: 'GET',
			
			colNames:['id','功能','代碼','名稱','異動人員','異動時間'],
		   	colModel:[
		   		{name:'id', hidden:true},
		   		{name:'btns', width: 150, formatter:btns},
		   		{name:'code', width: 100},
		   		{name:'name', width: 200},
		   		{name:'modifiedBy', width: 200},
		   		{name:'modiiedDate', width: 200}
		   	],
		   	sortname:"id",
		   	sortorder:"DESC",
		   	pager:"slPager",
		   	loadComplete: function() {
		   		$("#searchBtn").button('reset');
		   	}
		});
		
		function btns(value, row) {
			
			var $delBtn = $('<button type="button" class="btn btn-danger btn-xs"></button>');
			$delBtn.append('<span class="glyphicon glyphicon-trash"></span> 刪除');
			
			$delBtn.click(function() {
				swal({
					title: "Are you sure?",
					text: "是否確定刪除此筆資料？",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#F5A056",
					closeOnConfirm: true
				}, function() {
					$delBtn.button('loading');
					$.delete_(url+ "/" + row.id, function() {
						$delBtn.button('reset');
						$("#slGrid").trigger('reloadGrid');
					});
				});
			});
			
			var $editBtn = $('<a class="btn btn-success btn-xs"></a>');
			$editBtn.attr("href", url + "/" + row.id);
			$editBtn.append('<span class="glyphicon glyphicon-pencil"></span> 編輯');
			
			return $("<div></div>").append($editBtn).append("&nbsp;").append($delBtn);
		}
		
	});
</script>
</html>