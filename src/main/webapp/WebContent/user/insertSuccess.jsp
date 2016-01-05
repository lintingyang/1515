<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user.css" />


<style>
#successInsert {
	text-align: center;
	font-size: medium;
}

#successImg{
text-align: center;
}

#img1{
	width: 720px;
}

#btnGoTop{
text-align: right;
}

</style>

<script>
window.onload = function () {
	document.getElementById("goTop").onclick = goTop;
    
	   
	document.getElementById("perfectData").onclick = Next;
    
}
	function goTop() {
		location.href = "/WebContent/index.jsp";
	}
	function Next() {
		location.href = "insertStep4.jsp";
		
	}
</script>



<div>
	<div id="successImg">
		<img src="/resources/imgs/wallpaper.jpg" id="img1">
	</div>
	<p id="successInsert">恭喜您新增帳號成功</p>

  <div class="row">
  <div class="col-md-6" id="btnGoTop">
  
        <button type="button" class="btn btn-default" id="goTop">回首頁</button>
  
  </div>
  <div class="col-md-6">
  
        <button type="button" class="btn btn-default" id="perfectData">完善資料</button>
  
  </div>
</div>


</div>

<c:import url="/WebContent/layout/footer.jsp"></c:import>