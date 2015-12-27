<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html lang="en">
<head>
	<c:import url="/WEB-INF/pages/layout/meta.jsp"></c:import>
	<c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import>
	<c:import url="/WEB-INF/pages/layout/css.jsp"></c:import>
	<title>E5E5</title>
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
							<label for="sponsorCode" class="col-sm-2 control-label">中介代碼</label>
							<div class="col-sm-10">
								<select class="form-control" id="sponsorCode" name="sponsorCode">
									<option value="">所有資料</option>
									<option value="none">無 Sponsor/Intermediary</option>
									<c:forEach items="${sponsors}" var="sponsor">
										<option value="${sponsor.code}">( ${sponsor.code} ) ${sponsor.localName}</option>
									</c:forEach>
								</select>
							</div>
            
						</div>					
						<div class="form-group">
							<label for="accountNumber" class="col-sm-2 control-label">帳戶號碼</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="accountNumber" name="accountNumber" placeholder="Account Number" />
							</div>						
							
						</div>
						<div class="form-group">
							<label for="holderName" class="col-sm-2 control-label">持有者姓名</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="holderName" name="holderName" placeholder="Holder Name" />
							</div>
							<label for="holderTin" class="col-sm-2 control-label">持有者TIN</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="holderTin" name="holderTin" placeholder="Holder TIN" />
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
          		<a href="<c:url value='/accounts/add'/>" class="btn btn-sm btn-primary" data-loading-text="Loading">
            	<span class="glyphicon glyphicon-plus"></span>新增</a>
            	<a href="<c:url value='/accounts/download'/>" class="btn btn-sm btn-info" data-loading-text="Loading">
            	<span class="glyphicon glyphicon-download"></span> 下載全部帳戶資料
            	</a>
      		</div>
      		      		
      		<table id="slGrid" class="table table-hover table-condensed table-bordered"></table>
      		
			<div align="center">
				<ul id="slPager"></ul>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/jsp/layout/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	var url = '<c:url value="/accounts"/>';
	
	$(function() {
		$("#searchBtn").bind("click", function() {
			$("#slGrid").trigger('reloadGrid');
		});
		
		$("#resetBtn").bind("click", function() {
			$("#listForm")[0].reset();
		});
		
		$("#slGrid").slGrid({
			url: url,
			dataFormId: 'listForm',
			mtype: 'GET',
			
			colNames:['id','功能','序號','環境','狀態','中介代碼','中介名稱','帳戶號碼','帳戶餘額','持有者姓名','持有者TIN'],
		   	colModel:[
		   		{name:'id', hidden:true},
		   		{name:'btns', width: 120, formatter:btns},
		   		{name:'idx', width: 50, formatter:idx},
		   		{name:'env', width:50},
		   		{name:'status', width:50},
		   		{name:'sponsorCode', width:100},
		   		{name:'sponsorLocalName', width:120},
		   		{name:'accountNumber', width: 150},
		   		{name:'accountBalanceAmt', width: 150, align: 'right', formatter:numberP2Formatter},
		   		{name:'holderName', width: 100},
		   		{name:'holderTin', width: 100}
		   	],
		   	sortname:"id",
		   	sortorder:"ASC",
		   	pager:"slPager",
		   	loadComplete: function() {
		   		$("#searchBtn").button('reset');
		   	}
		});
		
		function btns(value, row) {
			if( row.status == 'VOID' ) {
				return "<div>已刪除</div>";
			}
			
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
					$.delete_(url + "/" + row.id, function() {
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
		
		function idx(value, row) {
			return new Number(value) + 1;
		}		
	});
</script>
</html>