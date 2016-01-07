<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="/resources/css/user.css" />


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
// 	$(function() {
// 		$("#idbuthref").on('click', function() {
// 			window.location.href = "insertSuccess.jsp";
// 		});
// 	});
	
	function call(){ 
		var kcyear = document.getElementsByName("year")[0], 
		kcmonth = document.getElementsByName("month")[0], 
		kcday = document.getElementsByName("day")[0]; 
		var d = new Date(); 
		var n = d.getFullYear(); 
		for (var i = n; i >= 1950; i--) { 
			var opt = new Option(); 
			opt.value = opt.text = i; 
			kcyear.add(opt); 
		} 

		kcyear.addEventListener("change", validate_date); 
		kcmonth.addEventListener("change", validate_date); 
	
		function validate_date() { 
			var y = +kcyear.value, 
			m = kcmonth.value, 
			d = kcday.value; 
			if (m === "2") 
			var mlength = 28 + (!(y & 3) && ((y % 100) !== 0 || !(y & 15))); 
			else 
			var mlength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][m - 1]; 
			kcday.length = 0; 
			for (var i = 1; i <= mlength; i++) { 
			var opt = new Option(); 
			opt.value = opt.text = i; 
			if (i == d) opt.selected = true; 
			kcday.add(opt); 
			} 
		} 
		validate_date(); 
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
							id="nickname" placeholder="nickname">
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<label for="inputEmail3" class="col-sm-2 control-label">性別:</label>
					<div class="col-sm-10">	
						<input type="radio" value="MALE" id="sex" name="sex" checked="checked">
						<span>男</span> 
						<input type="radio" value="FEMALE" id="sex" name="sex">
						<span>女</span>
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">生日:</label>
					<div class="col-sm-10" style="padding-top: 7px">
					<select name="month" onchange="call()" required> 
					<option value="">select</option> 
					<option value="1">Jan</option> 
					<option value="2">Feb</option> 
					<option value="3">Mar</option> 
					<option value="4">Apr</option> 
					<option value="5">May</option> 
					<option value="6">Jun</option> 
					<option value="7">Jul</option> 
					<option value="8">Aug</option> 
					<option value="9">Sep</option> 
					<option value="10">Oct</option> 
					<option value="11">Nov</option> 
					<option value="12">Dec</option> 
					</select> 月
					<select name="day" required> 
					<option value="">select</option> </select> 
					日<select name="year" onchange="call()" required>  
					<option value="">select</option></select>年 
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">電話:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textSize"
							placeholder="phone" id="phone" name="phone">
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