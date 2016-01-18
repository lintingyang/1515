<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href='<c:url value="/assets/bootstrap-3.0.0/examples/navbar/navbar.css"/>' />
<script type="text/javascript" src='<c:url value="/assets/purl-master/purl.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/softleader/jquery.softleader.navigator.js" />'></script>

<nav class="navbar navbar-default " style="z-index:1; border:0">
	<div>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="#FFFFFF" width="65%">
<%-- 				<img src='<c:url value="/resources/imgs/logo_c.png"/>' width="100" border='0' /> --%>
				</td>
				<td bgcolor="#FFFFFF" valign="bottom" width="35%">
					<%-- runtime ENV : <b>${env}</b>(請至系統參數設定調整)<br/> --%>
					
					登入者帳號 : <b>${user.account}(${user.nickname})</b><br/>
			
				</td>
			</tr>
		</table>
	
	</div>
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/admin/index">E715 Admin Home</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li id="navHome"><a href="${pageContext.request.contextPath}/">E715首頁</a></li>

<!-- 					<li id="navBatches"><a href="#" class="dropdown-toggle" data-toggle="dropdown">安控管理<b class="caret"></b></a> -->
<!-- 						<ul class="dropdown-menu"> -->
<%-- 							<li id="navBatches"><a href="${pageContext.request.contextPath}/security/users/list">使用者管理</a></li> --%>
<%-- 							<li id="navBatches"><a href="${pageContext.request.contextPath}/security/roles/list">角色管理</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
					<li id="navBatches"><a href="#" class="dropdown-toggle" data-toggle="dropdown">管理<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li id="navBatches"><a href="${pageContext.request.contextPath}/admin/products/list">物品管理</a></li>
							<li id="navBatches"><a href="${pageContext.request.contextPath}/admin/users/list">會員管理</a></li>
						</ul>
					</li>				
					<li id="navBatches"><a href="#" class="dropdown-toggle" data-toggle="dropdown">檢舉<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li id="navBatches"><a href="${pageContext.request.contextPath}/report/products/list">檢舉物品</a></li>
							<li id="navBatches"><a href="${pageContext.request.contextPath}/report/products/questions/list">檢舉物品的問與答</a></li>
							<li id="navBatches"><a href="${pageContext.request.contextPath}/report/users/list">檢舉使用者</a></li>
						</ul>
					</li>		
<!-- 					<li id="navSettings"><a href="#" class="dropdown-toggle" data-toggle="dropdown">系統設定<b class="caret"></b></a> -->
<!-- 						<ul class="dropdown-menu"> -->
<%-- 							<li id="navSettings"><a href="${pageContext.request.contextPath}/sysparams/edit">系統參數設定</a></li> --%>
<%-- 							<li id="navSettings"><a href="${pageContext.request.contextPath}/settings/currencies/edit">常用貨幣設定</a></li> --%>
<%-- 							<li id="navSettings"><a href="${pageContext.request.contextPath}/settings/countries/edit">常用國別設定</a></li> --%>
<%-- 							<li id="navResettings"><a href="${pageContext.request.contextPath}/resettings">還原出廠預設值</a></li> --%>
<!-- 						</ul>	 -->
<!-- 					</li> -->

					<li style="margin-left: 400px;"><a href="/head/logout"><span class="glyphicon glyphicon-log-out"></span> 登出</a></li>
<%-- 					<form class="hide" id="logout" action="<c:url value="/logout" />" method="post"> --%>
<%-- 						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
<!-- 					</form> -->
			</ul>
		</div>
	</div>

</nav>

<script>
$(function() {
	var path = window.location.pathname;
	$(".nav").navActive(path);
});
</script>

