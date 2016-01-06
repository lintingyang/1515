<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user.css" />

<style>
#inputDep {
	width: 40%;
}

#inputAddr {
	width: 40%;
}

#inputName {
	width: 40%;
}

#inputNickName {
	width: 40%;
}

.fileImg {
	margin-top: 8px;
	margin-bottom: 0px;
}
</style>


<script>
	$(function() {
		$("#idbuthref").on('click', function() {
			window.location.href = "login.jsp";
		});
	});
</script>


<div class="container">
	<div class="row">
		<div class="col-xs-6 col-md-2"></div>

		<div class="col-xs-6 col-md-8" id="divCenter">
			<form class="form-horizontal">
				<div class="form-group" id="divBorder">
					<label for="inputEmail3" class="col-sm-2 control-label">系所:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputDep"
							placeholder="輸入系所">
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">地址:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputAddr"
							placeholder="輸入地址">
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">喜好商品類別:</label>
					<div class="col-sm-10">
						<label class="checkbox-inline"> <input type="checkbox"
							id="inlineCheckbox1" value="computer"> 電腦
						</label> <label class="checkbox-inline"> <input type="checkbox"
							id="inlineCheckbox2" value="furniture"> 家具
						</label> <label class="checkbox-inline"> <input type="checkbox"
							id="inlineCheckbox3" value="stationery"> 文具
						</label>
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">頭像:</label>
					<div class="col-sm-10 fileImg">
						<input type="file" id="exampleInputFile">
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">關於我</label>
					<div class="col-sm-10">
						<textarea rows="10" cols="70"
							onKeyDown='if (this.value.length>=300){event.returnValue=false}'></textarea>
					</div>
				</div>
				<br> <br> <br> <br> <br> <br> <br>

				<div class="form-group" id="divBorder">
					<div class="col-sm-offset-2 col-sm-10 btnLeft">
						<button type="button" class="btn btn-default" id="idbuthref">完成</button>
					</div>
				</div>

			</form>

		</div>

		<div class="col-xs-6 col-md-2"></div>
	</div>
</div>
<c:import url="/WebContent/layout/footer.jsp"></c:import>