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

<script>
$(".importentkbox").click(function(){
	$(this).html("<span class='glyphicon glyphicon-star'>");
})
//onload
$(function(){
	var formData={"id":${product.id}}
    	$.ajax({
       		type: "GET",
       		url: "/qanda/getqanda",
      		data: formData,
       		success: function(data){
    		showtable(data);
    		},
    	dataType: "json",
   	 	contentType : "application/json"
    	});

})

</script>









<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>