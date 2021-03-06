<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp" />
<c:import url="/WEB-INF/pages/layout/meta.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user.css" />
<%-- <c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import> --%>
<%-- <c:import url="/WEB-INF/pages/layout/css.jsp"></c:import> --%>

<style>
#inputDep {
	width: 40%;
}

#inputAddr {
	width: 100%;
}

#inputName {
	width: 40%;
}

#inputNickName {
	width: 40%;
}

#split {
	margin-left: 10px;
	margin-right: 10px;
}

.fileImg {
	margin-top: 8px;
	margin-bottom: 0px;
}
</style>

<script>
	//月曆功能
	$(function() {
		for (var i = 1; i <= 12; i++) {
			var opt = window.document.createElement("option");
			opt.value = i;
			opt.innerHTML = i;
			document.getElementById('month').appendChild(opt);
		}
		//取得現在年份
		var nowYear = new Date().getFullYear();

		//最多活不超過100歲
		var deadYear = nowYear - 100;

		for (var i = deadYear; i <= nowYear; i++) {
			var opt = window.document.createElement("option");
			opt.value = i;
			opt.innerHTML = i;
			document.getElementById('year').appendChild(opt);
		}

		document.getElementById("day").onfocus = Datefocus;
		document.getElementById("day").onblur = Dateblur;

		document.getElementById("day").onchange = function() {
			document.getElementById("day").onfocus = function() {
			};
			document.getElementById("day").onblur = function() {
			};
		};

		document.getElementById("year").onchange = function() {
			document.getElementById("day").onfocus = Datefocus;
			document.getElementById("day").onblur = Dateblur();
		}

		document.getElementById("month").onchange = function() {
			document.getElementById("day").onfocus = Datefocus;
			document.getElementById("day").onblur = Dateblur();
		}
	})

	var tempdate;
	function Datefocus() {
		document.getElementById("day").innerHTML = "";
		tempdate = new Date(document.getElementById("year").value, document
				.getElementById("month").value, 0).getDate();
		var opt = window.document.createElement("option");
		opt.value = ${user.birthday.getDayOfMonth()};
		opt.innerHTML = ${user.birthday.getDayOfMonth()};
		opt.className = "defaultOption";
		document.getElementById('day').appendChild(opt);
		for (var i = 1; i <= tempdate; i++) {
			var opt = window.document.createElement("option");
			opt.value = i;
			opt.innerHTML = i;
			document.getElementById('day').appendChild(opt);
		}

	}

	function Dateblur() {
		document.getElementById("day").innerHTML = "";
	}

