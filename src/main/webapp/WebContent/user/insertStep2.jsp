<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user.css" />

<script>	
	$(function(){
		$("#idbuthref").on('click',function(){
			window.location.href = "insertStep3.jsp";
			});
		});

</script>
<div class="row">
	<div class="col-xs-6 col-md-3"></div>


	<div class="col-xs-6 col-md-7" id="divCenter">
	

		
		<form class="form-horizontal" id="formCenter">
			<div class="form-group" id="divBorder">
			
				<label class="col-sm-2 control-label">帳號:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control textSize" id="inputAccount"
						placeholder="Account" maxlength="15">
				</div>


			</div>
			<div class="form-group" id="divBorder">
				<label for="inputPassword3" class="col-sm-2 control-label">密碼:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control textSize" id="inputPassword"
						placeholder="Password" maxlength="15">
				</div>
			</div>
			<div class="form-group" id="divBorder">
				<label for="inputPassword3" class="col-sm-2 control-label">姓名:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control textSize" id="inputName"
						placeholder="Name">
				</div>
			</div>
			<div class="form-group" id="divBorder">
				<label for="inputPassword3" class="col-sm-2 control-label">暱稱:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control textSize" id="inputNickName"
						placeholder="NickName">
				</div>
			</div>

			<div class="form-group" id="divBorder">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="btn btn-default" id="idbuthref">下一步</button>
				</div>
			</div>

		</form>
	</div>



	<div class="col-xs-6 col-md-2"></div>
</div>




<c:import url="/WebContent/layout/footer.jsp"></c:import>