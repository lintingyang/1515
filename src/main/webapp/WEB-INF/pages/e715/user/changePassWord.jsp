<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user.css" />

<div class="container">
	<div class="row">
		<div class="col-xs-6 col-md-3"></div>

		<div class="col-xs-6 col-md-7" id="divCenter">
		
			<form class="form-horizontal" id="formCenter" action="/E715Member/updataPwd">
			
			<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">輸入舊密碼:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="oldPwd" placeholder="Password" maxlength="15" id="oldPassword">
							<span id="oldPasswordErrorMsg"></span>
					</div>
				</div>
			
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">輸入新密碼:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="newPwd" placeholder="Password" maxlength="15" id="newPassword">
					<span id="newPasswordErrorMsg"></span>
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">請再輸入一次:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="newPwdCheck" placeholder="Password" id="newPasswordCheck">
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
<script>
//確認舊密碼欄位有無輸入
$('#oldPassword').blur(function() {
	var oldPassword = $('#oldPassword').val();
	if (oldPassword.length <= 6){
		$('#oldPasswordErrorMsg').append("<img src='/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>長度不正確</span>");
	}else{
		$('#oldPasswordErrorMsg').html('');
	}
})
//確認新密碼格式
$('#newPassword').blur(function() {
	var newPassword = $('#newPassword').val();
	var re1 = /(?=^[A-Za-z0-9]{6,12}$)((?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]))^.*$/;
	//判斷新密碼長度不能小於6個字(要大於或等於7)
	if (newPassword.length <= 6){
		$('#newPasswordCheckErrorMsg').append("<img src='/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>長度不正確</span>");
	}	else{ 
		if (!re1.test(newPassword)){
			$('#newPassword').removeAttr('title');
			$('#newPassword').attr('title',"密碼：6~12英數字組合，至少有一個大寫、小寫英文字母及數字，如 A12Rd6");
		}
			
		}
		//else下括弧
	}
	//blur下括弧
})
$('#newPasswordCheck')



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