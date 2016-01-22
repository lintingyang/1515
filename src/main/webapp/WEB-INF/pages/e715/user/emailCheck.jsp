<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"/>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/site.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css" />

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
	$(function() {
		$("#sendSchoolEmil").on('click', function() {
			$('.sendSchoolBtn').append('<span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span>');
			var temp = {"userSchoolEmail":$("#schoolEmail").val(),"chooseSchool":$('#chooseSchool').val()}
			var checkEmailFormat= $('#schoolEmail').val();
			var reg= /(?=^[A-Za-z0-9]{6,12}$)((?=.*[a-zA-Z0-9]))^.*$/;
			$("#schoolEmail").attr('readonly','readonly');
			$("#sendSchoolEmil").hide();
			$("#haveSchoolEmil").hide();
			if(reg.test(checkEmailFormat)){
			$.ajax({
				contentType : "application/json",
				url : "/head/verificationCodeSend",
				dataType : "text",
				type : "get",
				data : temp,
				success : function(data) {
					$('#checkVerificationCodeDiv').html('');
					$('.sendSchoolBtn').html('');
					var divVerification = $('<div></div>').attr('id','divBorder').addClass("form-group");
					var labelVerification = $('<label></label>').addClass("col-sm-2 control-label").attr('for','inputPassword3').text('輸入驗證碼');
					var textDiv = $('<div></div>').addClass('col-sm-10');
					var verificationText = $('<input>').attr('type','text').attr('name','userVerificationCode').addClass('form-control').attr('maxlength','4');
					var temp2 = textDiv.append(verificationText);
					var temp3 = divVerification.append(labelVerification).append(temp2);
					
					
					var btnDiv =  $('<div></div>').attr('id','btnCenter');
					var vbtn = $('<button></button>').prop('type', 'submit').addClass('btn btn-default').text('下一步');
					var errorSpan = $('<span></span>').text('${checkError.checkFault}${checkError.numberFault}');
					var temp4 = btnDiv.append(vbtn).append(errorSpan);
					$('#checkVerificationCodeDiv').append(temp3).append(temp4);
				//success的下括號
 				}
			//ajax的下括號
 			});
			//if下括號
		}else{
			$('#errorMsg').empty();
			$("#sendSchoolEmil").removeAttr('hide');
			$("#haveSchoolEmil").removeAttr('hide');
			$("#schoolEmail").removeAttr('readonly');
			$('#errorMsg').text('輸入格式錯誤:請輸入@以前即可');
		//else下括號	
		}
			//on事件下括號
	});
		
		$("#haveSchoolEmil").on('click', function() {
			$("#haveSchoolEmil").hide();
			$("#sendSchoolEmil").hide();
			$('#checkVerificationCodeDiv').html('');
			var divVerification = $('<div></div>').attr('id','divBorder').addClass("form-group");
			var labelVerification = $('<label></label>').addClass("col-sm-2 control-label").attr('for','inputPassword3').text('輸入驗證碼');
			var textDiv = $('<div></div>').addClass('col-sm-10');
			var verificationText = $('<input>').attr('type','text').attr('name','userVerificationCode').addClass('form-control').attr('maxlength','4');
			var temp2 = textDiv.append(verificationText);
			var temp3 = divVerification.append(labelVerification).append(temp2);
			
			
			var btnDiv =  $('<div></div>').attr('id','btnCenter');
			var vbtn = $('<button></button>').prop('type', 'submit').addClass('btn btn-default').text('下一步');
			var errorSpan = $('<span></span>').text('${checkError.checkFault}${checkError.numberFault}');
			var temp4 = btnDiv.append(vbtn).append(errorSpan);
			$('#checkVerificationCodeDiv').append(temp3).append(temp4);
			
		});
		
		
		
		
		//onload下括弧
	});
	
	
	
	
	
</script>

<div class="container">
	<div class="row">
		<div class="col-xs-6 col-md-2"></div>

		<div class="col-xs-6 col-md-8" id="divCenter">

			<!-- 		<div class="progress progress-striped active"> -->
			<!-- 			<div class="progress-bar progress-bar-info" role="progressbar" -->
			<!-- 				aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" -->
			<!-- 				style="width: 0%;"> -->
			<!-- 				</div> -->
			<!-- 		</div> -->


			<form class="form-horizontal" action="${pageContext.request.contextPath}/head/verificationCodeCheck">
				<div class="form-group" id="divBorder">
				<label class="col-sm-2 control-label">選擇學校</label>
				<div class="col-sm-10" style="padding-top: 7px">
					<select id="chooseSchool" name="chooseSchool">
						<option value="@ntu.edu.tw">台灣大學</option>
						<option value="@mail.ncku.edu.tw">成功大學</option>
						<option value="@nccu.edu.tw">政治大學</option>
						<option value="@cc.ncu.edu.tw">中央大學</option>
						<option value="@ccu.edu.tw">中正大學</option>
						<option value="@mail.nchu.edu.tw">中興大學</option>
						<option value="@niu.edu.tw">宜蘭大學</option>
						<option value="@cc.hwh.edu.tw">華夏科大</option>
						<option value="@mail.yzu.edu.tw">元智大學</option>
						<option value="@stu.ntue.edu.tw">台北教育大學</option>
						
					</select>(*必須)
					</div>
				</div>
			
			
				<div class="form-group" id="divBorder">
					<label for="inputEmail3" class="col-sm-2 control-label">School_Email</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="schoolEmail" name="userSchoolEmail"
							placeholder="輸入學校信箱(@和其後均不用輸入)" required pattern="(?=^[A-Za-z0-9]{6,12}$)((?=.*[a-zA-Z0-9]))^.*$" title="請勿輸入數字和英文以外的符號">
						<span id="errorMsg"></span>
					</div>
				</div>
				<div id="btnCenter" class="sendSchoolBtn">
					<button type="button" class="btn btn-default" id="sendSchoolEmil">
					送出
					</button>
					
				</div>
				<div id="btnCenter">
				<button type="button" class="btn btn-default" id="haveSchoolEmil">
					我已有驗證碼
					</button>
					</div>
				
				<div id="checkVerificationCodeDiv" ></div>
				
			</form>

		</div>

		<div class="col-xs-6 col-md-2"></div>

	</div>
</div>

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>