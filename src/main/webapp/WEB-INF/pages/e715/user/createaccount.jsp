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



			<form class="form-horizontal" id="formCenter" action="/head/insert">
				<div class="form-group" id="divBorder">

					<label class="col-sm-2 control-label" >帳號:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textSize" id="account" name="account"
							placeholder="account" maxlength="15" required> ${errors.account}
					</div>


				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">密碼:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textSize" name="password"
							id="password" placeholder="password" maxlength="15" required>${errors.password}
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">姓名:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textSize" id="name" name="name"
							placeholder="name" required>
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">暱稱:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textSize" name="nickname"
							id="nickname" placeholder="nickname" required>
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<label for="inputEmail3" class="col-sm-2 control-label">性別:</label>
					<div class="col-sm-10">	
						<input type="radio" value="MALE" id="sex" name="sex" checked="checked" required>
						<span>男</span> 
						<input type="radio" value="FEMALE" id="sex" name="sex" >
						<span>女</span>
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
							placeholder="phone" id="phone" name="phone" required>
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">備用Email:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textSize"
							placeholder="Email" id="email" name="email" required>
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


<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>