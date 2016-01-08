<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"/>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="/resources/css/user.css" />


<script>
$(function(){
	$("#signIn").on('click',function(){
		window.location.href = "/WebContent/index.jsp";
		});
	});	

	
</script>

<style>
#Img1{
	text-align: center;
}
#loginBlock{
	text-align: center;
	margin-top: 150px; 
}
 #localImg{
 	width:50%;
 	margin-top: 100px;
 }
 
 #fpwdLink{
 padding-left: 10px;
 }
 
 
</style>

	<div class="row">
	<div class="col-md-6" id="Img1">
		<img src="/resources/imgs/wallpaper.jpg" id="localImg">
		<div>
			<p>歡迎來到E715交流網，祝您有美好的一天</p>
		</div>
	</div>
	<div class="col-md-6" id="loginBlock">
		<form role="form" class="form-horizontal" action="/head/logincheck" method="post">
			<div class="form-group" id="divBorder">
				<label class="col-sm-2 control-label">Account</label>
				<div class="col-sm-10">
					<input type="text" class="form-control textSize" name="account"  placeholder="Account">
				</div>
			</div>
			<div class="form-group" id="divBorder">
				<label class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control textSize" name="password"
						placeholder="Password">
				</div>
			</div>
			
			<div class="form-group" id="divBorder">
				<div class="col-sm-offset-2 col-sm-10 alignLeft">
					<a href="#" id="NewAccount">建立新帳號</a> 
					<a href="/E715Member/findPassword" id="fpwdLink" >?忘記密碼</a>
					<div class="checkbox">
						<label> <input type="checkbox"> Remember me</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10 alignLeft">
					<input type="submit" class="btn btn-default " value="Sign in"  id="signin" />
				</div>
			</div>
		</form>
	</div>
</div>



<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>