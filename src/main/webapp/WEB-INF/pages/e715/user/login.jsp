<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"/>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css" />


<script>
$(function(){
	$("#signin").click(function(){
		
				var temp={"password":$('#password').val(),"account":$('#account').val()};
				
				console.log(temp);
				$.ajax({
					contentType : "application/json",
					url : "${pageContext.request.contextPath}/head/logincheck",
					dataType : "text",
					type : "get",
					data : temp,
					success : function(data) {
						if("TRUE" != data){
						var msg = $("<p>").text(data);
						$( "#dialog-message" ).html('');
						$( "#dialog-message" ).append(msg);
						$( "#dialog-message" ).dialog({
						      modal: true,
						      buttons: {
						        Ok: function() {
						          $( this ).dialog( "close" );
						        }
						      }
						    });

						}else{window.location.replace("${pageContext.request.contextPath}/");}
 					        
					}
				});
			});
	
	
	
	
	$(".three").on('click', function() {
		$("input[name='account']").val('changthree');
		$("input[name='password']").val('aaa');
	});
	
	$(".four").on('click', function() {
		$("input[name='account']").val('leefour');
		$("input[name='password']").val('bbb');
	});
	
	$(".five").on('click', function() {
		$("input[name='account']").val('wangfive');
		$("input[name='password']").val('ccc');
	});
	
	$(".six").on('click', function() {
		$("input[name='account']").val('laosix');
		$("input[name='password']").val('ddd');
	});
// 	yao
	$(".sen").on('click', function() {
		$("input[name='account']").val('fantsen');
		$("input[name='password']").val('eee');
	});	
	$(".snoopy").on('click', function() {
		$("input[name='account']").val('snoopy');
		$("input[name='password']").val('snoopy');
	});
	
	$(".527788").on('click', function() {
		$("input[name='account']").val('527788');
		$("input[name='password']").val('527788');
	});
	$(".superadmin").on('click', function() {
		$("input[name='account']").val('supperadmin');
		$("input[name='password']").val('supper');
	});
// 	end
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
	<div class="col-md-1"></div>
	<div class="col-md-4" id="Img1">
		<img src="${pageContext.request.contextPath}/resources/imgs/logo_c.png" id="localImg">
		<div>
			<p>歡迎來到E715交流網，祝您有美好的一天</p>
		</div>
	</div>
	<div class="col-md-7" id="loginBlock">
		<form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/head/logincheck" method="post">
			<div class="form-group" id="divBorder">
				<label class="col-sm-2 control-label">Account</label>
				<div class="col-sm-10">
					<input type="text" class="form-control textSize" name="account"  id="account"
					placeholder="Account" autofocus> 
				</div>
			</div>
			<div class="form-group" id="divBorder">
				<label class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control textSize" name="password" id="password"
						placeholder="Password">
				</div>
			</div>
			
			<div class="form-group" id="divBorder">
				<div class="col-sm-offset-2 col-sm-10 alignLeft">
					<a href="${pageContext.request.contextPath}/head/emailCheck" id="NewAccount">建立新帳號</a> 
					<a href="${pageContext.request.contextPath}/E715Member/findPassword" id="fpwdLink" >?忘記密碼</a>
					<div class="checkbox">
						<label> <input type="checkbox"> Remember me</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10 alignLeft">
					<input type="button" class="btn btn-default " value="Sign in"  id="signin" />
				</div>
			</div>
<!-- 			<button type="button" class="btn btn-default three" data-container="body" data-toggle="popover" data-placement="left" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."> -->
<!-- 			  張三 -->
<!-- 			</button> -->
			<button type="button" class="btn btn-default four" data-container="body" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
  			李四
			</button>

			<button type="button" class="btn btn-default superadmin" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Vivamus
			sagittis lacus vel augue laoreet rutrum faucibus.">
  			Superadmin
			</button>
<!-- 			<button type="button" class="btn btn-default five" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Vivamus -->
<!-- 			sagittis lacus vel augue laoreet rutrum faucibus."> -->
<!--   			王五 -->
<!-- 			</button> -->
<!-- 			<button type="button" class="btn btn-default six" data-container="body" data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."> -->
<!--   			老六 -->
<!-- 			</button> -->
<!-- 			yao -->
			<button type="button" class="btn btn-default sen" data-container="body" data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
  			黃七
			</button>
<!-- 			<button type="button" class="btn btn-default snoopy" data-container="body" data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."> -->
<!--   			snoopy -->
<!-- 			</button> -->
<!-- 			<button type="button" class="btn btn-default 527788" data-container="body" data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."> -->
<!--   			527788 -->
<!-- 			</button> -->
			
<!-- 			  end -->
		</form>
		
		<div id="dialog-message" title="Download complete"></div>
	</div>
</div>



<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>