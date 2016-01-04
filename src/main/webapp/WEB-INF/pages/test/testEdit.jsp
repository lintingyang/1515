<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html lang="en">
<head>
	<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
	<c:import url="/WEB-INF/pages/layout/javascript.jsp"/>
	<c:import url="/WEB-INF/pages/layout/css.jsp"/>
	<title>SoftLeader Freesia</title>
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
								<h4><span class="glyphicon glyphicon-edit"></span>&nbsp; <strong>訊息修改</strong></h4>
							</div>
							<div class="panel-body">
<!-- 								<div class="form-group required">								  					 -->
<!-- 			    					<label for="code" class="col-md-2 control-label">Id</label> -->
<!-- 			    					<div class="col-md-10"> -->
<%-- 			      						${entity.id} --%>
<!-- 			      						<span class="help-block"><div class="text-danger"></div></span> -->
<!-- 			    					</div> -->
<!-- 								</div> -->
								<div class="form-group required">								  					
			    					<label for="name" class="col-md-2 control-label">Message</label>
			    					<div class="col-md-10">
			      						<input type="text" class="form-control" id="messages" name="messages" placeholder="message" value="${entity.messages}"/>
			      						<span class="help-block"><div class="text-danger"></div></span>
			    					</div>
								</div>
								<div class="form-group required">								  					
			    					<label for="name" class="col-md-2 control-label">User</label>
			    					<div class="col-md-10">
			      						<input type="text" class="form-control" id="user.id" name="user.id" placeholder="user" value="${entity.user.id}"/>
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
        				<a href="<c:url value='/test/chat/list'/>" class="btn btn-lg btn-primary btn-warning btn-block" data-loading-text="Loading">返回</a>
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
	<!-- GIIN Format -->
	$('.giin').inputmask({
		  mask: 'wwwwww.wwwww.aa.999'
	})	
	$('.giin').blur(function() {
		this.value = this.value.toUpperCase();
	});

	<!-- Save -->	
	$("#saveButton").bind("click",
		function() {
		var $btn = $(this);
			$btn.button("loading");
// 			var formData={"id":$("#id").val(),"message":$("#message").val()}
// 			$.ajax({
// 		           type: "PUT",
// 		           url: "/test/chat/",
// 		           data: formData,
// 		           success: function(data){
// 	 	        	   alert(data);
// 		        	   show(data);
// 		           },
// 		           dataType: "json",
// 		           contentType : "application/json"
// 		         });
			
			
			$.put("<c:url value='/test/chat'/>", "dataForm",
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
	});
</script>