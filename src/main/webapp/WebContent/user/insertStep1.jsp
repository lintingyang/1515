<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user.css" />

<style>
#formInsertEmail {
	
}

#btnCenter {
	text-align: center;
	padding-top: 15px;
	padding-bottom: 15px;
}

#inputEmail3 {
	width: 75%;
}

#inputPassword3 {
	width: 25%;
}

#btnNextStep {
	width: 70px;
	height: 35px;
}

#btnCheck {
	width: 70px;
	height: 35px;
}
</style>

<script>

	$(function(){
		$("#btnNextStep").on('click',function(){
			window.location.href = "insertStep2.jsp";
			});
		});	
	
	
</script>


<div class="row">
	<div class="col-xs-6 col-md-2"></div>

	<div class="col-xs-6 col-md-8" id="divCenter">

<!-- 		<div class="progress progress-striped active"> -->
<!-- 			<div class="progress-bar progress-bar-info" role="progressbar" -->
<!-- 				aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" -->
<!-- 				style="width: 0%;"> -->
<!-- 				</div> -->
<!-- 		</div> -->
		
		
		<form class="form-horizontal">
			<div class="form-group" id="divBorder">
				<label for="inputEmail3" class="col-sm-2 control-label">School_Email</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3"
						placeholder="Email">
				</div>
			</div>
			<div id="btnCenter">
				<button type="button" class="btn btn-default" id="btnCheck">
					送出</button>
			</div>
			<div class="form-group" id="divBorder">
				<label for="inputPassword3" class="col-sm-2 control-label">輸入驗證碼</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputPassword3"
						maxlength="4">
				</div>
			</div>


			<div id="btnCenter">
				<button type="button" class="btn btn-default" id="btnNextStep">下一步</button>
			</div>

		</form>

	</div>

	<div class="col-xs-6 col-md-2"></div>



</div>


<c:import url="/WebContent/layout/footer.jsp"></c:import>