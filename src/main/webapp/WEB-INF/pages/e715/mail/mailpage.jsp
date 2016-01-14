<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp" />
<style>
.maillist >li{
	width:16%;
	text-align: center;
}
.mailcheckbox{
	width:30px;
}
.importentkbox{
	width:30px;
}
.deletebtn{


}
.deletebtn >span{
	line-height:40px;
	font-size:17px;
}
</style>

<div class="container">
	<div><!-- 	功能列表欄位 -->
		<br>
		<ul class="nav nav-pills maillist">
		  <li role="presentation" class="active"><a href="#">寄件</a></li>
		  <li role="presentation"><a href="#">收件匣</a></li>
		  <li role="presentation"><a href="#">重要信件</a></li>
		  <li role="presentation"><a href="#">草稿</a></li>
		  <li role="presentation"><a href="#">寄件備份</a></li>
		  <li role="presentation"><a href="#">垃圾桶</a></li>
		</ul>
		<hr>
	</div><!-- 	功能列表欄位END -->
	
	
	</div>
	

<script>
$(".importentkbox").click(function(){
	$(this).html("<span class='glyphicon glyphicon-star'>");
})

</script>










<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>