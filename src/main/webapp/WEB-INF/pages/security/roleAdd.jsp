<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html lang="en">
<head>
	<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
	<c:import url="/WEB-INF/pages/layout/javascript.jsp"/>
	<c:import url="/WEB-INF/pages/layout/css.jsp"/>
	<title>E5E5 以物易物網</title>
</head>

<body>
	<div id="wrap">
		<c:import url="/WEB-INF/pages/layout/navigator.jsp"/>

    	<div class="container">
    		<c:import url="/WEB-INF/pages/layout/breadcrumb.jsp" />
			
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-horizontal" id="dataForm">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4><span class="glyphicon glyphicon-edit"></span>&nbsp; <strong>角色新增</strong></h4>
							</div>
							<div class="panel-body">
								<div class="form-group required">								  					
			    					<label for="code" class="col-md-2 control-label">Code</label>
			    					<div class="col-md-10">
			      						<input type="text" class="form-control" id="code" name="code" placeholder="Code" value="${entity.code}"/>
			      						<span class="help-block"><div class="text-danger"></div></span>
			    					</div>
								</div>
								<div class="form-group required">								  					
			    					<label for="name" class="col-md-2 control-label">Name</label>
			    					<div class="col-md-10">
			      						<input type="text" class="form-control" id="name" name="name" placeholder="Name" value="${entity.name}"/>
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
        				<a href="<c:url value='/security/roles/list'/>" class="btn btn-lg btn-primary btn-warning btn-block" data-loading-text="Loading">返回</a>
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
		var $btn = $(this);
			$btn.button("loading");
	
			$.post("<c:url value='/security/roles'/>", "dataForm",
					function(data) {
						if (data.messagesEmpty) {
							$("#dataForm").trigger("reset");
							swal("SUCCESS", "新增成功！", "success");
							$btn.button("reset");
						}
					}, function(data, textStatus, jqXHR) {
						$btn.button("reset");
					});
			
			$btn.button("reset");
		});	
	});
</script>