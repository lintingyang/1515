<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"/>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="/resources/css/user.css" />

<script>
	$(function() {
		$("#idbuthref").on('click', function() {
			if($('#newPassword').val()==$('#newPasswordCheck').val()){
			var re1 = /(?=^[A-Za-z0-9]{6,12}$)((?=.*[A-Za-z])(?=.*[0-9]))^.*$/;
//			 	//判斷新密碼長度不能小於6個字(要大於或等於7)
			if(rel.test($('#newPassword').val())){
			swal({
				type : "success",
				title: "修改成功",  
				text: "",  
				timer: 3000,   
				showConfirmButton: false
			});

			setTimeout(function(){
				$('.upUserPasswordForm').submit(); }, 1000);
			
			}else{
				$('#newPasswordCheckErrorMsg').html('');
				$('#newPasswordCheckErrorMsg').append("<img src='/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>密碼：6~12英數字組合，至少有一個大寫或小寫英文字母及數字，如 A1232126</span>");
				
			}
			}else{
				$('#newPasswordCheckErrorMsg').html('');
				$('#newPasswordCheckErrorMsg').append("<img src='/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>確認密碼與新密碼不符合</span>");
			}
		});
	});
</script>
<div class="container">
	<div class="row">
		<div class="col-xs-6 col-md-3"></div>

		<div class="col-xs-6 col-md-7" id="divCenter">
			<form class="form-horizontal upUserPasswordForm" id="formCenter" action="/E715Member/findPasswordStep3">
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">輸入新密碼:</label><span style="color:red">${checkPasswordError.checkFault}</span>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							id="newPassword" name="newPassword" placeholder="Password" maxlength="15"
							required pattern="(?=^[A-Za-z0-9]{6,12}$)((?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]))^.*$" title="密碼：6~12英數字組合，至少有一個大寫、小寫英文字母及數字，如 A12Rd6"
							>
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">請再輸入一次:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							id="newPasswordCheck" name="newPasswordCheck" placeholder="Name" required><span style="color:red">${checkPasswordError.checkFault}</span>
					<span id="newPasswordCheckErrorMsg"></span>
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

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>