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
		
			<form class="form-horizontal changePasswordForm" id="formCenter" action="${pageContext.request.contextPath}/E715Member/updataPwd">
			
			<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">輸入舊密碼:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="oldPwd" placeholder="請輸入您的舊密碼" maxlength="15" id="oldPassword" name="oldPassword" required>
							<span id="oldPasswordErrorMsg">${oldPasswodFalse}</span>
					</div>
				</div>
			
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">輸入新密碼:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="newPwd" placeholder="密碼：6~12英數字組合，至少有一個大寫或小寫英文字母及數字，如 A1232126" maxlength="15" id="newPassword" required pattern="(?=^[A-Za-z0-9]{6,12}$)((?=.*[A-Za-z])(?=.*[0-9]))^.*$" title="密碼：6~12英數字組合，至少有一個大寫或小寫英文字母及數字，如 A1232126">
					<span id="newPasswordErrorMsg">${nullNewPwd}</span>
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">請再輸入一次:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="newPwdCheck" placeholder="請再次輸入新密碼" id="newPasswordCheck" required pattern="(?=^[A-Za-z0-9]{6,12}$)((?=.*[A-Za-z])(?=.*[0-9]))^.*$" title="密碼：6~12英數字組合，至少有一個大寫或小寫英文字母及數字，如 A1232126">
					<span id="newPasswordCheckErrorMsg" style='color:red;font-size:1px'>${newPwdCheck}</span>
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
var oldPasswordCheck;
//確認舊密碼欄位有無輸入
$('#oldPassword').blur(function() {
	var oldPassword = {"oldPassword":$('#oldPassword').val()};
	$.ajax({
		contentType : "application/json",
		url : "${pageContext.request.contextPath}/E715Member/checkOldPwd",
		dataType : "text",
		type : "get",
		data : oldPassword,
		success : function(data) {	
			oldPasswordCheck = data;
			if(data=="true"){
				$('#oldPasswordErrorMsg').empty();	
			}else{
				$('#oldPasswordErrorMsg').empty();
				$('#oldPasswordErrorMsg').append("<img src='${pageContext.request.contextPath}/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>舊密碼錯誤</span>");
// 				$('#oldPasswordErrorMsg').append("<img src='/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>舊密碼錯誤</span>");

			}
			//success的下括號
			}
	//ajax的下括號
		});
})

$('#newPassword').blur(function() {
	var reg = /(?=^[A-Za-z0-9]{6,12}$)((?=.*[A-Za-z])(?=.*[0-9]))^.*$/; 
	var newPassword = $('#newPassword').val();
	if(reg.test(newPassword)){
	if(newPassword!=''){
		$('#newPasswordErrorMsg').html('');
	} else{
		$('#newPasswordErrorMsg').html('');
		$('#newPasswordErrorMsg').append("<img src='${pageContext.request.contextPath}/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>密碼：密碼不能為空值</span>");
	}
	}else{
		$('#newPasswordErrorMsg').html('');
		$('#newPasswordErrorMsg').append("<img src='${pageContext.request.contextPath}/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>密碼：密碼格式錯誤</span>");
	}
	//blur下括弧
})


$('#newPasswordCheck').blur(function() {
	var newPassword = $('#newPassword').val();
	var newPasswordCheck = $('#newPasswordCheck').val();
	console.log("newPassword != newPasswordCheck"+newPassword != newPasswordCheck)
		if(newPassword != newPasswordCheck){
			$('#newPasswordCheckErrorMsg').html('');
			$('#newPasswordCheckErrorMsg').append("<img src='${pageContext.request.contextPath}/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>密碼：確認密碼與新密碼不符合</span>");
		}else{
			$('#newPasswordCheckErrorMsg').html('');
		}
	
	//blur下括弧
})



$(function() {
		$("#idbuthref").on('click', function() {
			var newPassword = $('#newPassword').val();
			var newPasswordCheck = $('#newPasswordCheck').val();
			console.log(oldPasswordCheck);
			if(newPassword == newPasswordCheck && oldPasswordCheck=="true"){
			swal({
				type : "success",
				title: "修改成功",  
				text: "",  
				timer: 5000,   
				showConfirmButton: false
			});

			setTimeout(function(){
				$('.changePasswordForm').submit(); }, 1000);
			
			}else{
				swal({
					type : "warning",
					title: "請再次確認格式是否正確",  
					text: "",  
					timer: 2000,   
					showConfirmButton: false
				});
			}
			
		});
	});
</script>

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>