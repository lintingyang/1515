<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user.css" />

<div class="container">
	<div class="row">
		<div class="col-xs-6 col-md-3"></div>

		<div class="col-xs-6 col-md-7" id="divCenter">
		
			<form class="form-horizontal" id="formCenter" action="/E715Member/updataPwd">
			
			<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">輸入舊密碼:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="oldPwd" placeholder="Password" maxlength="15">
					</div>
				</div>
			
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">輸入新密碼:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="newPwd" placeholder="Password" maxlength="15">
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">請再輸入一次:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="newPwdCheck" placeholder="Password">
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="btn btn-default" id="idbuthref">確定</button>
					</div>
				</div>

			</form>
		</div>



		<div class="col-xs-6 col-md-2"></div>
	</div>
</div>
<script>

$("#idbuthref").click(
	function(){
		swal({
			title : "確定要修改密碼嗎?",
			text : "",
			type : "info",
			showCancelButton : true,
			//confirmButtonColor : "#DD6B55",
			confirmButtonText : "YES",
			closeOnConfirm : false,
			showLoaderOnConfirm: true,
			},function() {
				swal({
					type : "success",
					title: "修改成功",  
					text: "",  
					timer: 2000,   
					showConfirmButton: false
				});
				setTimeout(function(){
					$('#formCenter').submit(); }, 1500);
						}
					);
				})
</script>

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>