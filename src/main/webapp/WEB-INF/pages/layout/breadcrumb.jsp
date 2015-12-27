<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src='<c:url value="/assets/softleader/jquery.softleader.navigator.js" />'></script>

<ol class="breadcrumb"></ol>

<script>
$(function() {
	$(".nav").navBreadcrumb($(".breadcrumb"));
});
</script>

