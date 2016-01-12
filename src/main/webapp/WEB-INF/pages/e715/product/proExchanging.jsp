<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<style>
h4{
	text-align: center;
	color: #000079;
	font-weight: 600;
	font-size: large;
}
#p1{
	text-align: center;
	color: #7B7B7B;
	font-size: x-small;
}
p{
	font-size: medium;
}
span{
	font-size: x-large;
}
#d1{
	border: 1px dashed #7B7B7B;
	border-bottom: none;
}
#d2{
	border: 1px dashed #7B7B7B;
	border-right: none;
	border-top: none;
}
#d3{
	border: 1px dashed #7B7B7B;
	border-left: none;
	border-top: none;
}
</style>
<script type="text/javascript">
var startDate = new Date(${long1});
var endDate = new Date(${long2});
var spantime = (endDate - startDate)/1000;
 
function cal(){
    spantime --;
    var d = Math.floor(spantime / (24 * 3600));
    var h = Math.floor((spantime % (24*3600))/3600);
    var m = Math.floor((spantime % 3600)/(60));
    var s = Math.floor(spantime%60);
    if(spantime > 0){
	    str = d + "天 " + h + "時 " + m + "分 " + s + "秒 ";
    }else{
	    str = 0 + "天 " + 0 + "時 " + 0 + "分 " + 0 + "秒 ";
    }
    document.getElementById("pad").innerHTML = str;
}
 
window.onload = function(){
    setInterval(cal, 1000);
}
$(function(){
	var ans = "${ans}";
	if(ans == "評分成功!"){
		$('#thx').removeAttr('style');
	}
	
	var loginUser = "${user.id}";
	var productAUser = "${exchange.productAId.userId.id}";
	var productBUser = "${exchange.productBId.userId.id}";
	var productAGrade = "${exchange.productAId.grade}";
	var productBGrade = "${exchange.productBId.grade}";
	
	//登入者是雙方產品擁有者，才可有(評分跟回商品業按鈕)
	if(loginUser == productAUser || loginUser == productBUser){
		
		//登入者是A
		if(loginUser == productAUser){
			
			//已評過分則不可再評
			if(productBGrade == "GOOD" || productBGrade == "BAD" ){
				$('#makeGrade').attr('style', ' display: none');
				$('#thx').removeAttr('style');
			}
		}else{
			if(productAGrade == "GOOD" || productAGrade == "BAD" ){
				$('#makeGrade').attr('style', ' display: none');
			}
		}
	}else{
		console.log("You can't pass!!");
		$('#makeGrade').attr('style', ' display: none');
		$('#backToProduct').attr('style', ' display: none');
	}
})

</script>
<div class="container" style="margin: 50px auto;">
	<div class="alert alert-success alert-dismissible" role="alert" id="thx" style="display: none;">
  		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  		謝謝您的評分~    <strong>    交換愉快    : )</strong>
	</div>
	<div class="row">
		<div><h3 style="color:#000079">${ans}</h3></div>
		<div class="col-md-3">
   		 	<div class="thumbnail">
     	 		<img data-src="holder.js/300x300" alt="..." 
     	 			src="${exchange.productBId.userId.picture}" class="img-thumbnail">
      			<div class="caption" align="center">
						<h2>${exchange.productBId.userId.account}</h2>
						<p>${exchange.productBId.userId.name}(名字)</p>
						<p>${exchange.productBId.userId.nickname}(暱稱)</p>
						<p>${exchange.productBId.userId.phone}</p>
						<p>${exchange.productBId.userId.sex}</p>
						<p>${exchange.productBId.userId.email}</p>
						<p>${exchange.productBId.userId.schoolName}</p>
<!--         			<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> -->
      			</div>
    		</div>
  		</div>
  		<div class="col-md-6">
  			<div class="col-md-6">
				<blockquote>
					<div align="center" style="margin: 5px auto;">
						<span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
					</div>
					<h4>${exchange.productBId.name}</h4>
				  	<p id="p1">${exchange.productBId.description}</p>
				</blockquote>
			</div>
  			<div class="col-md-6">
				<blockquote>
					<div align="center" style="margin: 5px auto;">
						<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
					</div>
					<h4>${exchange.productAId.name}</h4>
				  	<p id="p1">${exchange.productAId.description}</p>
				</blockquote>
			</div>
			<div class="col-md-12">
				<div id="d1" align="center">
						<h3><span class="label label-danger">交易剩餘時間</span></h3>
						<span id="pad" style="background-color: yellow ;font-size: medium;"></span>
						<h4>交易時間</h4>
						<p>${finalTradeTime}</p>
				</div>
				<div align="center">
						<div id="d2" class="col-md-6">
							<h4>交易地點</h4>
							<p>${exchange.productAId.location}</p>
						</div>
						<div id="d3" class="col-md-6">
							<h4>交易方式</h4>
							<p>${exchange.productAId.tradeWay}</p>
						</div>
				</div>
			</div>
			<div class="col-md-12">
				<div style="text-align: center; margin: 10px auto" id="makeGrade">
					<button type="button" class="btn btn-success btn-lg" data-toggle="modal" 
						data-target="#myModal2"><span class="glyphicon glyphicon-gift" aria-hidden="true"></span>
						我已經收到商品，要進行評分~
					</button>
				</div>
				<div style="text-align: center; margin: 10px auto" id="backToProduct">
					<button type="button" class="btn btn-primary btn-lg"
						onclick="javascript:location.href='${thisProduct.id}'">回您交易的商品頁</button>
				</div>
			</div>
  		</div>
  		<div class="col-md-3">
  			<div class="thumbnail">
     	 		<img data-src="holder.js/300x300" alt="..." 
     	 			src="${exchange.productAId.userId.picture}" class="img-thumbnail">
      			<div class="caption" align="center">
						<h2>${exchange.productAId.userId.account}</h2>
						<p>${exchange.productAId.userId.name}(名字)</p>
						<p>${exchange.productAId.userId.nickname}(暱稱)</p>
						<p>${exchange.productAId.userId.phone}</p>
						<p>${exchange.productAId.userId.sex}</p>
						<p>${exchange.productAId.userId.email}</p>
						<p>${exchange.productAId.userId.schoolName}</p>
<!--         			<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> -->
      			</div>
    		</div>
  		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">為商品評分</h4>
	      </div>
	      <div class="modal-body" >
	        <p style="padding-left:50px;">我覺得此商品:</p>
	        <div style="width: 300px; margin: 0 auto;" align="center">
		        <button id="btnG" type="button" class="btn btn-success btn-lg"
		        	onclick="javascript:location.href='grade?g=5'">
	  				<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> GOOD
				</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        <button id="btnB" type="button" class="btn btn-danger btn-lg"
		        	onclick="javascript:location.href='grade?g=1'">
	  				<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span> BAD
				</button>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
<!-- 	        <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>
</div>

	<c:import url="/WebContent/layout/footer.jsp"></c:import>