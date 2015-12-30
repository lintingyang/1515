<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="/resources/js/jquery-1.11.3.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
product
<div style="width:500px; margin:auto;">
<table class="table" style="width: 400px;">
<tr><td>id:${ product.id }</td></tr>
<tr><td>物品名稱：${ product.name }</td></tr>
<tr><td>發表時間：${ product.postTime }</td></tr>
<tr><td>交換期限：${ product.deadline }</td></tr>
<tr><td>交換地點：${ product.location }</td></tr>
<tr><td>交換方式：${ product.tradeWay }</td></tr>
</table>




<div>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">欲交換物品</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">問與答</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">目前交換清單</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    希望交換物品：${ product.wishItem }
    </div>
    <div role="tabpanel" class="tab-pane" id="profile">profile</div>
    <div role="tabpanel" class="tab-pane" id="messages">
    ${exchangeList }
    
    <table>
	<c:forEach items="${exchange}" var="item">
	<tr>
		<td>id:${item.id}</td>	
		<td>exchangeTime:${item.exchangeTime}</td>
		<td>exchangeTime:${item.productByProductBId.name}</td>
	</tr>
	</c:forEach>

</table>
    
    </div>
    <div role="tabpanel" class="tab-pane" id="settings">...</div>
  </div>

</div>



</div>
</body>
</html>