</script>
<div class="container">
	<div class="row">
		<div class="col-md-12"></div>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<img class="img-circle" id="dropZone" name="headPortrait"
				style="width: 100px" src="${user.picture}">

			<h3>userAcount</h3>
		</div>
		<div class="col-md-6">

			<h3>修改個人資料</h3>

			<form class="form-horizontal" action="${pageContext.request.contextPath}/E715Member/updataInfo" id="upUserDataForm"
				enctype="multipart/form-data" method="post">

				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">頭像:</label>
					<div class="col-sm-10 fileImg">
						<input type="file" id="exampleInputFile" name="file">
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<label class="col-md-2 control-label">學校信箱:</label>
					<div class="col-md-10">${user.schoolEmail}(已認證)</div>
				</div>



				<div class="form-group" id="divBorder">
					<label class="col-md-2 control-label">姓名:</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="name" name="name"
							value="${user.name}" placeholder="輸入姓名" required>
							<span id="nameErrorMsg"></span>
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label class="col-md-2 control-label">暱稱:</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="nickname"
							name="nickname" value="${user.nickname}" placeholder="在這裡輸入暱稱">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">性別:</label>
					<div class="col-md-10">
						<c:choose>
							<c:when test="${user.sex.toString() eq 'MALE'}">
								<input type="radio" id="radioSex" name="sex" value="MALE"
									checked>
								<span id="radioSex">男</span>
								<input type="radio" id="radioSex" name="sex" value="FEMALE">
								<span id="radioSex">女</span>
								<input type="radio" id="radioSex" name="sex" value="OTHER">
								<span id="radioSex">其他</span>
							</c:when>
							<c:when test="${user.sex.toString() eq 'FEMALE'}">
								<input type="radio" id="radioSex" name="sex" value="MALE">
								<span id="radioSex">男</span>
								<input type="radio" id="radioSex" name="sex" value="FEMALE"
									checked>
								<span id="radioSex">女</span>
								<input type="radio" id="radioSex" name="sex" value="OTHER">
								<span id="radioSex">其他</span>
							</c:when>
							<c:otherwise>
								<input type="radio" id="radioSex" name="sex" value="MALE">
								<span id="radioSex">男</span>
								<input type="radio" id="radioSex" name="sex" value="FEMALE">
								<span id="radioSex">女</span>
								<input type="radio" id="radioSex" name="sex" value="OTHER"
									checked>
								<span id="radioSex">其他</span>
							</c:otherwise>
						</c:choose>

					</div>
				</div>

				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">生日:</label>
					<div class="col-sm-10" style="padding-top: 7px">
						<select name="year" id="year">
							<option value="${user.birthday.getYear()}" selected="selected"
								class="defaultOption">${user.birthday.getYear()}</option>
						</select>年 <select name="month" id="month">
							<option value="${user.birthday.getMonthValue()}"
								selected="selected" class="defaultOption">${user.birthday.getMonthValue()}</option>
						</select>月 <select name="day" id="day">
							<option value="${user.birthday.getDayOfMonth()}"
								selected="selected" class="defaultOption">${user.birthday.getDayOfMonth()}</option>
						</select> 日
					</div>
				</div>
		
				<div class="form-group" id="divBorder">
					<label class="col-md-2 control-label">電話:</label>
					<div class="col-md-10">
					<c:choose>
						<c:when test="${empty user.cellphone}">
						<input type="text" class="form-control user_phone" id="phone"
							value="${user.phone}" name="phone"
							placeholder="輸入家電或手機" required>
							<span id="phoneErrorMsg"></span>
						</c:when>
						<c:otherwise>
						<input type="text" class="form-control user_cellphone" id="phone"
							value="${user.cellphone}" name="phone"
							placeholder="輸入家電或手機" required>
							<span id="phoneErrorMsg"></span>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="email" class="col-md-2 control-label">備用Email:</label>
					<div class="col-md-10">
						<input type="email" class="form-control" id="inputReservedEmail"
							name="email" value="${user.email}" placeholder="輸入備用信箱" required>
						<span id="reservedEmailErrorMsg"></span>
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<label for="inputEmail3" class="col-sm-2 control-label">系所:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="subject"
							name="subject" placeholder="輸入系所" value="${user.subject}">
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">地址:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputAddr" name="addr"
							value="${user.address}" placeholder="輸入地址">
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">關於我</label>
					<div class="col-sm-10">
						<textarea rows="10" cols="70" name="aboutMe"
							onKeyDown='if (this.value.length>=300){event.returnValue=false}'>${user.aboutMe}</textarea>
					</div>
				</div>
				<br> <br> <br> <br> <br> <br> <br>

				<div class="form-group">
					<div class="col-md-offset-2 col-md-10">
						<input type="button" class="btn btn-default" id="upUserData" value="修改">
<%-- 						<button type="button" class="btn btn-warning" id="clear">取消</button> --%>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>

<script>

$("#upUserData").on('click',function(){
	var reg = new RegExp("^.+@.+\\..{2,3}$");
	$('#nameErrorMsg').empty();
	$("#phoneErrorMsg").html('');
	$("#reservedEmailErrorMsg").html('');
	if($("#phone").val()==null){
		$("#phoneErrorMsg").append("<img src='${pageContext.request.contextPath}/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>電話必填</span>");	
	}
	
	if($('#inputReservedEmail').val() == null){
		$("#reservedEmailErrorMsg").append("<img src='${pageContext.request.contextPath}/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>信箱必填</span>");		
	} else{
		var emailCheckAns = reg.test($('#inputReservedEmail').val());
		console.log("emailCheckAns"+emailCheckAns)
		console.log("!emailCheckAns"+!emailCheckAns)
		if(!emailCheckAns){
			$("#reservedEmailErrorMsg").append("<img src='${pageContext.request.contextPath}/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>信箱格式錯誤</span>");		
		}
	}
	
	if($("#name").val()==null){
		$('#nameErrorMsg').append("<img src='${pageContext.request.contextPath}/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>姓名禁止空白</span>");
	}
	
		if($("#name").val()!=null && $("#phone").val()!=null && $('#inputReservedEmail').val()!=null && emailCheckAns){
		swal({
			title : "確定要修改資料嗎?",
			text : "",
			type : "info",
			showCancelButton : true,
			confirmButtonText : "YES",
			closeOnConfirm : false,
			showLoaderOnConfirm: true,
			},function() {
				swal({
					type : "success",
					title: "修改成功",  
					text: "",  
					timer: 5000,   
					showConfirmButton: false
				});

				setTimeout(function(){
					$('#upUserDataForm').submit(); }, 1000);
				}
			);
		}else{
		}
		
		
				})
</script>



<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>