<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>

<style>
#inputDep {
	width: 40%;
}

#inputAddr{
	width: 40%;
}

#inputName {
	width: 40%;
}

#inputNickName {
	width: 40%;
}
.fileImg{
margin-top:8px; 

margin-bottom:0px; 

}
</style>


<script>
$(function(){
$("#idbuthref").on('click',function(){
	window.location.href = "loginFirst.jsp";
	});
});
</script>

<form class="form-horizontal">
	<div class="form-group">
		<label for="inputEmail3" class="col-sm-2 control-label">系所:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="inputDep"
				placeholder="輸入系所">
		</div>
	</div>
	<div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">地址:</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" id="inputAddr"
				placeholder="輸入地址">
		</div>
	</div>
	<div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">感興趣的商品類別:</label>
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
	<div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">頭像:</label>
		<div class="col-sm-10 fileImg">
    		<input type="file" id="exampleInputFile">
		</div>
	</div>
	
	<div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">關於我</label>
		<div class="col-sm-10">
			<textarea rows="10" cols="70" onKeyDown='if (this.value.length>=300){event.returnValue=false}'></textarea>
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-default" id="idbuthref">完成</button>
		</div>
	</div>

</form>


<c:import url="/layout/footer.jsp"></c:import>