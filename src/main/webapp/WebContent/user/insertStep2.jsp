<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/layout/header.jsp"></c:import>

<style>

#inputAccount{
width:40%;
}
#inputPassword{
width:40%;
}
#inputName{
width:40%;
}
#inputNickName{
width:40%;
}




</style>


<script>
window.onload = function () {
    document.getElementById("idbuthref").onclick = hreff;
}
function hreff() {
    location.href = "insertStep3.jsp";
}
</script>

<form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">帳號:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputAccount" placeholder="Account" maxlength="15">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密碼:</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword" placeholder="Password" maxlength="15">
    </div>
  </div>
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">姓名:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputName" placeholder="Name">
    </div>
  </div>
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">暱稱:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputNickName" placeholder="NickName">
    </div>
  </div>
 
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-default" id="idbuthref">下一步</button>
    </div>
  </div>
  
</form>
	

<c:import url="/layout/footer.jsp"></c:import>