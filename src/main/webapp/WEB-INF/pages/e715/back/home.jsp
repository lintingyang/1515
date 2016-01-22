<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/pages/layout/meta.jsp"></c:import>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/pages/layout/javascript.jsp"></c:import>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/pages/layout/css.jsp"></c:import>
<%-- 	<c:import url="/WEB-INF/pages/layout/meta.jsp"></c:import> --%>
<%-- 	<c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import> --%>
<%-- 	<c:import url="/WEB-INF/pages/layout/css.jsp"></c:import> --%>
	
	<title>E715 Home</title>
</head>
<body>
<div class="wrap">
	<c:import url="${pageContext.request.contextPath}/WEB-INF/pages/layout/navigator.jsp"></c:import>
<%-- 	<c:import url="/WEB-INF/pages/layout/navigator.jsp"></c:import> --%>
	

	<div class="jumbotron">
		<div class="container" align="center">
			<img alt="" src="${pageContext.request.contextPath}/resources/imgs/logo_c.png" >
<!-- 			<img alt="" src="/resources/imgs/logo_c.png" > -->
			<h2>E715 一起易物 後台管理站</h2>
		</div>
	</div>
	<c:import url="${pageContext.request.contextPath}/WEB-INF/pages/layout/footer.jsp"></c:import>
<%-- 	<c:import url="/WEB-INF/pages/layout/footer.jsp"></c:import> --%>
</div>
</body>
</html>