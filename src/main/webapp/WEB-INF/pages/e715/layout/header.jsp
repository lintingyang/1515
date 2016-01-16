<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="/resources/js/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css" >
<script src="/resources/js/bootstrap.min.js" ></script> 
<script src="/resources/js/jquery.lazyload.js"></script>
<script src="/resources/js/sweetalert.min.js"></script>
<%-- <c:import url="/WEB-INF/pages/layout/meta.jsp"></c:import> --%>
<%-- <c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import> --%>
<%-- <c:import url="/WEB-INF/pages/layout/css.jsp"></c:import> --%>

<link rel="stylesheet" href="/resources/css/jPages.css">
<link rel="styleshee" href="/resources/css/user.css" />
<link rel="stylesheet" href="/resources/css/prodcss.css" />
<link rel="stylesheet" href="/resources/css/jquery-ui.css" />
<link rel="stylesheet" href="/resources/css/sweetalert.css" />
<script src="/resources/js/jPages.js"></script>
<script src="/resources/js/jquery-ui.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>E715</title>



</head>
<body>
	<nav id="navbar-example"
		class="navbar navbar-default navbar-fixed navbar-fixed-top"
		style="position : adsolute;">
	<div class="container">

		<div class="navbar-header">
			<button class="navbar-toggle collapsed" type="button"
				data-toggle="collapse" data-target=".bs-example-js-navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">E715</a>
		</div>
		<form class="navbar-form navbar-left" role="search" action="/head/search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search" 
								name="namelike" id="searchbar">
			</div>
			<button type="submit" id="searchbtn"  class="btn btn-default searchbtn" >Submit</button>
		</form>
		<a class="navbar-brand" href="#" data-toggle="modal" data-target="#myModal">
			<span id="categoryname">${ categoryname }<c:if test="${empty categoryname }" >全部</c:if></span>
			<span class="glyphicon glyphicon-menu-down"></span></a>
		<ul class="nav navbar-nav">
	      <li><a href="/chatroom">聊天室</a></li>
	    </ul>
		
		<ul class="nav navbar-nav navbar-right">
			<li id="fat-menu" class="dropdown">
			<c:choose>
					<c:when test="${!empty user.id}">
			
			<a id="drop3" href="#"
				class="dropdown-toggle" data-toggle="dropdown" role="button"
				aria-haspopup="true" aria-expanded="false"> 
				<img class="img-circle" style="height: 20px;"
					src="${user.picture}">
				       ${user.name}
				
					
					
					<span class="caret"></span></a>
				<ul class="dropdown-menu" aria-labelledby="drop3">
					
					<li><a class="userlist" href="/E715Member/${user.id}">會員資料</a></li>
					<li><a class="userlist" href="/E715Member/userFriend">關注名單</a></li>
					<li><a class="userlist" href="/product/list">我的物品</a></li><!-- yao -->
					<li><a class="userlist" href="/mail/list">站內信</a></li>
					<li><a class="userlist" href="/product/add">新增物品</a></li>
					<li><a class="userlist" href="/E715Member/modifyFileAsk">帳號修改</a></li>
					<li><a class="userlist" href="/admin/products/list" id="back" style="display: none;">後台管理</a></li>
					<li><a class="userlist" href="/head/logout">登出</a></li>
<!-- 				<li><a class="userlist" href="/head/login">登入</a></li> -->
					</ul>
					</c:when>
					<c:otherwise>
						<a  href="/head/login"> 
<!-- 				<img class="img-circle" style="width: 30px;" -->
<%-- 					src="${user.picture}">  --%>
				       	登入
					<span class="caret"></span></a>
					</c:otherwise>
					</c:choose>
				</li>
		</ul>
	</div>

	</nav>
	<br><br><br>
	<!--/.nav-collapse -->
	
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="background-color: gray;">
    <div class="modal-content">
<!--       <div class="modal-header"> -->
<!--         <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
        
<!--       </div> -->
      <div class="modal-body alignCenter">
      <h5 id="myModalLabel">請選擇類別</h5>
      		<table style=" margin:auto;">
      			<tr>
					
      				<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/house.png"></div>全部</td>
      				
      				<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/books.png"></div>課本書籍</td>
      				
      				<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/videogame.png"></div>遊戲影音</td>
      				
      				<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/play.png"></div>日常用品</td>
      				
      				<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/pencil.png"></div>文具用品</td>
<!--       				<td class="productcategory" ><button class=" btn btn-default btn-lg "data-dismiss="modal">全部</button></td> -->
<!--       				<td class="productcategory" ><button class=" btn btn-default btn-lg"data-dismiss="modal">課本書籍</button></td> -->
<!--       				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">遊戲影音</button></td> -->
<!--       				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">日常用品</button></td> -->
<!--       				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">文具用品</button></td> -->
      			</tr>
      			<tr>
      			<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/sofa.png"></div>家俱</td>
      			
      			<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/televisions.png"></div>家電</td>
      			
      			<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/clothes.png"></div>服飾</td>
      				
      			<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/snake.png"></div>食品</td>
      				
      			<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/play.png" name="票券"></div>票券</td>
<!--       				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">傢俱</button></td> -->
<!--       				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">家電</button></td> -->
<!--       				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">服飾</button></td> -->
<!--       				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">食品</button></td> -->
<!--       				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">票券</button></td> -->
     					      			
      			</tr>
      			<tr>
      			   			<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/pc.png"></div>3C產品</td>
      			
      			   			<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/kiss.png"></div>化妝保養用品</td>
<!--       			<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">3C產品</button></td> -->
<!--       			<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">化妝保養用品</button></td> -->
   							<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/kiss.png"></div>運動用品</td>
   			   				<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/kiss.png"></div>女生</td>
   			   			   	<td class="productcategory"><div class="demo6"><img class="img-circle" data-dismiss="modal" style="width: 30px;"src="/resources/icon/kiss.png"></div>男生</td>
      			</tr>
      		</table>
      		<br>
      		
      		<br>
       <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
<!--       <div class="modal-footer"> -->
       
<!--       </div> -->
    </div>
  </div>
</div>
<script>
	$(".productcategory").bind("click",function(){
		$.ajax({
			contentType : "application/json",
			url : "/head/categoryhchange",
			type : "get",
			async :false,
			data : { "categoryname" : $(this).text()},
			
		});
 		$("#categoryname").text($(this).text());
		
	})
	
	$(function(){
		var who = "${user.account}";
		var role = "${user.role}";
		if(role == "ADMIN"){
			$('#back').removeAttr('style');
		}
	})
// 	$("#book").on("click",function(){
// 		$.ajax({
// 			contentType : "application/json",
// 			url : "/head/categoryhchange",
// 			type : "get",
// 			async :false,
// 			data : { "categoryname" : $('#test').text() },
// 		});
//  		$("#categoryname").text($('#test').text());
		
// 	})
</script>

