<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">
<c:import url="/WEB-INF/pages/e715/layout/header.jsp" />
<link rel="stylesheet" href="/resources/css/user.css" />


<div class="container" style="margin: 50px auto;">
<%-- 		<div style="height: 250px"> --%>
<div class="row">
<div class="col-md-4"></div>
  <div class="col-md-4">
	<ul class="nav navbar-nav">
					<li><img class="img-circle" style="width: 200px;"
						src="${user.picture}"></li>
					<li><ul style="list-style: none;">
							<li><h4>${user.account}</h4></li>
							<li>${user.name}</li>
							<li>${user.schoolName}</li>
						</ul></li>
					<%--<li><span class="glyphicon glyphicon-plus">123</span></li> --%>
			
				</ul>
</div>
  <%-- 		</div> --%>
  <div class="col-md-4"></div>
  
</div>

<div class="row">
  <div class="col-md-4"></div>
  <div class="col-md-4">
  <span class="alignCenter">
  <h1>好友名單</h1>
  
  </span>
  </div>
  <div class="col-md-4"></div>
</div>

<%-- 黑名單功能暫時取消2016/01/12
<-- 	<div class="container"> -->
<!-- 		<div> -->
			<!-- Nav tabs -->
<!-- 			<br> <br> -->
<!-- 			<ul class="nav nav-tabs" role="tablist"> -->
<!-- 				<li role="presentation" class="active"><a href="#" -->
<!-- 					class="goodfriendShip" aria-controls="home" role="tab" -->
<!-- 					data-toggle="tab" id="123">好友名單</a></li> -->
<!-- 				<li role="presentation"><a href="#" class="friendShip" -->
<!-- 					aria-controls="profile" role="tab" data-toggle="tab" id="456">黑名單</a></li> -->
<!-- 			</ul> -->
<!-- Tab panes -->
<!-- 		</div> -->
<!-- 	</div> -->
--%>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<%-- 上頁面分頁功能(排版不好移除
<!-- 		<div class="holder"></div> -->
--%>
		<div id="friendShipContainer"></div>
		<div class="holder"></div>
		</div>
		<div class="col-md-1"></div>
	</div>



</div>

<script type="text/javascript">
	$(function() {
		$.ajax({
			contentType : "application/json",
			url : "/E715Member/userFriendList",
			dataType : "json",
			type : "post",
			data : "",
			success : function(data) {
				// 			console.log(data);

				$("#friendShipContainer").html('');
				$.each(data,function(i) {
							var friendShipdiv = $("<div></div>");
							var aclick = $("<a>").attr("href",
									"/E715Member/" + data[i].userBId.id);
							var MemberImg = $("<img/>").attr("src",
									data[i].userBId.picture);
							MemberImg.addClass('img-circle').css('height',
									'80px');
							var temp = aclick.append(MemberImg);

							var pAccount = $("<p>").text(
									data[i].userBId.account);
							var pName = $("<p>").text(data[i].userBId.name);
							var pSchoolName = $("<p>").text(
									data[i].userBId.schoolName);
							var pbtn = $('<button>').prop('type', 'button')
									.addClass('btn btn-warning btn-lg userShelf'+data[i].userBId.id);
							var pbtnSpan = $('<span>').addClass(
									'glyphicon glyphicon-remove').prop(
									'aria-hidden', true).text(
									'取消關注');
							var temp2 = pbtn.append(pbtnSpan);
							$(friendShipdiv).addClass("userdiv").append(temp)
									.append(pName).append(pAccount).append(
											pName).append(pSchoolName).append(
											temp2);
							$("#friendShipContainer").append(friendShipdiv);
							//以上為找尋關注好友
							
							//以下為取消好友
							
							
							
							$("div.holder").jPages({
								containerID : "friendShipContainer",
								perPage : 20,
								fallback : 500,
								first : "第一頁",
								previous : "上一頁",
								next : "下一頁",
								last : "最後頁",

							//.jpages的下括弧↓
							});
							//增加取消好友功能(完成)
							$("#friendShipContainer > div").on('click','.userShelf'+data[i].userBId.id,function(){
								console.log({'userBId' :data[i].userBId.id});
								var formData={'userBId' :data[i].userBId.id}
								$.ajax({
									contentType : "application/json",
									url : "/E715Member/userFriendListCancel",
									dataType : "text",
									type : "get",
									data : formData,
									success : function(data) {
										$(data).parent().remove();
									}
								});
							});
							//.each的下括弧
						});
				//success的下括弧	
			}
		//.ajax的下括弧
		});
		//onload的下括弧
	});
	
	
	/* 黑名單功能暫時取消2016/01/12(-揚)
//好友名單click開始
	$('.goodfriendShip').click(
			function() {
				$.ajax({
					contentType : "application/json",
					url : "/E715Member/userFriendList",
					dataType : "json",
					type : "post",
					data : "",
					success : function(data) {
						$("#friendShipContainer").html('');
						$.each(data, function(i) {
							var friendShipdiv = $("<div></div>");
							var aclick = $("<a>").attr("href",
									"/E715Member/" + data[i].userBId.id);
							var MemberImg = $("<img/>").attr("src",
									data[i].userBId.picture);
							MemberImg.addClass('img-circle').css('height',
									'80px');
							var temp = aclick.append(MemberImg);

							var pAccount = $("<p>").text(
									data[i].userBId.account);
							var pName = $("<p>").text(data[i].userBId.name);
							var pSchoolName = $("<p>").text(
									data[i].userBId.schoolName);
							var pbtn = $('<button>').prop('type', 'button')
									.addClass('btn btn-warning btn-lg userShelf'+data[i].userBId.id);
							var pbtnSpan = $('<span>').addClass(
									'glyphicon glyphicon-remove').prop(
									'aria-hidden', true).text(
									'取消關注');
							var temp2 = pbtn.append(pbtnSpan);
							$(friendShipdiv).addClass("userdiv").append(temp)
									.append(pName).append(pAccount).append(
											pName).append(pSchoolName).append(
											temp2);
							$("#friendShipContainer").append(friendShipdiv);
							$("div.holder").jPages({
								containerID : "friendShipContainer",
								perPage : 20,
								fallback : 500,
								first : "第一頁",
								previous : "上一頁",
								next : "下一頁",
								last : "最後頁",

							//.jpages的下括弧↓
							});
							//增加取消好友功能(完成)
							$("#friendShipContainer > div").on('click','.userShelf'+data[i].userBId.id,function(){
								var formData={'userBId' :data[i].userBId.id}
								$.ajax({
									contentType : "application/json",
									url : "/E715Member/userFriendListCancel",
									dataType : "text",
									type : "get",
									data : formData,
									success : function(data) {
										$(data).parent().remove();
									}
								});
							});
							//.each的下括弧
						});
						//success的下括弧	
					}
				});
			});
	//好友名單click結束
	
	//黑名單開始
	$('.friendShip').click(
			function() {
				$.ajax({
					contentType : "application/json",
					url : "/E715Member/userBanList",
					dataType : "json",
					type : "post",
					data : "",
					success : function(data) {
						$("#friendShipContainer").html('');
						$.each(data, function(i) {
							
							var friendShipdiv = $("<div></div>");
							var aclick = $("<a>").attr("href",
									"/E715Member/" + data[i].userBId.id);
							var MemberImg = $("<img/>").attr("src",
									data[i].userBId.picture);
							MemberImg.addClass('img-circle').css('height',
									'80px');
							var temp = aclick.append(MemberImg);

							var pAccount = $("<p>").text(
									data[i].userBId.account);
							var pName = $("<p>").text(data[i].userBId.name);
							var pSchoolName = $("<p>").text(
									data[i].userBId.schoolName);
							var pbtn = $('<button>').prop('type', 'button')
									.addClass('btn btn-success btn-lg userShelf'+data[i].userBId.id);
							var pbtnSpan = $('<span>').addClass(
									'glyphicon glyphicon-repeat').prop(
									'aria-hidden', true).text(
									'取消封鎖');
							var temp2 = pbtn.append(pbtnSpan);
							$(friendShipdiv).addClass("userdiv").append(temp)
									.append(pName).append(pAccount).append(
											pName).append(pSchoolName).append(
											temp2);
							$("#friendShipContainer").append(friendShipdiv);
							$("div.holder").jPages({
								containerID : "friendShipContainer",
								perPage : 20,
								fallback : 500,
								first : "第一頁",
								previous : "上一頁",
								next : "下一頁",
								last : "最後頁",

							//.jpages的下括弧↓
							});
							//增加取消黑名單功能(完成)
							$("#friendShipContainer > div").on('click','.userShelf'+data[i].userBId.id,function(){
								var formData={'userBId' :data[i].userBId.id}
								$.ajax({
									contentType : "application/json",
									url : "/E715Member/userBanListCancel",
									dataType : "text",
									type : "get",
									data : formData,
									success : function(data) {
										//動態移除黑名單
										$(data).parent().remove();
									}
							});
// 								location.reload();
							});
							//.each的下括弧
						});
						//success的下括弧	
					}
				});
			});
	*//*
	$(function() {
		$("div.holder").jPages({
			containerID : "itemContainer1",
			perPage : 20,
			fallback : 500,
			first : "第一頁",
			previous : "上一頁",
			next : "下一頁",
			last : "最後頁",
		});
	});*/
</script>



<c:import url="/WebContent/layout/footer.jsp"></c:import>