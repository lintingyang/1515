<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/layout/header.jsp"></c:import>

<style>

#radioSex{
margin-top:10px; 
margin-left:5px; 
margin-right:auto; 
margin-bottom:0px;  
}

#split{
margin-left:10px; 
margin-right:10px;
}

#inputReservedEmail{
width:40%;
}
#inputPhone{
width:40%;
}




</style>


<script>
window.onload = function () {
    document.getElementById("idbuthref").onclick = hreff;
}
function hreff() {
    location.href = "insertSuccess.jsp";
}
</script>

<form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">性別:</label>
    <div class="col-sm-10" >
      <input type="radio" value="M" id="radioSex" name="sex" checked="checked"><span id="radioSex">男</span>
      <input type="radio" value="F" id="radioSex" name="sex"><span id="radioSex">女</span>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">生日:</label>
    <div class="col-sm-10">
      <select>
      	<option>1970</option>
      	<option>1971</option>
      	<option>1970</option>
      	<option>1970</option>
      </select><span id="split">/</span>
      <select>
      	<option>01</option>
      	<option>02</option>
      	<option>03</option>
      </select><span id="split">/</span>
      <select>
        <option>01</option>
      	<option>02</option>
      	<option>03</option>
      </select>
    </div>
  </div>
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">電話:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputPhone" placeholder="phone">
    </div>
  </div>
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">備用Email:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputReservedEmail" placeholder="Email">
    </div>
  </div>
 
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-default" id="idbuthref">下一步</button>
    </div>
  </div>
  
</form>
	

<c:import url="/layout/footer.jsp"></c:import>