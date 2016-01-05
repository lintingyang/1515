<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>
<style>
#formInsertEmail {
	
}

#btnCenter {
	text-align: center;
}

#inputEmail3 {
	width: 75%;
}

#inputPassword3 {
	width: 25%;
}

#btnNextStep{
width:70px;
height:35px;
}
#btnCheck{
width:70px;
height:35px;
}

</style>

<script>
	window.onload = function() {
		document.getElementById("btnNextStep").onclick = hreff;
	}

	function hreff() {
		location.href = "insertStep2.jsp";
	}
</script>


<div class="row">
	<div class="col-md-6"></div>

	<div class="col-md-6">
		<form class="form-horizontal" id="formInsertEmail">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">School_Email</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3"
						placeholder="Email" >
				</div>
			</div>
			<div id="btnCenter">
				<button type="button" class="btn btn-primary" id="btnCheck"> 送出 </button>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">輸入驗證碼</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputPassword3"
						maxlength="4">
				</div>
			</div>


			<div id="btnCenter">
				<button type="button" class="btn btn-primary" id="btnNextStep">下一步</button>
			</div>

		</form>

	</div>

</div>


<c:import url="/WebContent/layout/footer.jsp"></c:import>