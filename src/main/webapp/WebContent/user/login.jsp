<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>

<script>
$(function(){
	$("#signIn").on('click',function(){
		window.location.href = "/E715Web/prodcut/product.jsp";
		
		

		});
	});
</script>



<style>
#Img1{
	text-align: center;
}


 #inputEmail3 { 
 	size:10; 
 	width:50%; 
 } 

 #inputPassword3{ 
 	size:10; 
 	width:50%; 
 } 
 
 #localImg{
 	width:50%
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
		<form class="form-horizontal" id="formTest">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="inputEmail3"
						placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword3"
						placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="insertStep1.jsp">建立新帳號</a> <a href="findPassWord.jsp">?忘記密碼</a>
					<div class="checkbox">
						<label> <input type="checkbox"> Remember me
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" id="signIn">Sign in</button>
				</div>
			</div>
		</form>
	</div>
</div>



<c:import url="/WebContent/layout/footer.jsp"></c:import>