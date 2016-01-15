<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"/>
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
$(function() {
	$('#btnCheck').bind('click',function(){
		$('#checkFont').append('<p class="alignCenter warmFontColor">輸入驗證碼</p>');
		$('#checkText').append('<input type="text" class="form-control" id="inputPassword3" placeholder="輸入驗證碼" maxlength="4">');
		$('.nextStep').append('<button type="button" class="btn btn-default" id="btnNextStep">下一步</button>')
		;});


		$(".nextStep").bind('click','#btnNextStep',function() {
			window.location.href = "findPassWord2.jsp";
		});
	});
</script>

<div class="container">
	<div class="row">
		<div class="col-xs-6 col-md-2"></div>

		<div class="col-xs-6 col-md-8" id="divCenter">
			<form class="form-horizontal">
				<div class="row">
					<div class="col-xs-6 col-md-3"></div>
					<div class="col-xs-6 col-md-6">
						<p class="alignCenter importMsgFont">我們會幫您找回您所遺失的密碼，請參照下列步驟指示</p>
					</div>
					<div class="col-xs-6 col-md-3"></div>
				</div>

				<div class="form-group" id="divBorder">
					<div class="row">
						<div class="col-xs-6 col-md-3"></div>
						<div class="col-xs-6 col-md-6">
							<input type="text" class="form-control" id="inputEmail3"
								placeholder="學校電子信箱或電話或備用信箱">
						</div>
						<div class="col-xs-6 col-md-3"></div>
					</div>
				</div>
				<div id="btnCenter">
					<button type="button" class="btn btn-default" id="btnCheck">
						送出
					</button>
				</div>


				<div class="row" id="divBorder">
					<div class="col-xs-6 col-md-4"></div>
					<div class="col-xs-6 col-md-4" id="checkFont">
					</div>
					<div class="col-xs-6 col-md-4"></div>
				</div>

				<div class="form-group" id="divBorder">
					<div class="row">
						<div class="col-xs-6 col-md-4"></div>
						<div class="col-xs-6 col-md-4" id="checkText">
						</div>
						<div class="col-xs-6 col-md-4"></div>
					</div>
				</div>

				<div id="btnCenter" class="nextStep">

				</div>

			</form>



		</div>





		<div class="col-xs-6 col-md-2"></div>



	</div>
</div>

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>