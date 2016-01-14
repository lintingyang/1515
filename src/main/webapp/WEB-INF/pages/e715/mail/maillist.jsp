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
		  <li role="presentation" class="active"><button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#editemail" style="width:100px;"><span >撰寫</span></button></li>
		  <li role="presentation"><a href="#">收件匣</a></li>
		  <li role="presentation"><a href="#">重要信件</a></li>
		  <li role="presentation"><a href="#">草稿</a></li>
		  <li role="presentation"><a href="#">寄件備份</a></li>
		  <li role="presentation"><a href="#">垃圾桶</a></li>
		</ul>
		<hr>
	</div><!-- 	功能列表欄位END -->
	
	<div><!-- 全選與刪除欄位 -->
		<div class="checkbox col-md-1" >
    		<label><input type="checkbox"> 全部</label>
		</div>
		<div class ="col-md-1 deletebtn"><span class="glyphicon glyphicon-trash"></span></div>
	</div><!-- 全選與刪除欄位END -->
	
	
	<div><!-- 	EMAIL列表 -->
	<table class="table table-hover">
		<tr class="mailclick">
			<td class="mailcheckbox"><input type="checkbox"></td><td class="importentkbox"><span class="glyphicon glyphicon-star-empty"></span></td>
			<td>寄件人</td><td>寄件主旨</td><td style="text-align: right;">收件日期</td>
		</tr>
		<tr class="mailclick">
			<td class="mailcheckbox"><input type="checkbox"></td><td class="importentkbox"><span class="glyphicon glyphicon-star-empty"></span></td>
			<td>寄件人</td><td>寄件主旨</td><td style="text-align: right;">收件日期</td>
		</tr>
		<tr class="mailclick">
			<td class="mailcheckbox"><input type="checkbox"></td><td class="importentkbox"><span class="glyphicon glyphicon-star-empty"></span></td>
			<td>寄件人</td><td>寄件主旨</td><td style="text-align: right;">收件日期</td>
		</tr>
		<tr class="mailclick">
			<td class="mailcheckbox"><input type="checkbox"></td><td class="importentkbox"><span class="glyphicon glyphicon-star-empty"></span></td>
			<td>寄件人</td><td>寄件主旨</td><td style="text-align: right;">收件日期</td>
		</tr>
	
	
	</table>
	</div><!-- 	EMAIL列表END -->
	
</div>
<!-- 編輯郵件畫面 -->
<div class="modal fade" id="editemail" tabindex="-1" role="dialog" aria-labelledby="editmail" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"> </span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="editmail">編輯郵件</h4>
      </div>
      <div class="modal-body">
		<form role="form">
		
		  <div class="form-group">
		  	<label for="exampleInputEmail1">主旨</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="輸入主旨">
		  </div>
		  
		  <div class="form-group">
		    <label for="reciver">收件人</label>
		    <input type="密碼" class="form-control" id="reciver" placeholder="收件人帳號">
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputFile">內文</label>
		    <textarea  class= "form-control" rows="10" cols=""></textarea>
		    <p class="help-block">請輸入1000字以內的內文</p>
		  </div>
		  
		  <div class="checkbox">
		    <label>
		      <input type="checkbox" checked="checked"> 儲存寄件備份
		    </label>
		  </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-default" data-dismiss="modal">送出</button>
        <button type="button" class="btn btn-primary">儲存為草稿</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- 編輯郵件畫面END -->

<script>
$(".importentkbox").click(function(){
	$(this).html("<span class='glyphicon glyphicon-star'>");
})

</script>

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>