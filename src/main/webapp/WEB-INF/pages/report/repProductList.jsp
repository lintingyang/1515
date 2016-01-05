<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
							<label for="code" class="col-sm-2 control-label">檢舉ID</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="id" name="id"
									placeholder="report's id" />
							</div>
							<div class="col-sm-4">
								<button id="queryBtn" class="btn btn-primary"
									data-loading-text="loading..." type="button">尚未處理之檢舉列表</button>
							</div>
						</div>
					</form>
				</div>

				<div class="row pull-right">
					<button id="searchBtn" class="btn btn-success"
						data-loading-text="loading..." type="button">搜尋</button>
					<button id="resetBtn" class="btn btn-warning"
						data-loading-text="loading..." type="button" value="reset">重設</button>
				</div>
			</section>

			<table id="slGrid"
				class="table table-hover table-condensed table-bordered"></table>

			<div align="center">
				<ul id="slPager"></ul>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/pages/layout/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	var url = '<c:url value="/report/products"/>';

	$(function() {
		$("#searchBtn").bind("click", function() {
			$("#slGrid").trigger('reloadGrid');
		});

		$("#resetBtn").bind("click", function() {
			$("#name").val("");
			$("#giin").val("");
		});

		$("#slGrid").slGrid({
			url : url,
			dataFormId : 'listForm',
			mtype : 'GET',

			colNames : [ 'id', '是否通過', '狀態', '物品', '檢舉時間', '檢舉原因', '檢舉人' ],
			colModel : [ {
				name : 'id',
				hidden : true
			}, {
				name : 'btns',
				width : 70,
				formatter : btns
			}, {
				name : 'status',
				width : 80
			}, {
				name : 'product',
				width : 100
			}, {
				name : 'time',
				width : 100
			}, {
				name : 'reason',
				width : 400
			}, {
				name : 'rUser',
				width : 100
			} ],
			sortname : "id",
			sortorder : "DESC",
			pager : "slPager",
			loadComplete : function() {
				$("#searchBtn").button('reset');
			}
		});

		function btns(value, row) {

			var $yBtn = $('<a class="btn btn-success btn-xs"></a>');
			$yBtn.append('<span class="glyphicon glyphicon-ok"></span> 是');
			$yBtn.click(function() {
				swal({
					title : "Are you sure?",
					text : "是否確定 通過 此筆檢舉？",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#F5A056",
					closeOnConfirm : true
				}, function() {
					$delBtn.button('loading');
					$.delete_(url + "/" + row.id, function() {
						$delBtn.button('reset');
						$("#slGrid").trigger('reloadGrid');
					});
				});
			});

			var $nBtn = $('<a class="btn btn-danger btn-xs"></a>');
			$nBtn.append('<span class="glyphicon glyphicon-remove"></span> 否');
			$nBtn.click(function() {
				swal({
					title : "Are you sure?",
					text : "是否確定「不」通過 此筆檢舉？",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#F5A056",
					closeOnConfirm : true
				}, function() {
					$delBtn.button('loading');
					$.delete_(url + "/" + row.id, function() {
						$delBtn.button('reset');
						$("#slGrid").trigger('reloadGrid');
					});
				});
			});

			return $("<div></div>").append($yBtn).append("&nbsp;")
					.append($nBtn);

		}

	});
</script>
</html>