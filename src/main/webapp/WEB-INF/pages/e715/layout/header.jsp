<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- CDN -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script> -->
<!-- <script src="//cdn.jsdelivr.net/jquery.shadow-animation/1/mainfile"></script> -->
<!-- CDN -->

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
		
		<ul class="nav navbar-nav navbar-right">
			<li id="fat-menu" class="dropdown">
			<c:choose>
					<c:when test="${!empty user.id}">
			
			<a id="drop3" href="#"
				class="dropdown-toggle" data-toggle="dropdown" role="button"
				aria-haspopup="true" aria-expanded="false"> 
				<img class="img-circle" style="width: 30px;"
					src="${user.picture}"> 
				       ${user.name}
				
					
					
					<span class="caret"></span></a>
				<ul class="dropdown-menu" aria-labelledby="drop3">
					
					<li><a class="userlist" href="/E715Member/${user.id}">會員資料</a></li>
					<li><a class="userlist" href="/E715Member/userFriend">關注名單</a></li>
					<li><a class="userlist" href="/product/list">物品管理</a></li><!-- yao -->
					<li><a class="userlist" href="/product/add">新增物品</a></li>
					<li><a class="userlist" href="/E715Member/modifyFileAsk">帳號修改</a></li>
					<li><a class="userlist" href="/head/logout">登出</a></li>
<!-- 				<li><a class="userlist" href="/head/login">登入</a></li> -->
					</ul>
					</c:when>
					<c:otherwise>
						<a  href="/head/login"
				> 
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
					
      				<td class="productcategory" ><button class=" btn btn-default btn-lg "data-dismiss="modal">全部</button></td>
      				<td class="productcategory" ><button class=" btn btn-default btn-lg"data-dismiss="modal">課本書籍</button></td>
      				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">遊戲影音</button></td>
      				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">日常用品</button></td>
      				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">文具用品</button></td>
      			</tr>
      			<tr>
      				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">傢俱</button></td>
      				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">家電</button></td>
      				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">服飾</button></td>
      				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">食品</button></td>
      				<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">票券</button></td>
     					      			
      			</tr>
      			<tr>
      			<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">3C產品</button></td>
      			<td class="productcategory" ><button class=" btn btn-default btn-lg" data-dismiss="modal">化妝保養用品</button></td>
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
	$(".productcategory").click(function(){
		
		$.ajax({
			contentType : "application/json",
			url : "/head/categoryhchange",
			type : "get",
			async :false,
			data : { "categoryname" : $(this).text() },
		});
 		$("#categoryname").text($(this).text());
		
	})
</script>

