<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html lang="en">
<head>
	<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
	<c:import url="/WEB-INF/pages/layout/javascript.jsp"/>
	<c:import url="/WEB-INF/pages/layout/css.jsp"/>
	<title>E715</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/pages/layout/navigator.jsp"/>

    	<div class="container">
    		<c:import url="/WEB-INF/pages/layout/breadcrumb.jsp" />
			
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-horizontal" id="dataForm">
						<input type="hidden" id="id" name="id" value="${entity.id}"/>
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4><span class="glyphicon glyphicon-edit"></span>&nbsp; <strong>使用者狀態修改</strong></h4>
							</div>
							<div class="panel-body">
								<div class="form-group">								  					
			    					<label for="name" class="col-md-2 control-label">使用者id</label>
			    					<div class="col-md-10">
			    						<h4>${entity.id}</h4>
			    					</div>
								</div>
								<div class="form-group">								  					
			    					<label for="name" class="col-md-2 control-label">使用者名稱</label>
			    					<div class="col-md-10">
			    						<h4>${entity.name}</h4>
			    					</div>
								</div>
								<div class="form-group">								  					
			    					<label for="name" class="col-md-2 control-label">使用者帳號</label>
			    					<div class="col-md-10">
			    						<h4>${entity.account}</h4>
			    					</div>
								</div>
								<div class="form-group">								  					
			    					<label for="name" class="col-md-2 control-label">使用者權限</label>
			    					<div class="col-md-10">
			    						<h4>${entity.role}</h4>
			    					</div>
								</div>
								<div class="form-group required">								  					
			    					<label for="name" class="col-md-2 control-label">使用者狀態</label>
			    					<div class="col-md-10">
<%-- 			    						<span style="font-size: x-large ;color: red; background: yellow;">${entity.isolated}</span> --%>
			    						<label style="margin-left: 20px ;font-size: x-large; color: blue;"> 
			    							<input type="radio" name="isolated" value="FALSE" id="f">正常使用</label>
			    						<label style="margin-left: 20px ;font-size: x-large; color: blue;"> 
			    							<input type="radio" name="isolated" value="TRUE" id="t">禁止使用</label>
			      						<span class="help-block"><div class="text-danger"></div></span>
			    					</div>
								</div>
			  				</div>	
						</div>		
		 			</form>
				</div>				
			</div>
			<div class="row">
      			<div class="col-md-6">
      				<div>
      					<a href="#" class="btn btn-lg btn-primary btn-block" data-loading-text="Loading" id="saveButton">儲存</a>
      				</div>
        		</div>
        		<div class="col-md-6">
        			<div>
        				<a href="<c:url value='/admin/users/list'/>" class="btn btn-lg btn-primary btn-warning btn-block" data-loading-text="Loading">返回</a>
        			</div>
        		</div>
      		</div>			
		</div>
	</div>
	
   	<c:import url="/WEB-INF/pages/layout/footer.jsp"/>
</body>
</html>

<script type="text/javascript">
$(function() {
	<!-- Save -->	
	$("#saveButton").bind("click",
		function() {
		setTimeout(function(){location.reload(); }, 2000);
		var $btn = $(this);
			$btn.button("loading");
			
			$.put("<c:url value='/admin/users'/>", "dataForm",
					function(data) {
						if (data.messagesEmpty) {
							swal("SUCCESS", "資料更新成功！", "success");
							$btn.button("reset");
						}
					}, function(data, textStatus, jqXHR) {
						$btn.button("reset");
					});
			
			$btn.button("reset");
		});
	
	
	
	var ps = "${entity.isolated}";
	if(ps == "FALSE"){
		$('#f').attr('checked','true'); 
	}else{
		$('#t').attr('checked','true'); 
	}
});
</script>