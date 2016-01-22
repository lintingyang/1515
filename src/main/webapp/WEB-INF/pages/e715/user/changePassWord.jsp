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
		
			<form class="form-horizontal" id="formCenter" action="${pageContext.request.contextPath}/E715Member/updataPwd">
			
			<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">輸入舊密碼:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="oldPwd" placeholder="Password" maxlength="15" id="oldPassword" name="oldPassword" required>
							<span id="oldPasswordErrorMsg">${oldPasswodFalse}</span>
					</div>
				</div>
			
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">輸入新密碼:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="newPwd" placeholder="Password" maxlength="15" id="newPassword" required pattern="(?=^[A-Za-z0-9]{6,12}$)((?=.*[A-Za-z])(?=.*[0-9]))^.*$" title="密碼：6~12英數字組合，至少有一個大寫或小寫英文字母及數字，如 A1232126">
					<span id="newPasswordErrorMsg">${nullNewPwd}</span>
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">請再輸入一次:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize"
							name="newPwdCheck" placeholder="Password" id="newPasswordCheck" required pattern="(?=^[A-Za-z0-9]{6,12}$)((?=.*[A-Za-z])(?=.*[0-9]))^.*$" title="密碼：6~12英數字組合，至少有一個大寫或小寫英文字母及數字，如 A1232126">
					<span id="newPasswordCheckErrorMsg">${newPwdCheck}</span>
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default" id="idbuthref">確定</button>
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
	var oldPassword = {"oldPassword":$('#oldPassword').val()};
	$.ajax({
		contentType : "application/json",
		url : "${pageContext.request.contextPath}/E715Member/checkOldPwd",
		dataType : "text",
		type : "get",
		data : oldPassword,
		success : function(data) {	
			console.log(data);
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
// //確認新密碼格式
// $('#newPassword').blur(function() {
// 	var newPassword = $('#newPassword').val();
// 	var re1 = /(?=^[A-Za-z0-9]{6,12}$)((?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]))^.*$/;
// 	//判斷新密碼長度不能小於6個字(要大於或等於7)
// 	console.log(re1.test(newPassword));
// 	if (newPassword.length <= 6){
// 		$('#newPasswordErrorMsg').html('');
// 		$('#newPasswordErrorMsg').append("<img src='/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>長度不正確</span>");
// 	}	else{ 
// 		if (!re1.test(newPassword)){
// 			$('#newPasswordErrorMsg').html('');
// // 			$('#newPassword').removeAttr('title');
// // 			$('#newPassword').attr('title',"密碼：6~12英數字組合，至少有一個大寫、小寫英文字母及數字，如 A12Rd6");
// 			$('#newPasswordErrorMsg').append("<img src='/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>密碼：6~12英數字組合，至少有一個大寫、小寫英文字母及數字，如 A12Rd6</span>");
// 		}else{
// 			$('#newPasswordErrorMsg').html('');
// 			$('#newPassword').removeAttr('title');
// 		}
// 		//else下括弧
// 		}
	
	
// 	//blur下括弧
// })


$('#newPasswordCheck').blur(function() {
	var newPassword = $('#newPassword').val();
	var newPasswordCheck = $('#newPasswordCheck').val();
	if(newPassword != newPasswordCheck){
// 		$('#newPasswordCheck').removeAttr('title');
// 		$('#newPasswordCheck').attr('title',"密碼：確認密碼與新密碼不符合");
		$('#newPasswordCheckErrorMsg').html('');
		$('#newPasswordCheckErrorMsg').append("<img src='${pageContext.request.contextPath}/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>密碼：確認密碼與新密碼不符合</span>");
<<<<<<< HEAD
// 		$('#newPasswordCheckErrorMsg').append("<img src='/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>密碼：確認密碼與新密碼不符合</span>");
=======
>>>>>>> branch 'master' of https://github.com/lintingyang/1515.git
	}else{
		$('#newPasswordCheckErrorMsg').html('');
	}
	
	//blur下括弧
})



// $("#idbuthref").click(function(){
// 		var newPassword = $('#newPassword').val();
// 		var newPasswordCheck = $('#newPasswordCheck').val();
// 		if(newPassword == newPasswordCheck){
// 			if('${user.password}'==$('#oldPassword').val()){
// 				swal({
// 					title : "確定要修改密碼嗎?",
// 					text : "",
// 					type : "info",
// 					showCancelButton : true,
// 					//confirmButtonColor : "#DD6B55",
// 					confirmButtonText : "YES",
// 					closeOnConfirm : false,
// 					showLoaderOnConfirm: true,
// 					},function() {
// 						swal({
// 							type : "success",
// 							title: "修改成功",  
// 							text: "",  
// 							timer: 2000,   
// 							showConfirmButton: false
// 						});
// 						setTimeout(function(){
// 							$('#formCenter').submit(); }, 1500);
// 								}
// 							);
// 			}else{
// 				$('#oldPasswordErrorMsg').html('');
// 				$('#oldPasswordErrorMsg').append("<img src='/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>原密碼輸入錯誤</span>");
// 			}
			
// 		}else{
// 			$('#newPasswordCheckErrorMsg').html('');
// 			$('#newPasswordCheckErrorMsg').append("<img src='/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>密碼：確認密碼與新密碼不符合</span>");
// 		}
		
// 		//function下括弧
// 				})
</script>

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>