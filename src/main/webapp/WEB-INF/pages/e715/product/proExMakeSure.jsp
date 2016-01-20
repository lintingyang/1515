<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<style>
h3{
	text-align: center;
	color: #000079;
	font-weight: 800; 
}
#pName{
	font-size: large;
	font-weight: 800; 
	width:200px;
	color: red;
	padding-left: 30px; 
}
#pName2{
	font-size: large;
	font-weight: 800; 
	width:150px;
	color: red;
	padding-left: 10px;
}
#simple{
	width:200px;
	font-size: medium;
	padding-left: 30px; 
}
#simple2{
	width:150px;
	font-size: medium;
	padding-left: 10px;
}
#simple3{
	width:120px;
	font-size: medium;
}
.st1 {
	width:330px;
	margin: 15px auto;
}
.st2 {
	width:100%;
	margin: 15px 0;
}
.title {
	width:100px;
	float:left;
	text-align:right;
	padding-right:5px;
	font-size: medium;
}
.title2 {
	width:50px;
	float:left;
	text-align:right;
	font-size: medium;
}
.title3 {
	width:80px;
	float:left;
	text-align:right;
	font-size: medium;
}
.col-md-4, .col-md-12{
	box-shadow:4px 4px 12px 4px rgba(20%,20%,40%,0.5);
}
</style>
<div class="container" style="margin: 50px auto;">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-4" >
			<h3>我 將 得 到</h3>
   		 	<div class="thumbnail">
     	 		<img data-src="holder.js/300x300" alt="..." style="box-shadow:4px 4px 12px 4px rgba(20%,20%,40%,0.5);"
     	 			src="${pb[0].picture}" class="img-thumbnail" \>
      			<div class="caption">
      					<p align="center">< 商品明細 ></p>
      					<div class="st1">
							<label class="title">商品名稱：</label>
							<label id="pName">${makeSure.productBId.name}</label>
						</div>
						<div class="st1">
							<label class="title">商品描述：</label>
							<label id="simple">${makeSure.productBId.description}</label>
						</div>
						<hr>
						<p align="center">< 擁有者明細 ></p>
						<div class="st1">
							<label class="title">姓名：</label>
							<label id="simple">${makeSure.productBId.userId.name}</label>
						</div>
						<div class="st1">
							<label class="title">暱稱：</label>
							<label id="simple">${makeSure.productBId.userId.nickname}</label>
						</div>
						<div class="st1">
							<label class="title">性別：</label>
							<label id="simple">${makeSure.productBId.userId.sex}</label>
						</div>
						<div class="st1">
							<label class="title">電話：</label>
							<label id="simple">${makeSure.productBId.userId.phone}</label>
						</div>
						<div class="st1">
							<label class="title">信箱：</label>
							<label id="simple">${makeSure.productBId.userId.email}</label>
						</div>
						<div class="st1">
							<label class="title">學校名稱：</label>
							<label id="simple">${makeSure.productBId.userId.schoolName}</label>
						</div>

<!--         			<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> -->
      			</div>
    		</div>
  		</div>
  		<div class="col-md-1">
  		</div>
  		<div class="col-md-3">
	  		<div class="col-md-12">
	  			<h3>我 將 失 去</h3>
	  			<div class="thumbnail">
	     	 		<img data-src="holder.js/300x300" alt="..." style="box-shadow:4px 4px 12px 4px rgba(20%,20%,40%,0.5);"
	     	 			src="${pa[0].picture}" class="img-thumbnail" >
	      			<div class="caption" >
							<p align="center">< 我的商品 ></p>
	      					<div class="st2">
								<label class="title2">名稱：</label>
								<label id="pName2">${makeSure.productAId.name}</label>
							</div>
							<div class="st2">
								<label class="title2">描述：</label>
								<label id="simple2">${makeSure.productAId.description}</label>
							</div>
							<hr>
							<p align="center">< 我的交換資訊 ></p>
							<div class="st2">
								<label class="title3">交易地點：</label>
								<label id="simple3">${makeSure.productAId.location}</label>
							</div>
							<div class="st2">
								<label class="title3">交易期限：</label>
								<label id="simple3">${ss}</label>
							</div>
							<div class="st2">
								<label class="title3">交易方式：</label>
								<label id="simple3">${makeSure.productAId.tradeWay}</label>
							</div>
	      			</div>
	    		</div>
    		</div>
    		<div class="col-md-1"></div>
    		<div class="col-md-10">
	    		<div style="text-align: center; margin: 30px auto">
						<button id="btnExchang" type="button" class="btn btn-success btn-lg"
							onclick="javascript:location.href='exchanging?id=${makeSure.id}'">
						<span class="glyphicon glyphicon-send" aria-hidden="true"></span>我確定要換</button>
				</div>
				<div style="text-align: center;">
						<button type="button" class="btn btn-primary btn-lg"
							onclick="javascript:location.href='${makeSure.productAId.id}'">回上頁，看看其他商品</button>
				</div>
    			
    		</div>
    		<div class="col-md-1"></div>
    		
    		
    		
  		</div>
  		<div class="col-md-2">
  		</div>
	</div>
</div>

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>
