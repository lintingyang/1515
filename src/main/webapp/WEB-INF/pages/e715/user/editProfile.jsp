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

// 		$("#submit").click(function() {
// 			swal({
// 				title : "修改成功",
// 				text : "已更新您的會員資料",
// 				type : "success",
// 				showCancelButton : false,
// 				confirmButtonColor : "#F5A056",
// 				closeOnConfirm : true
// 			});
// 		})
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

			<form class="form-horizontal" action="/E715Member/updataInfo" id="upUserDataForm"
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
							value="${user.name}" placeholder="輸入姓名">
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
						<input type="text" class="form-control" id="inputPhone"
							value="${user.phone}${cellphone}" name="phone"
							placeholder="輸入家電或手機">
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label class="col-md-2 control-label">備用Email:</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="inputReservedEmail"
							name="email" value="${user.email}" placeholder="輸入備用信箱">
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
						<input type="text" class="form-control" id="inputAddr" name="Addr"
							value="${user.address}" placeholder="輸入地址">
					</div>
				</div>
				<%--喜好商品功能暫時取消
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">喜好商品類別:</label>
					<div class="col-sm-10">
						<c:forEach items="${userLikes}" var="userLikes">
						${userLikes.productCategoryId.name}  
						</c:forEach>
					</div>
				</div>
				 --%>
				<%--喜好商品功能暫時取消
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">喜好商品類別:</label>
					<div class="col-sm-10">
					
						<c:forEach items="${productCategorys}" var="productCategorys">
						--%>
				<%-- 						<c:forEach items="${userLikes}" var="userLikes"> --%>
				<%-- 							<c:if test="${(productCategorys.id eq userLikes.productCategoryId.id)}"> --%>
				<!-- 						<label class="checkbox-inline"> <input type="checkbox" -->
				<%-- 							id="inlineCheckbox1" value="${productCategorys.name}" checked="checked"> ${productCategorys.name} --%>
				<!-- 						</label>  -->
				<%-- 						</c:if> --%>
				<%-- 						</c:forEach> --%>
				<%--喜好商品功能暫時取消 					
	<label class="checkbox-inline"> <input type="checkbox"
							id="inlineCheckbox1" value="${productCategorys.id}" name="interested"> ${productCategorys.name}
						</label> 
						</c:forEach>
					
					</div>
				</div>
--%>
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
						<button type="button" class="btn btn-warning" id="clear">取消</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>

<script>

$("#upUserData").click(
	function(){
		swal({
			title : "確定要修改資料嗎?",
			text : "",
			type : "info",
			showCancelButton : true,
			//confirmButtonColor : "#DD6B55",
			confirmButtonText : "YES",
			closeOnConfirm : false,
			showLoaderOnConfirm: true,
			},function() {
				swal({
// 					"Deleted!",
// 					"Your imaginary file has been deleted.",
// 					"success"
					title: "修改成功",  
					text: "兩秒後會自動跳回",  
					timer: 2000,   
					showConfirmButton: false
				
				});
				
				setTimeout(function(){
					$('#upUserDataForm').submit(); }, 1500);
					
					
					
					}
			);
				})
</script>



<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>