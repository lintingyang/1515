<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user.css" />


<style>
#radioSex {
	margin-top: 10px;
	margin-left: 5px;
	margin-right: auto;
	margin-bottom: 0px;
}

#split {
	margin-left: 10px;
	margin-right: 10px;
}
</style>

<script>
window.onload = function () {
    for (var i = 1; i <= 12; i++) {
        var opt = window.document.createElement("option");
        opt.value = i;
        opt.innerHTML = i;
        document.getElementById('month').appendChild(opt);
    }
    //取得現在年份
    var nowYear = new Date().getFullYear();
    console.log(nowYear);
    //最多活不超過100歲
    var deadYear = nowYear-100;
    
    for (var i = deadYear; i <= nowYear; i++) {
        var opt = window.document.createElement("option");
        opt.value = i;
        opt.innerHTML = i;
        document.getElementById('year').appendChild(opt);
    }


    document.getElementById("day").onfocus = Datefocus;
    document.getElementById("day").onblur = Dateblur;

    document.getElementById("day").onchange = function () {
        document.getElementById("day").onfocus = function () { };
        document.getElementById("day").onblur = function () { };
    };

    document.getElementById("year").onchange = function () {
        document.getElementById("day").onfocus = Datefocus;
        document.getElementById("day").onblur = Dateblur();
    }

    document.getElementById("month").onchange = function () {
        document.getElementById("day").onfocus = Datefocus;
        document.getElementById("day").onblur = Dateblur();
    }
   
}
var tempdate;
function Datefocus() {
    document.getElementById("day").innerHTML = "";
    tempdate = new Date(document.getElementById("year").value, document.getElementById("month").value, 0).getDate();
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
		<div class="col-xs-6 col-md-3"></div>


		<div class="col-xs-6 col-md-7" id="divCenter">



			<form class="form-horizontal" id="formCenter" action="${pageContext.request.contextPath}/head/insert">
				<div class="form-group" id="divBorder">

					<label class="col-sm-2 control-label" >帳號:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textSize" id="account" name="account"
							placeholder="請輸入您的帳號" maxlength="15" required> ${errors.account}<span id="checkAccountSpan"></span>
<%-- 						<button id="checkAccount">確認帳號</button> --%>
					</div>


				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">密碼:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize" name="password"
							id="password" placeholder="請輸入密碼(需包含一個數字及大寫或小寫字母)" maxlength="15" required pattern="(?=^[A-Za-z0-9]{6,12}$)((?=.*[A-Za-z])(?=.*[0-9]))^.*$" title="密碼：6~12英數字組合，至少有一個大寫或小寫英文字母及數字，如 A1232126">${errors.password}
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">姓名:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textSize" id="name" name="name"
							placeholder="請輸入姓名" required>
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">暱稱:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textSize" name="nickname"
							id="nickname" placeholder="請輸入您的暱稱" required>
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<label for="inputEmail3" class="col-sm-2 control-label">性別:</label>
					<div class="col-sm-10">	
						<input type="radio" value="MALE" id="sex" name="sex" checked="checked">
						<span>男</span> 
						<input type="radio" value="FEMALE" id="sex" name="sex" >
						<span>女</span>
						<input type="radio" value="OTHER" id="sex" name="sex" >
						<span>其他</span>
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">生日:</label>
					<div class="col-sm-10" style="padding-top: 7px">
					<select name="year" id="year" required>  
					<option class="defaultOption">2000</option>
					</select>年 
					<select name="month" id="month" required> 
						<option  class="defaultOption">1</option> 
					</select>月
					<select name="day" id="day" required> 
						<option class="defaultOption">1</option>
					</select> 日
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">電話:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textSize"
							placeholder="請輸入手機或家電" id="phone" name="phone" required>
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="email" class="col-sm-2 control-label">備用Email:</label>
					<div class="col-sm-10">
						<input type="email" class="form-control textSize"
							placeholder="請輸入備用信箱以利找回密碼" id="email" name="email" required>
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<div class="col-sm-offset-2 col-sm-10 btnLeft">
						<button type="submit" class="btn btn-default" id="idbuthref">完成</button>
					</div>
				</div>

			</form>
		</div>



		<div class="col-xs-6 col-md-2"></div>
	</div>

</div>
<script>
// 	$('#checkAccount').on('click',function(){
// 		var sendAccount = {'checkAccount':$('#account').val()}
// 		$.ajax({
// 			contentType : "application/json",
// 			url : "/head/checkAccount",
// 			dataType : "text",
// 			type : "get",
// 			data : sendAccount,
// 			success : function(data) {	
// 				console.log(data);
// 				if(data=="true"){
// 					swal("此帳號可以使用", "", "success");
// 				}else{
// 					swal("帳號已有人使用", "", "warning");
// 				}
// 				//success的下括號
// 				}
// 		//ajax的下括號
// 			});
// 	});

$('#account').on('blur',function(){
	if($('#account').val()!=null){
		var sendAccount = {'checkAccount':$('#account').val()}
		$.ajax({
			contentType : "application/json",
			url : "${pageContext.request.contextPath}/head/checkAccount",
			dataType : "text",
			type : "get",
			data : sendAccount,
			success : function(data) {	
				console.log(data);
				if(data=="true"){
					$('#checkAccountSpan').empty();
					$('#checkAccountSpan').append("<img src='${pageContext.request.contextPath}/resources/icon/trueimg1.png' /><span style='color:red;font-size:1px'>帳號可以使用</span>");		
				}else{
					$('#checkAccountSpan').empty();
					$('#checkAccountSpan').append("<img src='${pageContext.request.contextPath}/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>帳號已有人使用</span>");
				}
				//success的下括號
				}
		//ajax的下括號
			});
	}else{
		$('#checkAccountSpan').empty();
		$('#checkAccountSpan').append("<img src='${pageContext.request.contextPath}/resources/icon/falseimg1.png' /><span style='color:red;font-size:1px'>帳號不能為空</span>");
		
	}
		
	});



</script>

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>