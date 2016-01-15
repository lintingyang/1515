<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"/>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="/resources/css/user.css" />

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



<div class="container">
	<div class="row">
		<div class="col-xs-6 col-md-2"></div>

		<div class="col-xs-6 col-md-8" id="divCenter">
			<form class="form-horizontal" action="/E715Member/findPasswordStep2">
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
							<input type="text" class="form-control" id="schoolEmail" name="schoolEmail"
								placeholder="學校電子信箱或電話或備用信箱"><span id="notFindSchoolEmail" style="color:red;"></span>
						</div>
						<div class="col-xs-6 col-md-3"></div>
					</div>
				</div>
				<div id="btnCenter" class="sendSchoolEmailbutton">
					<button type="button" class="btn btn-default" id="btnCheck">
						送出</button>
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

<script>
$(function() {
	$('#btnCheck').bind('click','#btnCheck',function(){
		console.log("hahahahahaha")
		$('.sendSchoolEmailbutton').hide();
		$("#notFindSchoolEmail").html('');
		var schoolemail = {"userSchoolEmail":$("#schoolEmail").val()};
		console.log(schoolemail);
		$.ajax({
			contentType : "application/json",
			url : "/E715Member/findPasswordStep1",
			dataType : "text",
			type : "get",
			data : schoolemail,
			success : function(data) {
				console.log(data);
				if(data == "true"){
		$("#notFindSchoolEmail").empty();
		$('#checkFont').empty();
		$('#checkText').empty();
		$('.nextStep').empty();
		var errorMsg =$('<span></span>').text('${checkError.checkFault}${checkError.numberFault}');
		$('#checkFont').append('<p class="alignCenter warmFontColor">輸入驗證碼</p>');
		$('#checkText').append('<input type="text" class="form-control" name="verificationCode" placeholder="輸入驗證碼" maxlength="4">').append(errorMsg);
		
		$('.nextStep').append('<button type="submit" class="btn btn-default" id="findPasswordNextStep">下一步</button>');
		}else{
			$("#notFindSchoolEmail").html('');
			$('.sendSchoolEmailbutton').show();
			$("#notFindSchoolEmail").text('學校信箱還未申請過')
		}
				//success的下括號
			}
		//ajax的下括號
			});
	//click的下括號
		});

	//onload
	});



	
	
</script>


<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>