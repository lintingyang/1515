<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user.css" />


<script>
	$(function() {
		$("#signIn").on('click', function() {
			window.location.href = "/WebContent/index.jsp";
		});
	});
	
	$(function() {
		$(".three").on('click', function() {
			$('#inputEmail3').val('changethree');
			$('#inputPassword3').val('aaa');
		});
	});
	
	
	
	
</script>



<style>
#Img1 {
	text-align: center;
}

#loginBlock {
	text-align: center;
	margin-top: 150px;
}

#localImg {
	width: 50%;
	margin-top: 100px;
}

#fpwdLink {
	padding-left: 10px;
}
</style>
<div class="container">
	<div class="row">
		<div class="col-md-6" id="Img1">
			<img src="/resources/imgs/wallpaper.jpg" id="localImg">
			<div>
				<p>歡迎來到E715交流網，祝您有美好的一天</p>
			</div>
		</div>
		<div class="col-md-6" id="loginBlock">
			<form class="form-horizontal" id="formTest">
				<div class="form-group" id="divBorder">
					<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control textSize" id="inputEmail3"
							placeholder="Email">
					</div>
				</div>
				
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="email" class="form-control textSize" id="inputPassword3"
							placeholder="Password">
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<div class="col-sm-offset-2 col-sm-10 alignLeft">
						<a href="insertStep1.jsp">建立新帳號</a> <a href="findPassWord1.jsp"
							id="fpwdLink">?忘記密碼</a>
						<div class="checkbox">
							<label> <input type="checkbox"> Remember me
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 alignLeft">
						<button type="button" class="btn btn-default " id="signIn">Sign
							in</button>
					</div>
				</div>
				<button type="button" class="btn btn-default three" data-container="body" data-toggle="popover" data-placement="left" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
  張三
</button>

<button type="button" class="btn btn-default four" data-container="body" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
  李四
</button>

<button type="button" class="btn btn-default five" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Vivamus
sagittis lacus vel augue laoreet rutrum faucibus.">
  王五
</button>

<button type="button" class="btn btn-default six" data-container="body" data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
  老六
</button>
				
				
			</form>
		</div>
	</div>

</div>

<c:import url="/WebContent/layout/footer.jsp"></c:import>